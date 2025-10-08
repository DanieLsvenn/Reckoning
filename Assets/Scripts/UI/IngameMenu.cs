using System.Collections;
using System.Linq;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

public class IngameMenu : MonoBehaviour
{
    [SerializeField] private FadeSceneChanger fadeSceneChanger;
    [SerializeField] private bool findFadeChangerAutomatically = true;
    [SerializeField] private string targetScene = "MainMenu";
    [SerializeField] private GameObject Menu;
    private void Start()
    {
        // Auto-find FadeSceneChanger if not assigned
        if (fadeSceneChanger == null && findFadeChangerAutomatically)
        {
            var fadeChangers = FindObjectsOfType<FadeSceneChanger>();
            if (fadeChangers.Length > 1)
                Debug.LogWarning("[IngameMenu] Multiple FadeSceneChangers found. Using the first one: " + fadeChangers[0].name);
            fadeSceneChanger = fadeChangers.FirstOrDefault();
        }
    }

    private void Awake()
    {
        Hide();
    }

    private void Update()
    {
        bool menuActive = Menu.activeSelf;

        if (Keyboard.current.escapeKey.wasPressedThisFrame)
        {
            Debug.Log("[IngameMenu] Esc was pressed");
            if (!menuActive) Show();
            if (menuActive) Hide();
        }
        return;
    }

    public void OnContinueButtonClick()
    {
        Hide();
    }

    public void OnReturnToMainButtonClick()
    {
        StartCoroutine(SoundTrackPlayer.Instance.FadeOut());
        if (AudioManager.IsInitialized)
            AudioManager.Instance.PlaySound(SoundEffectType.MenuButton);
        StartCoroutine(ChangeScene());
    }

    public void OnOpenMenuButtonClick()
    {
        bool menuActive = Menu.activeSelf;


        Debug.Log("[IngameMenu] OpenMenuButton was pressed");
        if (!menuActive) Show();
        if (menuActive) Hide();

        return;
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

    private void Show() => Menu.SetActive(true);

    private void Hide() => Menu.SetActive(false);
}
