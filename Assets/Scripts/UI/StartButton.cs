using System.Collections;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class StartButton : MonoBehaviour
{
    [Header("Scene Transition")]
    [SerializeField] private FadeSceneChanger fadeSceneChanger;
    [SerializeField] private string targetScene = "OpeningScene";
    [SerializeField] private bool findFadeChangerAutomatically = true;
    
    private void Start()
    {
        // Auto-find FadeSceneChanger if not assigned
        if (fadeSceneChanger == null && findFadeChangerAutomatically)
        {
            fadeSceneChanger = FindObjectOfType<FadeSceneChanger>();
            if (fadeSceneChanger == null)
            {
                Debug.LogWarning("[StartButton] No FadeSceneChanger found in scene. Will use direct scene loading as fallback.");
            }
        }
    }

    public void OnStartButtonClick()
    {
        if (AudioManager.IsInitialized)
        {
            AudioManager.Instance.PlaySound(SoundEffectType.MenuButton);
        }
        StartCoroutine(ChangeScene());
    }

    private IEnumerator ChangeScene()
    {
        // Clear player prefs for new game
        PlayerPrefs.DeleteAll();
        PlayerPrefs.Save();
        
        // Use fade transition if available, otherwise direct load
        if (fadeSceneChanger != null)
        {
            fadeSceneChanger.FadeToScene(targetScene);
        }
        else
        {
            // Fallback: direct scene loading with delay
            yield return new WaitForSeconds(0.5f);
            SceneManager.LoadScene(targetScene);
        }
    }
    
    // Public method to set target scene (useful for different menu buttons)
    public void SetTargetScene(string sceneName)
    {
        targetScene = sceneName;
    }
}