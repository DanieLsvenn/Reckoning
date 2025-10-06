using System;
using System.Collections;
using UnityEngine;

public class SoundTrackPlayer : MonoBehaviour
{
    public static SoundTrackPlayer Instance { get; private set; }

    [SerializeField] SoundTrackList soundTrack;

    public static bool IsInitialized => Instance != null;

    public void Start()
    {
        // Singleton
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else if (Instance != this)
        {
            Destroy(gameObject);
        }

        StartCoroutine(FadeIn());
    }

    public void SetSoundTrack(SoundTrackList newSoundTrack, float soundTrackSwitchDelay)
    {
        if (newSoundTrack == soundTrack) return; // already playing, do nothing

        soundTrack = newSoundTrack;
        StartCoroutine(CrossfadeToNewTrack(soundTrack, soundTrackSwitchDelay));
    }

    private IEnumerator CrossfadeToNewTrack(SoundTrackList newSoundTrack, float soundTrackSwitchDelay)
    {
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
    }

    public IEnumerator FadeOut()
    {
        float fadeTime = 1f;
        float startVolume = AudioManager.Instance.musicSource.volume;

        // Fade out
        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(startVolume, 0f, t / fadeTime);
            yield return null;
        }
    }

    private IEnumerator FadeIn()
    {
        float fadeTime = 1f;
        float startVolume = AudioManager.Instance.musicSource.volume;

        AudioManager.Instance.PlaySoundTrack(soundTrack);

        // Fade in
        for (float t = 0; t < fadeTime; t += Time.deltaTime)
        {
            AudioManager.Instance.musicSource.volume = Mathf.Lerp(0f, startVolume, t / fadeTime);
            yield return null;
        }
    }
}