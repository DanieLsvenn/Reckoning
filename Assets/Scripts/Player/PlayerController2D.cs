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

        // Don't store keyboard reference here - get it fresh each time in FixedUpdate
    }

    private void FixedUpdate()
    {
        // Value in [-1, +1] from input
        float input = 0f;
        bool leftNow = false, rightNow = false;
        bool ePressedFrame = false;

#if ENABLE_INPUT_SYSTEM
        // Get fresh keyboard reference once per frame to avoid stale references after scene transitions
        var currentKeyboard = Keyboard.current;
#endif

        // Don't process movement input if dialogue is active or ending is fading out
        if (!DialogueRunner.IsDialogueActive && !EndingTrigger.IsFadingOut)
        {
#if ENABLE_INPUT_SYSTEM
            if (currentKeyboard != null)
            {
                if (logInput && Time.frameCount % 60 == 0) // Debug every 60 frames
                    Debug.Log($"[PlayerController2D] Using Input System - Keyboard available. A:{currentKeyboard.aKey.isPressed} D:{currentKeyboard.dKey.isPressed}");

                if (currentKeyboard.aKey.isPressed || currentKeyboard.leftArrowKey.isPressed)
                {
                    input -= 1f; leftNow = true;
                    if (logInput) Debug.Log("[PlayerController2D] A/Left detected via Input System");
                    if (_walking == null)
                        _walking = StartCoroutine(WalkingSFX());
                }
                if (currentKeyboard.dKey.isPressed || currentKeyboard.rightArrowKey.isPressed)
                {
                    input += 1f; rightNow = true;
                    if (logInput) Debug.Log("[PlayerController2D] D/Right detected via Input System");
                    if (_walking == null)
                        _walking = StartCoroutine(WalkingSFX());
                }
            }
            else
            {
                if (logInput && Time.frameCount % 60 == 0) // Debug every 60 frames  
                    Debug.Log($"[PlayerController2D] Input System enabled but keyboard is null - falling back to legacy");
#endif
                input = Input.GetAxis("Horizontal");
                leftNow = Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow);
                rightNow = Input.GetKey(KeyCode.D) || Input.GetKey(KeyCode.RightArrow);
                if (logInput && (leftNow || rightNow))
                    Debug.Log($"[PlayerController2D] Legacy input - Horizontal:{input} A:{Input.GetKey(KeyCode.A)} D:{Input.GetKey(KeyCode.D)}");
                if (Mathf.Approximately(input, 0f))
                {
                    if (leftNow) input -= 1f;
                    if (rightNow) input += 1f;
                }
#if ENABLE_INPUT_SYSTEM
            }
#endif
        }
        else if (logInput && Time.frameCount % 60 == 0)
        {
            Debug.Log($"[PlayerController2D] Input blocked - Dialogue:{DialogueRunner.IsDialogueActive} Ending:{EndingTrigger.IsFadingOut}");
        }

        // Move in world space (only if dialogue is not active and not fading out)
        if (!DialogueRunner.IsDialogueActive && !EndingTrigger.IsFadingOut)
        {
            Vector3 delta = new Vector3(input * speed * Time.deltaTime, 0f, 0f);
            transform.Translate(delta, Space.World);
        }

        // Animator: true when moving, false when idle (and not in dialogue or fading out)
        if (animator)
            animator.SetBool("isRunning", !DialogueRunner.IsDialogueActive && !EndingTrigger.IsFadingOut && Mathf.Abs(input) > 0.01f);

        // Flip to face input direction (only if not in dialogue or fading out)
        if (spriteRenderer && !DialogueRunner.IsDialogueActive && !EndingTrigger.IsFadingOut && Mathf.Abs(input) > 0.01f)
        {
            bool movingRight = input > 0f;
            spriteRenderer.flipX = spriteFacesRight ? !movingRight : movingRight;
        }

        // Interact
#if ENABLE_INPUT_SYSTEM
        if (currentKeyboard != null && currentKeyboard.eKey.wasPressedThisFrame)
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
#if ENABLE_INPUT_SYSTEM
            bool usingInputSystem = currentKeyboard != null;
#else
            bool usingInputSystem = false;
#endif
            if (leftNow && !_leftPressedPrev) Debug.Log($"[PlayerController2D] A/Left pressed (backend={(usingInputSystem?"InputSystem":"Legacy")}).");
            if (!leftNow && _leftPressedPrev) Debug.Log("[PlayerController2D] A/Left released.");
            if (rightNow && !_rightPressedPrev) Debug.Log($"[PlayerController2D] D/Right pressed (backend={(usingInputSystem?"InputSystem":"Legacy")}).");
            if (!rightNow && _rightPressedPrev) Debug.Log("[PlayerController2D] D/Right released.");

            _logTimer += Time.deltaTime;
            if (_logTimer >= logThrottle)
            {
                _logTimer = 0f;
                if (Mathf.Abs(input - _lastInput) > 0.01f)
                {
                    Debug.Log($"[PlayerController2D] inputX={input:0.00} (backend={(usingInputSystem?"InputSystem":"Legacy")})");
                    _lastInput = input;
                }
            }
        }
        _leftPressedPrev = leftNow;
        _rightPressedPrev = rightNow;

        // Stop walking sound if dialogue becomes active or ending fade starts
        if ((DialogueRunner.IsDialogueActive || EndingTrigger.IsFadingOut) && _walking != null)
        {
            StopCoroutine(_walking);
            _walking = null;
        }

        // On-screen fallback line
        string dialogueStatus = DialogueRunner.IsDialogueActive ? "D:Active" : "D:Off";
        string endingStatus = EndingTrigger.IsFadingOut ? "E:Fading" : "E:Off";
        _debugLine = $"Input={input:0.00} L:{(leftNow?1:0)} R:{(rightNow?1:0)} E:{(ePressedFrame? "Down":"")} {dialogueStatus} {endingStatus}";
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
#if ENABLE_INPUT_SYSTEM
        var currentKeyboard = Keyboard.current;
        while (currentKeyboard != null && (currentKeyboard.aKey.isPressed || currentKeyboard.leftArrowKey.isPressed || currentKeyboard.dKey.isPressed || currentKeyboard.rightArrowKey.isPressed))
        {
            AudioManager.Instance.PlaySound(SoundEffectType.ConcreteStepping);
            yield return new WaitForSeconds(0.65f);
            // Refresh keyboard reference in case it changed during the wait
            currentKeyboard = Keyboard.current;
        }
#else
        // Legacy input fallback for walking sound
        while (Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.LeftArrow) || Input.GetKey(KeyCode.D) || Input.GetKey(KeyCode.RightArrow))
        {
            AudioManager.Instance.PlaySound(SoundEffectType.ConcreteStepping);
            yield return new WaitForSeconds(0.5f);
        }
#endif
        _walking = null;
    }
}