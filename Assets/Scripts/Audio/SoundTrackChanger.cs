using UnityEngine;

public class SoundTrackChanger : MonoBehaviour
{
    private Collider2D stTrigger;
    [SerializeField] SoundTrackList SoundTrack;

    private void Awake()
    {
        stTrigger = GetComponent<Collider2D>();
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (SoundTrackPlayer.IsInitialized)
            SoundTrackPlayer.Instance.SetSoundTrack(SoundTrack);
    }
}
