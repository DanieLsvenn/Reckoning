using UnityEngine;

public class HeartbeatAudio : MonoBehaviour
{
    private Animator animator;
    public void Awake()
    {
        animator = GetComponent<Animator>();
    }
    public void PlayHeartbeat()
    {
        if (AudioManager.Instance != null)
        {
            AudioManager.Instance.PlaySound(SoundEffectType.HeartBeat);
        }
        else
        {
            Debug.LogWarning("HeartbeatAudio missing AudioManager!");
        }
    }

    public void SwitchToLoop()
    {
        animator.SetBool("loopHeartbeat", true);
    }
}
