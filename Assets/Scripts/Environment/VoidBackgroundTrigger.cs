using UnityEngine;
using UnityEngine.UIElements;

public class VoidBackgroundTrigger : MonoBehaviour
{
    [SerializeField] private float triggerRadius = 0.5f; // how close the player must be
    [SerializeField] private Vector2 triggerPosition;

    [SerializeField] private GameObject voidBackground;

    [SerializeField] private SoundTrackList SoundTrack;
    [SerializeField] private float soundtrackDelay = 0.5f;
    private bool activated;

    private Animator voidAnimator;

    private Transform player;
    void Start()
    {
        GameObject playerObj = GameObject.FindGameObjectWithTag("Player");
        if (playerObj != null)
            player = playerObj.transform;
        else
            Debug.LogWarning("Player with tag 'Player' not found!");
        voidAnimator = voidBackground.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (player == null) return;

        float distance = Vector2.Distance(player.position, triggerPosition);
        if (distance <= triggerRadius && activated == false)
        {
            activated = true;
            voidAnimator.SetTrigger("voidAnimationTrigger");
            if (SoundTrackPlayer.IsInitialized)
                SoundTrackPlayer.Instance.SetSoundTrack(SoundTrack, soundtrackDelay);
        }
            
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        // Draw trigger point
        Gizmos.DrawSphere(triggerPosition, 0.5f);

        Gizmos.color = Color.red; // reset color for next point
    }
}
