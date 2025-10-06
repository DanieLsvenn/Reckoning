using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SoundTrackPlayer : MonoBehaviour
{
    public static SoundTrackPlayer Instance { get; private set; }

    [SerializeField] private SoundTrackList soundTrack;

    public static bool IsInitialized => Instance != null;

    private void Start()
    {
        // Singleton setup
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);

            // First persistent instance: play its soundtrack
            StartCoroutine(FadeIn());
        }
        else if (Instance != this)
        {
            // If the new scene's SoundTrackPlayer uses a different soundtrack,
            // use its track instead of keeping the old one.
            if (Instance.soundTrack != this.soundTrack)
            {
                // Replace soundtrack on the existing (persistent) instance
                Instance.StartCoroutine(Instance.CrossfadeToNewTrack(this.soundTrack, 0.5f));
            }

            // Destroy the duplicate to maintain singleton
            Destroy(gameObject);
        }
    }

    public void SetSoundTrack(SoundTrackList newSoundTrack, float soundTrackSwitchDelay)
    {
        if (newSoundTrack == soundTrack) return; // Already playing this soundtrack

        soundTrack = newSoundTrack;
        StartCoroutine(CrossfadeToNewTrack(soundTrack, soundTrackSwitchDelay));
    }

    private IEnumerator CrossfadeToNewTrack(SoundTrackList newSoundTrack, float soundTrackSwitchDelay)
    {
        if (AudioManager.Instance == null) yield break;

        float fadeTime = 1f;
        float startVolume = AudioManager.Instance.musicSource.volume;

        // Fade out
        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(startVolume, 0f, t / fadeTime);
            yield return null;
        }

        AudioManager.Instance.musicSource.Stop();
        AudioManager.Instance.musicSource.clip = AudioManager.Instance.soundTracks[(int)newSoundTrack].Sounds;

        yield return new WaitForSeconds(soundTrackSwitchDelay);

        AudioManager.Instance.musicSource.Play();

        // Fade in
        float endVolume = PlayerPrefs.GetFloat(AudioManager.MUSIC_KEY, 1f);
        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(0f, endVolume, t / fadeTime);
            yield return null;
        }
        AudioManager.Instance.musicSource.volume = endVolume;


        // Update the soundtrack reference after transition
        soundTrack = newSoundTrack;
    }

    public IEnumerator FadeOut()
    {
        if (AudioManager.Instance == null) yield break;

        float fadeTime = 1f;
        float startVolume = AudioManager.Instance.musicSource.volume;

        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(startVolume, 0f, t / fadeTime);
            yield return null;
        }
        AudioManager.Instance.musicSource.volume = 0;
    }

    private IEnumerator FadeIn()
    {
        if (AudioManager.Instance == null) yield break;

        float fadeTime = 1f;
        float endVolume = PlayerPrefs.GetFloat(AudioManager.MUSIC_KEY, 1f);

        AudioManager.Instance.PlaySoundTrack(soundTrack);
        AudioManager.Instance.musicSource.volume = 0f;

        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(0f, endVolume, t / fadeTime);
            yield return null;
        }
    }

    private void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        // Only fade in if volume was zero (previous scene faded out)
        if (AudioManager.Instance.musicSource.volume <= 0.01f)
            StartCoroutine(FadeIn());
    }
}
