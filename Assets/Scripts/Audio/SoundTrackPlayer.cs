using System.Collections;
using UnityEngine;

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
        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(0f, startVolume, t / fadeTime);
            yield return null;
        }

        AudioManager.Instance.musicSource.volume = startVolume;

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
    }

    private IEnumerator FadeIn()
    {
        if (AudioManager.Instance == null) yield break;

        float fadeTime = 1f;
        float startVolume = AudioManager.Instance.musicSource.volume;

        AudioManager.Instance.PlaySoundTrack(soundTrack);
        AudioManager.Instance.musicSource.volume = 0f;

        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(0f, startVolume, t / fadeTime);
            yield return null;
        }
    }
}
