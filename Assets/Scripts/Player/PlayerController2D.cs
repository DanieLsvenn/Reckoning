using System.Collections;
using UnityEngine;
#if ENABLE_INPUT_SYSTEM
using UnityEngine.InputSystem; // add new input system support
#endif

// Ultra-simple 2D player: moves on X and toggles Animator bool "isRunning". Nothing else.
public class PlayerController2D : MonoBehaviour
{
    [SerializeField] private float speed = 5f;
    [SerializeField] private Animator animator; // assign in Inspector (must have bool "isRunning")
    [SerializeField] private SpriteRenderer spriteRenderer; // optional for facing left/right
    [Tooltip("True if your sprites face RIGHT by default; uncheck if they face LEFT.")]
    [SerializeField] private bool spriteFacesRight = true;
    [SerializeField] private KeyCode interactKey = KeyCode.E;

    // Raised when the interact key is pressed (E by default)
    public System.Action OnInteract;

#if ENABLE_INPUT_SYSTEM
    private Keyboard keyboard;
#endif

    [Header("Debug")]
    [SerializeField] private bool logInput = true;
    [SerializeField] private bool showOnScreen = true;
    [SerializeField, Min(0.05f)] private float logThrottle = 0.25f;
    private float _logTimer;
    private bool _leftPressedPrev, _rightPressedPrev;
    private float _lastInput;
    private string _debugLine = "Input: n/a";

    [Header("Interaction Routing")]
    [SerializeField] private bool fallbackRouteInteraction = true;

    // Audio related variables
    private Coroutine _walking;

    private void Reset()
    {
        animator = GetComponent<Animator>();
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void Awake()
    {
        if (animator == null)
        {
            animator = GetComponent<Animator>();
            if (animator == null)
                animator = GetComponentInChildren<Animator>();
        }
        if (spriteRenderer == null)
        {
            spriteRenderer = GetComponent<SpriteRenderer>();
            if (spriteRenderer == null)
                spriteRenderer = GetComponentInChildren<SpriteRenderer>();
        }

        // Face right on spawn, respecting source art orientation
        if (spriteRenderer != null)
        {
            spriteRenderer.flipX = spriteFacesRight ? false : true;
        }

        keyboard = Keyboard.current;
    }

    private void FixedUpdate()
    {
        // Value in [-1, +1] from input
        float input = 0f;
        bool leftNow = false, rightNow = false;
        bool ePressedFrame = false;

#if ENABLE_INPUT_SYSTEM
        if (keyboard != null)
        {
            if (keyboard.aKey.isPressed || keyboard.leftArrowKey.isPressed)
            {
                input -= 1f; leftNow = true;
                if (_walking == null)
                    _walking = StartCoroutine(WalkingSFX());
            }
            if (keyboard.dKey.isPressed || keyboard.rightArrowKey.isPressed)
            {
                input += 1f; rightNow = true;
                if (_walking == null)
                    _walking = StartCoroutine(WalkingSFX());
            }
        }
        else
#endif
        {
            input = Input.GetAxis("Horizontal");
            leftNow = Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow);
            rightNow = Input.GetKey(KeyCode.D) || Input.GetKey(KeyCode.RightArrow);
            if (Mathf.Approximately(input, 0f))
            {
                if (leftNow) input -= 1f;
                if (rightNow) input += 1f;
            }
        }

        // Move in world space
        Vector3 delta = new Vector3(input * speed * Time.deltaTime, 0f, 0f);
        transform.Translate(delta, Space.World);

        // Animator: true when moving, false when idle
        if (animator)
            animator.SetBool("isRunning", Mathf.Abs(input) > 0.01f);

        // Flip to face input direction
        if (spriteRenderer && Mathf.Abs(input) > 0.01f)
        {
            bool movingRight = input > 0f;
            spriteRenderer.flipX = spriteFacesRight ? !movingRight : movingRight;
        }

        // Interact
#if ENABLE_INPUT_SYSTEM
        if (keyboard != null && keyboard.eKey.wasPressedThisFrame)
        {
            if (logInput) Debug.Log("[PlayerController2D] E pressed via Input System (Keyboard.eKey).");
            ePressedFrame = true;
            RaiseInteract();
        }
        else
#endif
        if (Input.GetKeyDown(interactKey))
        {
            if (logInput) Debug.Log("[PlayerController2D] E pressed via legacy Input.GetKeyDown.");
            ePressedFrame = true;
            RaiseInteract();
        }

        // Debug: A/D press-release and input value (throttled)
        if (logInput)
        {
            if (leftNow && !_leftPressedPrev) Debug.Log($"[PlayerController2D] A/Left pressed (backend={(keyboard!=null?"InputSystem":"Legacy")}).");
            if (!leftNow && _leftPressedPrev) Debug.Log("[PlayerController2D] A/Left released.");
            if (rightNow && !_rightPressedPrev) Debug.Log($"[PlayerController2D] D/Right pressed (backend={(keyboard!=null?"InputSystem":"Legacy")}).");
            if (!rightNow && _rightPressedPrev) Debug.Log("[PlayerController2D] D/Right released.");

            _logTimer += Time.deltaTime;
            if (_logTimer >= logThrottle)
            {
                _logTimer = 0f;
                if (Mathf.Abs(input - _lastInput) > 0.01f)
                {
                    Debug.Log($"[PlayerController2D] inputX={input:0.00} (backend={(keyboard!=null?"InputSystem":"Legacy")})");
                    _lastInput = input;
                }
            }
        }
        _leftPressedPrev = leftNow;
        _rightPressedPrev = rightNow;

        // On-screen fallback line
        _debugLine = $"InputX={input:0.00}  Left={(leftNow?1:0)} Right={(rightNow?1:0)}  E={(ePressedFrame? "Down":"")}";
    }

    private void OnGUI()
    {
        if (!showOnScreen || !logInput) return;
        GUI.Label(new Rect(10, 10, 600, 20), $"[PlayerController2D] {_debugLine}");
    }

    private void RaiseInteract()
    {
        int count = OnInteract?.GetInvocationList().Length ?? 0;
        if (count == 0)
        {
            if (logInput) Debug.LogWarning("[PlayerController2D] Interact pressed, but no listeners are subscribed to OnInteract. Using fallback routing.");
            if (fallbackRouteInteraction)
                FallbackRouteInteract();
            return;
        }
        try
        {
            OnInteract?.Invoke();
            if (logInput)
                Debug.Log($"[PlayerController2D] OnInteract invoked. Subscribers: {count}");
        }
        catch (System.Exception ex)
        {
            Debug.LogError($"[PlayerController2D] OnInteract handler threw: {ex}");
        }
    }

    private void FallbackRouteInteract()
    {
        // Find nearest PhilosopherNPC and call TryInteract(); it will only fire if player is in range.
        var npcs = FindObjectsByType<PhilosopherNPC>(FindObjectsSortMode.None);
        if (npcs == null || npcs.Length == 0)
        {
            if (logInput) Debug.LogWarning("[PlayerController2D] Fallback route: no PhilosopherNPC found in scene.");
            return;
        }
        var me = transform.position;
        PhilosopherNPC best = null;
        float bestDist = float.MaxValue;
        foreach (var npc in npcs)
        {
            if (!npc) continue;
            float d = (npc.transform.position - me).sqrMagnitude;
            if (d < bestDist) { bestDist = d; best = npc; }
        }
        if (best != null)
        {
            if (logInput) Debug.Log($"[PlayerController2D] Fallback route: calling TryInteract() on nearest NPC '{best.name}'.");
            best.TryInteract();
        }
    }

    // Audio stuffs
    private IEnumerator WalkingSFX()
    {
        while (keyboard.aKey.isPressed || keyboard.leftArrowKey.isPressed || keyboard.dKey.isPressed || keyboard.rightArrowKey.isPressed)
        {
        AudioManager.Instance.PlaySound(SoundEffectType.ConcreteStepping);
            yield return new WaitForSeconds(0.5f);
        }
        _walking = null;
    }
}