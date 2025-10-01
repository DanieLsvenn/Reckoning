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

        AudioManager.Instance.PlaySoundTrack(soundTrack);
    }

    public void SetSoundTrack(SoundTrackList newSoundTrack)
    {
        soundTrack = newSoundTrack;
        AudioManager.Instance.StopSoundTrack();
        AudioManager.Instance.PlaySoundTrack(soundTrack);
    }
}