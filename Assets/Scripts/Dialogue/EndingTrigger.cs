using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;

public class EndingTrigger : MonoBehaviour
{
    [Header("Scene Names")]
    [SerializeField] private string sageEndingScene = "Ending_Sage";
    [SerializeField] private string changemakerEndingScene = "Ending_Changemaker";
    [SerializeField] private string wandererEndingScene = "Ending_Wanderer";
    
    [Header("Fade Effect")]
    [SerializeField] private float fadeOutDuration = 4f;
    [SerializeField] private Image fadeOverlay;
    [SerializeField] private bool createFadeOverlayAutomatically = true;
    
    [Header("Debug Info")]
    [SerializeField] private bool showDebugInfo = true;
    [SerializeField] private EndingType predictedEnding;
    
    private bool isTriggered = false; // Prevent multiple triggers
    
    // Static flag to indicate when ending fadeout is happening (used by PlayerController)
    public static bool IsFadingOut { get; private set; } = false;
    
    public enum EndingType
    {
        Sage,
        Changemaker,
        Wanderer,
        None
    }

    private void Start()
    {
        // Update predicted ending for inspector visualization
        UpdatePredictedEnding();
        
        // Create fade overlay if needed
        SetupFadeOverlay();
    }

    private void Update()
    {
        // Update predicted ending every frame for real-time preview
        if (Application.isPlaying)
        {
            UpdatePredictedEnding();
        }
    }

    private void UpdatePredictedEnding()
    {
        if (MoralSystem.Instance != null)
        {
            predictedEnding = CalculateEnding();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        // Check if the player entered the trigger
        if (other.CompareTag("Player"))
        {
            TriggerEnding();
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        // Support for 2D colliders as well
        if (other.CompareTag("Player"))
        {
            TriggerEnding();
        }
    }

    public void TriggerEnding()
    {
        // Prevent multiple triggers
        if (isTriggered) return;
        isTriggered = true;
        
        if (MoralSystem.Instance == null)
        {
            Debug.LogError("[EndingTrigger] MoralSystem instance not found! Cannot determine ending.");
            return;
        }

        EndingType ending = CalculateEnding();
        
        if (showDebugInfo)
        {
            LogMoralValues();
            Debug.Log($"[EndingTrigger] Determined ending: {ending}");
        }

        // Start fade-out coroutine instead of immediately loading scene
        StartCoroutine(FadeOutAndLoadScene(ending));
    }

    private EndingType CalculateEnding()
    {
        if (MoralSystem.Instance == null) 
        {
            Debug.LogError("[EndingTrigger] MoralSystem.Instance is null!");
            return EndingType.None;
        }

        // Get all moral axis values
        int idealism = MoralSystem.Instance.Get(MoralAxis.Idealism);
        int materialism = MoralSystem.Instance.Get(MoralAxis.Materialism);
        int rationalism = MoralSystem.Instance.Get(MoralAxis.Rationalism);
        int empiricism = MoralSystem.Instance.Get(MoralAxis.Empiricism);
        int order = MoralSystem.Instance.Get(MoralAxis.Order);
        int chaos = MoralSystem.Instance.Get(MoralAxis.Chaos);
        int pessimism = MoralSystem.Instance.Get(MoralAxis.Pessimism);

        // Debug log all values
        Debug.Log($"[EndingTrigger] Raw values - Idealism:{idealism}, Materialism:{materialism}, Rationalism:{rationalism}, Empiricism:{empiricism}, Order:{order}, Chaos:{chaos}, Pessimism:{pessimism}");

        // Apply ending calculation formula
        
        // Rule 1: If Pessimism ≥ 10 → THE WANDERER
        Debug.Log($"[EndingTrigger] Checking Rule 1 - Pessimism ({pessimism}) >= 10? {pessimism >= 10}");
        if (pessimism >= 10)
        {
            Debug.Log("[EndingTrigger] Rule 1 triggered: THE WANDERER (High Pessimism)");
            return EndingType.Wanderer;
        }

        // Rule 2: If (Idealism + Rationalism + Order) ≥ 15 → THE SAGE
        int sageScore = idealism + rationalism + order;
        Debug.Log($"[EndingTrigger] Checking Rule 2 - Sage Score ({idealism}+{rationalism}+{order}={sageScore}) >= 15? {sageScore >= 15}");
        if (sageScore >= 15)
        {
            Debug.Log("[EndingTrigger] Rule 2 triggered: THE SAGE (High Idealism+Rationalism+Order)");
            return EndingType.Sage;
        }

        // Rule 3: If (Materialism + Empiricism + Chaos) ≥ 15 → THE CHANGEMAKER
        int changemakerScore = materialism + empiricism + chaos;
        Debug.Log($"[EndingTrigger] Checking Rule 3 - Changemaker Score ({materialism}+{empiricism}+{chaos}={changemakerScore}) >= 15? {changemakerScore >= 15}");
        if (changemakerScore >= 15)
        {
            Debug.Log("[EndingTrigger] Rule 3 triggered: THE CHANGEMAKER (High Materialism+Empiricism+Chaos)");
            return EndingType.Changemaker;
        }

        // Rule 4: Otherwise → Ending determined by highest individual score
        int maxValue = Mathf.Max(idealism, materialism, rationalism, empiricism, order, chaos, pessimism);
        Debug.Log($"[EndingTrigger] Rule 4 - Highest individual score: {maxValue}");
        
        // Find which axis has the highest value (in case of ties, priority order matters)
        if (pessimism == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE WANDERER (Highest Pessimism)");
            return EndingType.Wanderer;
        }
        if (idealism == maxValue || rationalism == maxValue || order == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE SAGE (Highest Sage-related axis)");
            return EndingType.Sage;
        }
        if (materialism == maxValue || empiricism == maxValue || chaos == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE CHANGEMAKER (Highest Changemaker-related axis)");
            return EndingType.Changemaker;
        }

        // Default fallback (shouldn't happen, but just in case)
        Debug.Log("[EndingTrigger] Fallback triggered: THE WANDERER (Default)");
        return EndingType.Wanderer;
    }

    private void LoadEndingScene(EndingType ending)
    {
        string sceneToLoad = "";
        
        switch (ending)
        {
            case EndingType.Sage:
                sceneToLoad = sageEndingScene;
                break;
            case EndingType.Changemaker:
                sceneToLoad = changemakerEndingScene;
                break;
            case EndingType.Wanderer:
                sceneToLoad = wandererEndingScene;
                break;
            default:
                Debug.LogError($"[EndingTrigger] Unknown ending type: {ending}");
                return;
        }

        if (string.IsNullOrEmpty(sceneToLoad))
        {
            Debug.LogError($"[EndingTrigger] Scene name not set for ending: {ending}");
            return;
        }

        Debug.Log($"[EndingTrigger] Loading ending scene: {sceneToLoad}");
        SceneManager.LoadScene(sceneToLoad);
    }

    private void LogMoralValues()
    {
        Debug.Log("=== ENDING CALCULATION ===");
        Debug.Log($"Idealism: {MoralSystem.Instance.Get(MoralAxis.Idealism)}");
        Debug.Log($"Materialism: {MoralSystem.Instance.Get(MoralAxis.Materialism)}");
        Debug.Log($"Rationalism: {MoralSystem.Instance.Get(MoralAxis.Rationalism)}");
        Debug.Log($"Empiricism: {MoralSystem.Instance.Get(MoralAxis.Empiricism)}");
        Debug.Log($"Order: {MoralSystem.Instance.Get(MoralAxis.Order)}");
        Debug.Log($"Chaos: {MoralSystem.Instance.Get(MoralAxis.Chaos)}");
        Debug.Log($"Pessimism: {MoralSystem.Instance.Get(MoralAxis.Pessimism)}");
        
        int sageScore = MoralSystem.Instance.Get(MoralAxis.Idealism) + 
                       MoralSystem.Instance.Get(MoralAxis.Rationalism) + 
                       MoralSystem.Instance.Get(MoralAxis.Order);
        int changemakerScore = MoralSystem.Instance.Get(MoralAxis.Materialism) + 
                              MoralSystem.Instance.Get(MoralAxis.Empiricism) + 
                              MoralSystem.Instance.Get(MoralAxis.Chaos);
        
        Debug.Log($"Sage Score (Idealism + Rationalism + Order): {sageScore}");
        Debug.Log($"Changemaker Score (Materialism + Empiricism + Chaos): {changemakerScore}");
        Debug.Log("===========================");
    }

    // Public method to manually trigger ending (useful for testing)
    [ContextMenu("Test Trigger Ending")]
    public void TestTriggerEnding()
    {
        TriggerEnding();
    }

    // Public method to check what ending would be triggered without loading the scene
    [ContextMenu("Preview Ending")]
    public void PreviewEnding()
    {
        if (MoralSystem.Instance == null)
        {
            Debug.LogWarning("[EndingTrigger] MoralSystem instance not found!");
            return;
        }

        EndingType ending = CalculateEnding();
        predictedEnding = ending;
        LogMoralValues();
        Debug.Log($"[EndingTrigger] Predicted ending: {ending}");
    }
    
    private void SetupFadeOverlay()
    {
        if (fadeOverlay != null) 
        {
            // Ensure overlay starts transparent
            Color c = fadeOverlay.color;
            c.a = 0f;
            fadeOverlay.color = c;
            return;
        }
        
        if (!createFadeOverlayAutomatically) return;
        
        // Find or create Canvas
        Canvas canvas = FindObjectOfType<Canvas>();
        if (canvas == null)
        {
            GameObject canvasGO = new GameObject("FadeCanvas");
            canvas = canvasGO.AddComponent<Canvas>();
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvas.sortingOrder = 9999; // Ensure it's on top
            canvasGO.AddComponent<GraphicRaycaster>();
        }
        
        // Create fade overlay
        GameObject overlayGO = new GameObject("WhiteFadeOverlay");
        overlayGO.transform.SetParent(canvas.transform, false);
        
        fadeOverlay = overlayGO.AddComponent<Image>();
        fadeOverlay.color = new Color(1f, 1f, 1f, 0f); // White, fully transparent
        
        // Make it fullscreen
        RectTransform rectTransform = fadeOverlay.GetComponent<RectTransform>();
        rectTransform.anchorMin = Vector2.zero;
        rectTransform.anchorMax = Vector2.one;
        rectTransform.offsetMin = Vector2.zero;
        rectTransform.offsetMax = Vector2.zero;
        
        Debug.Log("[EndingTrigger] Created white fade overlay automatically.");
    }
    
    private IEnumerator FadeOutAndLoadScene(EndingType ending)
    {
        if (fadeOverlay == null)
        {
            Debug.LogWarning("[EndingTrigger] No fade overlay found! Loading scene immediately.");
            LoadEndingScene(ending);
            yield break;
        }
        
        Debug.Log($"[EndingTrigger] Starting {fadeOutDuration}-second white fade-out...");
        
        // Disable player movement during fade by setting a static flag that PlayerController can check
        EndingTrigger.IsFadingOut = true;
        
        float elapsedTime = 0f;
        Color startColor = fadeOverlay.color;
        Color endColor = new Color(1f, 1f, 1f, 1f); // White, fully opaque
        
        // Fade from transparent to white over the specified duration
        while (elapsedTime < fadeOutDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / fadeOutDuration;
            
            fadeOverlay.color = Color.Lerp(startColor, endColor, t);
            yield return null;
        }
        
        // Ensure it's fully white
        fadeOverlay.color = endColor;
        
        Debug.Log("[EndingTrigger] Fade-out complete. Loading ending scene...");

        // Fade music out before loading the ending screen
        StartCoroutine(SoundTrackPlayer.Instance.FadeOut());

        // Load the ending scene
        LoadEndingScene(ending);
    }
    
    // Public method to test the fade effect without triggering ending
    [ContextMenu("Test Fade Effect")]
    public void TestFadeEffect()
    {
        if (!isTriggered)
        {
            StartCoroutine(TestFadeCoroutine());
        }
    }
    
    private IEnumerator TestFadeCoroutine()
    {
        Debug.Log("[EndingTrigger] Testing fade effect...");
        
        if (fadeOverlay == null)
        {
            Debug.LogWarning("[EndingTrigger] No fade overlay for testing!");
            yield break;
        }
        
        // Fade to white
        float elapsedTime = 0f;
        Color startColor = fadeOverlay.color;
        Color endColor = new Color(1f, 1f, 1f, 1f);
        
        while (elapsedTime < fadeOutDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / fadeOutDuration;
            fadeOverlay.color = Color.Lerp(startColor, endColor, t);
            yield return null;
        }
        
        // Wait a moment, then fade back
        yield return new WaitForSeconds(1f);
        
        elapsedTime = 0f;
        while (elapsedTime < 1f)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / 1f;
            fadeOverlay.color = Color.Lerp(endColor, startColor, t);
            yield return null;
        }
        
        fadeOverlay.color = startColor;
        Debug.Log("[EndingTrigger] Fade test complete.");
    }
}