using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Example integration script showing how to add fade transitions to existing menu buttons.
/// Attach this to any GameObject in your MainMenu scene.
/// </summary>
public class MenuFadeIntegration : MonoBehaviour
{
    [Header("Integration Settings")]
    [SerializeField] private FadeSceneChanger fadeChanger;
    [SerializeField] private float buttonFeedbackDelay = 0.1f;
    
    private void Start()
    {
        SetupFadeIntegration();
    }
    
    private void SetupFadeIntegration()
    {
        // Find or create FadeSceneChanger
        if (fadeChanger == null)
        {
            fadeChanger = FindObjectOfType<FadeSceneChanger>();
            if (fadeChanger == null)
            {
                GameObject fadeGO = new GameObject("AutoFadeSceneChanger");
                fadeChanger = fadeGO.AddComponent<FadeSceneChanger>();
                Debug.Log("[MenuFadeIntegration] Created FadeSceneChanger automatically.");
            }
        }
    }
    
    // Call this from your existing Start button onClick
    public void StartGameWithFade()
    {
        // Clear save data
        PlayerPrefs.DeleteAll();
        PlayerPrefs.Save();
        
        // Fade to opening scene
        fadeChanger.FadeToScene("OpeningScene");
    }
    
    // Call this for any other menu button that should fade to a scene
    public void FadeToScene(string sceneName)
    {
        fadeChanger.FadeToScene(sceneName);
    }
    
    // Example: Continue Game button
    public void ContinueGameWithFade()
    {
        fadeChanger.FadeToScene("Main");
    }
    
    // Example: Options button
    public void OptionsWithFade()
    {
        fadeChanger.FadeToScene("Options");
    }
    
    // Example: Credits button  
    public void CreditsWithFade()
    {
        fadeChanger.FadeToScene("Credits");
    }
}

/*
USAGE INSTRUCTIONS:

1. Add this script to any GameObject in your MainMenu scene
2. In your UI Button's OnClick event:
   - Remove or keep your existing method
   - Add this GameObject → MenuFadeIntegration → StartGameWithFade()

3. The fade will automatically:
   - Create a black overlay if needed
   - Fade to black over 3 seconds
   - Load the target scene

EXAMPLE BUTTON SETUP:
- Start Button → OnClick → MenuFadeIntegration.StartGameWithFade()
- Continue Button → OnClick → MenuFadeIntegration.ContinueGameWithFade()  
- Options Button → OnClick → MenuFadeIntegration.OptionsWithFade()
- Credits Button → OnClick → MenuFadeIntegration.CreditsWithFade()
*/