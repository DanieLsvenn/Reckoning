using System.Collections.Generic;
using UnityEngine;

public class TransitionController : MonoBehaviour
{
    [SerializeField] private List<TransitionBackground> backgrounds = new();
    [SerializeField] private float triggerRadius = 0.5f; // how close the player must be

    private Transform player;

    void Start()
    {
        GameObject playerObj = GameObject.FindGameObjectWithTag("Player");
        if (playerObj != null)
            player = playerObj.transform;
        else
            Debug.LogWarning("Player with tag 'Player' not found!");
    }

    void Update()
    {
        if (player == null) return;

        foreach (var bg in backgrounds)
        {
            float distance = Vector2.Distance(player.position, bg.triggerPoint);
            if (distance <= triggerRadius)
            {
                if (bg.fromBackground != null) bg.fromBackground.SetActive(false);
                if (bg.toBackground != null) bg.toBackground.SetActive(true);
            }
        }
    }

    // --- Gizmos visualization in Scene view ---
    void OnDrawGizmos()
    {
        if (backgrounds == null) return;

        Gizmos.color = Color.yellow;
        foreach (var bg in backgrounds)
        {
            // Draw trigger point
            Gizmos.DrawSphere(bg.triggerPoint, 0.1f);

            // Draw trigger radius
            Gizmos.color = new Color(1f, 0.5f, 0f, 0.25f); // orange with transparency
            Gizmos.DrawWireSphere(bg.triggerPoint, triggerRadius);

            Gizmos.color = Color.yellow; // reset color for next point
        }
    }
}

[System.Serializable]
public class TransitionBackground
{
    public GameObject fromBackground;
    public GameObject toBackground;
    public Vector2 triggerPoint;
}
