using System;
using UnityEngine;
using UnityEngine.Audio;

public enum SoundEffectType
{
    ConcreteStepping,
    DialogueInteract,
    DialogueTick,
    DialogueChoice,
    MenuButton,
    HeartBeat,
}

public enum SoundTrackList
{
    MainMenu,
    Greek,
    China,
    Brutalist,
    Void,
    Blank,
    Ending_ChangeMaker,
    Ending_Sage,
    Ending_Wanderer
}

[RequireComponent(typeof(AudioSource)), ExecuteInEditMode]
public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;

    [SerializeField] AudioMixer mixer;
    public SoundList[] soundList;
    public SoundTrack[] soundTracks;

    public AudioSource musicSource;
    private AudioSource sfxSource;

    // Add this static property to check if the instance is ready
    public static bool IsInitialized => Instance != null && Instance.musicSource != null;

    //Audio mixer group for audio mixer
    [SerializeField] AudioMixerGroup musicGroup;
    [SerializeField] AudioMixerGroup sfxGroup;

    public const string MUSIC_KEY = "musicVolume";
    public const string SFX_KEY = "sfxVolume";

    private void Awake()
    {
        // Only execute singleton pattern in play mode, not in edit mode
        if (!Application.isPlaying)
        {
            // Skip singleton setup in edit mode
            musicSource = GetComponent<AudioSource>();
            return;
        }

        // Singleton
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);  // Keep the SoundManager across scenes
        }
        else
        {
            Destroy(gameObject);
        }


        musicSource = GetComponent<AudioSource>();
        if (musicSource == null)
        {
            Debug.LogError("AudioSource component is missing on SoundManager GameObject.");
        }
        musicSource.outputAudioMixerGroup = musicGroup;

        // Create a separate AudioSource for sound effects if it doesn't exist
        if (sfxSource == null)
        {
            sfxSource = gameObject.AddComponent<AudioSource>();
        }
        sfxSource.outputAudioMixerGroup = sfxGroup;

        LoadVolume();
    }

    public void PlaySound(SoundEffectType sound)
    {
        AudioClip[] clips = Instance.soundList[(int)sound].Sounds;
        AudioClip randomClip = clips[UnityEngine.Random.Range(0, clips.Length)];
        Instance.sfxSource.PlayOneShot(randomClip);  // Use sfxSource instead
    }

    public void PlaySoundTrack(SoundTrackList soundTrack)
    {
        AudioClip track = Instance.soundTracks[(int)soundTrack].Sounds;
        if (track != null)
        {
            Instance.musicSource.clip = track;
            Instance.musicSource.loop = true;
            Instance.musicSource.Play();
        }
        else
        {
            Debug.LogWarning($"Sound track {soundTrack} is not assigned or missing.");
        }
    }

    public void StopSoundTrack()
    {
        if (Instance.musicSource.isPlaying)
        {
            Instance.musicSource.Stop();
        }
    }

    void LoadVolume() // Volume saved in VolumeSettings.cs
    {
        float musicVolume = PlayerPrefs.GetFloat(MUSIC_KEY, 1f);
        float sfxVolume = PlayerPrefs.GetFloat(SFX_KEY, 1f);

        mixer.SetFloat(VolumeSettings.MIXER_MUSIC, Mathf.Log10(musicVolume) * 20);
        mixer.SetFloat(VolumeSettings.MIXER_SFX, Mathf.Log10(sfxVolume) * 20);
    }

#if UNITY_EDITOR
    private void OnEnable()
    {
        string[] names = Enum.GetNames(typeof(SoundEffectType));
        Array.Resize(ref soundList, names.Length);
        for (int i = 0; i < names.Length; i++)
        {
            soundList[i].SoundName = names[i];
        }

        string[] tracknames = Enum.GetNames(typeof(SoundTrackList));
        Array.Resize(ref soundTracks, tracknames.Length);
        for (int i = 0; i < tracknames.Length; i++)
        {
            soundTracks[i].SoundTrackName = tracknames[i];
        }
    }
#endif
}

[Serializable]
public struct SoundList
{
    [HideInInspector] public string SoundName;
    [SerializeField] private AudioClip[] sounds;
    public AudioClip[] Sounds
    {
        get => sounds;
    }
}

[Serializable]
public struct SoundTrack
{
    [HideInInspector] public string SoundTrackName;
    [SerializeField] private AudioClip soundTracks;

    public AudioClip Sounds
    {
        get => soundTracks;
    }
}