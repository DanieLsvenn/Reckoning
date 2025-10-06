using UnityEngine;

public class QuitButton : MonoBehaviour
{
    public void OnQuitButtonClick()
    {
        if (AudioManager.IsInitialized)
        {
            AudioManager.Instance.PlaySound(SoundEffectType.MenuButton);
        }
        StartCoroutine(SoundTrackPlayer.Instance.FadeOut());
        Application.Quit();
    }
}
