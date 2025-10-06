using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class FadeSceneChanger : MonoBehaviour
{
    [Header("Fade Settings")]
    public Image fadeImage;
    public float fadeDuration = 3f;
    public string sceneToLoad;
    [SerializeField] private bool createFadeImageAutomatically = true;
    
    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    private bool isFading = false;

    private void Start()
    {
        SetupFadeImage();
    }

    public void StartGame()
    {
        if (!isFading)
            StartCoroutine(FadeAndLoadScene());
    }
    
    // Alternative method that can be called by other scripts
    public void FadeToScene(string sceneName)
    {
        if (!isFading)
        {
            sceneToLoad = sceneName;
            StartCoroutine(FadeAndLoadScene());
        }
    }

    private void SetupFadeImage()
    {
        if (fadeImage != null)
        {
            // Ensure fade image starts transparent and non-interactive
            Color c = fadeImage.color;
            c.a = 0f;
            fadeImage.color = c;
            fadeImage.raycastTarget = false; // Don't block clicks when transparent
            return;
        }

        if (!createFadeImageAutomatically) return;

        // Find or create Canvas for fade overlay
        Canvas fadeCanvas = null;
        
        // First, try to find an existing FadeCanvas
        Canvas[] allCanvases = FindObjectsOfType<Canvas>();
        foreach (Canvas c in allCanvases)
        {
            if (c.name == "FadeCanvas")
            {
                fadeCanvas = c;
                break;
            }
        }
        
        // If no FadeCanvas found, create one with very high sorting order
        if (fadeCanvas == null)
        {
            GameObject canvasGO = new GameObject("FadeCanvas");
            fadeCanvas = canvasGO.AddComponent<Canvas>();
            fadeCanvas.renderMode = RenderMode.ScreenSpaceOverlay;
            
            // Use extremely high sorting order to ensure it's above ALL other UI
            int maxSortingOrder = 0;
            foreach (Canvas c in allCanvases)
            {
                if (c.sortingOrder > maxSortingOrder)
                    maxSortingOrder = c.sortingOrder;
            }
            // Use either calculated max + 100, or absolute minimum of 32767 (max short value)
            fadeCanvas.sortingOrder = Mathf.Max(maxSortingOrder + 100, 32000);
            
            canvasGO.AddComponent<GraphicRaycaster>();
            
            if (showDebugLogs)
                Debug.Log($"[FadeSceneChanger] Created FadeCanvas with sorting order: {fadeCanvas.sortingOrder}");
        }

        // Create black fade overlay
        GameObject overlayGO = new GameObject("BlackFadeOverlay");
        overlayGO.transform.SetParent(fadeCanvas.transform, false);

        fadeImage = overlayGO.AddComponent<Image>();
        fadeImage.color = new Color(0f, 0f, 0f, 0f); // Black, fully transparent
        
        // IMPORTANT: Disable raycast target so it doesn't block clicks when transparent
        fadeImage.raycastTarget = false;

        // Make it fullscreen
        RectTransform rectTransform = fadeImage.GetComponent<RectTransform>();
        rectTransform.anchorMin = Vector2.zero;
        rectTransform.anchorMax = Vector2.one;
        rectTransform.offsetMin = Vector2.zero;
        rectTransform.offsetMax = Vector2.zero;

        if (showDebugLogs)
            Debug.Log("[FadeSceneChanger] Created black fade overlay automatically.");
    }

    private IEnumerator FadeAndLoadScene()
    {
        if (fadeImage == null)
        {
            Debug.LogWarning("[FadeSceneChanger] No fade image found! Loading scene immediately.");
            if (!string.IsNullOrEmpty(sceneToLoad))
                SceneManager.LoadScene(sceneToLoad);
            yield break;
        }

        isFading = true;

        if (showDebugLogs)
            Debug.Log($"[FadeSceneChanger] Starting {fadeDuration}-second black fade-out to scene: {sceneToLoad}");

        // Enable raycast blocking now that we're fading (prevents clicking during fade)
        fadeImage.raycastTarget = true;

        // Fade to black
        float elapsedTime = 0f;
        Color startColor = fadeImage.color;
        Color endColor = new Color(0f, 0f, 0f, 1f); // Black, fully opaque

        while (elapsedTime < fadeDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / fadeDuration;
            fadeImage.color = Color.Lerp(startColor, endColor, t);
            yield return null;
        }

        // Ensure it's fully black
        fadeImage.color = endColor;

        if (showDebugLogs)
            Debug.Log("[FadeSceneChanger] Fade complete. Loading scene...");

        // Load the scene
        if (!string.IsNullOrEmpty(sceneToLoad))
            SceneManager.LoadScene(sceneToLoad);
        else
            Debug.LogError("[FadeSceneChanger] No scene to load specified!");
    }

    // Public method to test the fade effect without loading a scene
    [ContextMenu("Test Fade Effect")]
    public void TestFadeEffect()
    {
        if (!isFading)
        {
            StartCoroutine(TestFadeCoroutine());
        }
    }
    
    // Debug method to check all canvas sorting orders
    [ContextMenu("Debug Canvas Sorting Orders")]
    public void DebugCanvasSortingOrders()
    {
        Canvas[] allCanvases = FindObjectsOfType<Canvas>();
        Debug.Log($"[FadeSceneChanger] Found {allCanvases.Length} canvases:");
        
        foreach (Canvas c in allCanvases)
        {
            string parentInfo = c.transform.parent ? $" (Parent: {c.transform.parent.name})" : " (Root)";
            Debug.Log($"[FadeSceneChanger] Canvas '{c.name}' - Sorting Order: {c.sortingOrder}{parentInfo}");
        }
        
        if (fadeImage != null && fadeImage.canvas != null)
        {
            Debug.Log($"[FadeSceneChanger] Fade overlay is on canvas '{fadeImage.canvas.name}' with sorting order: {fadeImage.canvas.sortingOrder}");
        }
    }

    private IEnumerator TestFadeCoroutine()
    {
        if (showDebugLogs)
            Debug.Log("[FadeSceneChanger] Testing fade effect...");

        if (fadeImage == null)
        {
            Debug.LogWarning("[FadeSceneChanger] No fade image for testing!");
            yield break;
        }

        isFading = true;

        // Fade to black
        float elapsedTime = 0f;
        Color startColor = fadeImage.color;
        Color endColor = new Color(0f, 0f, 0f, 1f);

        while (elapsedTime < fadeDuration)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / fadeDuration;
            fadeImage.color = Color.Lerp(startColor, endColor, t);
            yield return null;
        }

        // Wait a moment, then fade back
        yield return new WaitForSeconds(1f);

        elapsedTime = 0f;
        while (elapsedTime < 1f)
        {
            elapsedTime += Time.deltaTime;
            float t = elapsedTime / 1f;
            fadeImage.color = Color.Lerp(endColor, startColor, t);
            yield return null;
        }

        fadeImage.color = startColor;
        isFading = false;
        
        if (showDebugLogs)
            Debug.Log("[FadeSceneChanger] Fade test complete.");
    }
}
