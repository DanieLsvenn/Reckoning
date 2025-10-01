using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class SoundTrackChanger : MonoBehaviour
{
    private Collider2D stTrigger;
    [SerializeField] private SoundTrackList SoundTrack;

    private void Awake()
    {
        stTrigger = GetComponent<Collider2D>();

        stTrigger.isTrigger = true;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (SoundTrackPlayer.IsInitialized)
            SoundTrackPlayer.Instance.SetSoundTrack(SoundTrack);
    }
}
