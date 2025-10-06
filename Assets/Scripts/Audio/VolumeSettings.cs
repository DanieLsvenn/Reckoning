using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

public class VolumeSettings : MonoBehaviour
{
    [SerializeField] AudioMixer mixer;
    [SerializeField] Slider musicSlider;
    [SerializeField] Slider sfxSlider;

    public const string MIXER_MUSIC = "MusicVolume";
    public const string MIXER_SFX = "SFXVolume";

    private void Awake()
    {
        musicSlider.onValueChanged.AddListener(SetMusicVolume);
        sfxSlider.onValueChanged.AddListener(SetSFXVolume);
    }

    void Start()
    {
        musicSlider.value = PlayerPrefs.GetFloat(AudioManager.MUSIC_KEY, 1f);
        sfxSlider.value = PlayerPrefs.GetFloat(AudioManager.SFX_KEY, 1f);
    }

    void SetSFXVolume(float vol)
    {
        mixer.SetFloat(MIXER_SFX, MathF.Log10(vol) * 20);
    }

    void SetMusicVolume(float vol)
    {
        mixer.SetFloat(MIXER_MUSIC, Mathf.Log10(vol) * 20);
    }

    public IEnumerator SmoothPauseSoundTrack()
    {
        float startVol = musicSlider.value;
        float t = 0f;
        float duration = 1.25f;

        while (t < 1f)
        {
            float newVol = Mathf.Lerp(startVol, 0.0001f, t);
            mixer.SetFloat(MIXER_MUSIC, Mathf.Log10(newVol) * 20);
            t += Time.deltaTime / duration;
            yield return null;
        }

        mixer.SetFloat(MIXER_MUSIC, Mathf.Log10(0.0001f) * 20);
    }


    public IEnumerator SmoothResumeSoundTrack()
    {
        float endVol = musicSlider.value;
        float t = 0f;
        float duration = 1.25f;

        while (t < 1f)
        {
            float curVol = Mathf.Lerp(0.0001f, endVol, t);
            mixer.SetFloat(MIXER_MUSIC, Mathf.Log10(curVol) * 20);
            t += Time.deltaTime / duration;
            yield return null;
        }

        mixer.SetFloat(MIXER_MUSIC, Mathf.Log10(endVol) * 20);
    }


    private void OnDisable()
    {
        PlayerPrefs.SetFloat(AudioManager.MUSIC_KEY, musicSlider.value);
        PlayerPrefs.SetFloat(AudioManager.SFX_KEY, sfxSlider.value);
    }
}
