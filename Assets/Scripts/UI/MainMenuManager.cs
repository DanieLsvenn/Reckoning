using UnityEngine;
using UnityEngine.UI;
using System.Collections;

/// <summary>
/// Main Menu Manager that handles menu interactions and scene transitions with fade effects.
/// Integrates with FadeSceneChanger for smooth black fade transitions.
/// </summary>
public class MainMenuManager : MonoBehaviour
{
    [Header("Scene Names")]
    [SerializeField] private string mainGameScene = "Main";
    [SerializeField] private string optionsScene = "Options";
    [SerializeField] private string creditsScene = "Credits";
    [SerializeField] private string openingScene = "OpeningScene";
    
    [Header("Fade System")]
    [SerializeField] private FadeSceneChanger fadeChanger;
    [SerializeField] private bool findFadeChangerAutomatically = true;
    
    [Header("Menu Buttons")]
    [SerializeField] private Button startButton;
    [SerializeField] private Button optionsButton;
    [SerializeField] private Button creditsButton;
    [SerializeField] private Button quitButton;
    
    [Header("Audio")]
    [SerializeField] private bool playButtonSounds = true;
    
    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    private void Start()
    {
        SetupFadeChanger();
        SetupButtons();
        
        if (showDebugLogs)
            Debug.Log("[MainMenuManager] Main Menu initialized.");
    }

    private void SetupFadeChanger()
    {
        if (fadeChanger == null && findFadeChangerAutomatically)
        {
            fadeChanger = FindObjectOfType<FadeSceneChanger>();
            
            if (fadeChanger == null)
            {
                // Create a FadeSceneChanger if none exists
                GameObject fadeGO = new GameObject("FadeSceneChanger");
                fadeChanger = fadeGO.AddComponent<FadeSceneChanger>();
                
                if (showDebugLogs)
                    Debug.Log("[MainMenuManager] Created FadeSceneChanger automatically.");
            }
        }
    }

    private void SetupButtons()
    {
        // Auto-assign buttons if not set
        if (startButton == null) startButton = GameObject.Find("StartButton")?.GetComponent<Button>();
        if (optionsButton == null) optionsButton = GameObject.Find("OptionsButton")?.GetComponent<Button>();
        if (creditsButton == null) creditsButton = GameObject.Find("CreditsButton")?.GetComponent<Button>();
        if (quitButton == null) quitButton = GameObject.Find("QuitButton")?.GetComponent<Button>();

        // Add listeners
        if (startButton != null) startButton.onClick.AddListener(OnStartGame);
        if (optionsButton != null) optionsButton.onClick.AddListener(OnOptions);
        if (creditsButton != null) creditsButton.onClick.AddListener(OnCredits);
        if (quitButton != null) quitButton.onClick.AddListener(OnQuit);
    }

    public void OnStartGame()
    {
        PlayButtonSound();
        
        if (showDebugLogs)
            Debug.Log("[MainMenuManager] Starting new game...");
        
        StartCoroutine(StartNewGame());
    }

    public void OnOptions()
    {
        PlayButtonSound();
        
        if (showDebugLogs)
            Debug.Log("[MainMenuManager] Opening options...");
        
        FadeToScene(optionsScene);
    }

    public void OnCredits()
    {
        PlayButtonSound();
        
        if (showDebugLogs)
            Debug.Log("[MainMenuManager] Opening credits...");
        
        FadeToScene(creditsScene);
    }

    public void OnQuit()
    {
        PlayButtonSound();
        
        if (showDebugLogs)
            Debug.Log("[MainMenuManager] Quitting application...");
        
        StartCoroutine(QuitApplication());
    }

    private IEnumerator StartNewGame()
    {
        // Clear save data for new game
        PlayerPrefs.DeleteAll();
        PlayerPrefs.Save();
        
        // Small delay for button feedback
        yield return new WaitForSeconds(0.1f);
        
        // Choose which scene to load (opening cutscene or main game)
        string targetScene = string.IsNullOrEmpty(openingScene) ? mainGameScene : openingScene;
        FadeToScene(targetScene);
    }

    private IEnumerator QuitApplication()
    {
        // Small delay for button feedback
        yield return new WaitForSeconds(0.2f);
        
        #if UNITY_EDITOR
            UnityEditor.EditorApplication.isPlaying = false;
        #else
            Application.Quit();
        #endif
    }

    private void FadeToScene(string sceneName)
    {
        if (fadeChanger != null)
        {
            fadeChanger.FadeToScene(sceneName);
        }
        else
        {
            Debug.LogWarning("[MainMenuManager] No FadeSceneChanger available. Loading scene directly.");
            UnityEngine.SceneManagement.SceneManager.LoadScene(sceneName);
        }
    }

    private void PlayButtonSound()
    {
        if (!playButtonSounds) return;
        
        if (AudioManager.IsInitialized)
        {
            AudioManager.Instance.PlaySound(SoundEffectType.DialogueChoice);
        }
    }

    // Public methods for UI buttons to call directly
    [System.Obsolete("Use OnStartGame() instead")]
    public void StartGame() => OnStartGame();
    
    public void LoadScene(string sceneName)
    {
        PlayButtonSound();
        FadeToScene(sceneName);
    }

    // Context menu methods for testing
    [ContextMenu("Test Start Game")]
    public void TestStartGame() => OnStartGame();
    
    [ContextMenu("Test Fade Effect")]
    public void TestFadeEffect()
    {
        if (fadeChanger != null)
            fadeChanger.TestFadeEffect();
    }
}