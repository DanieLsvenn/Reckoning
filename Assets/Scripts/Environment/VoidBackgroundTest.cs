using UnityEngine;

public class VoidBackgroundTest : MonoBehaviour
{
    [SerializeField] private GameObject voidBackground;
    [SerializeField] private SoundTrackList SoundTrack;

    private Animator voidAnimator;

    void Start()
    {
        if (voidBackground != null)
            voidAnimator = voidBackground.GetComponent<Animator>();
        else
            Debug.LogWarning("Void Background is not assigned!");
    }

    // Called when another collider enters this trigger collider
    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            if (voidAnimator != null)
                voidAnimator.SetTrigger("voidAnimationTrigger");

            if (SoundTrackPlayer.IsInitialized)
                SoundTrackPlayer.Instance.SetSoundTrack(SoundTrack);
        }
    }

    // Optional: draw gizmo to visualize trigger
    private void OnDrawGizmos()
    {
        Collider2D col = GetComponent<Collider2D>();
        if (col != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireCube(col.bounds.center, col.bounds.size);
        }
    }
}
