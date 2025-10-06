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

        Gizmos.color = Color.red;
        foreach (var bg in backgrounds)
        {
            // Draw trigger point
            Gizmos.DrawSphere(bg.triggerPoint, 0.3f);

            // Draw trigger radius
            Gizmos.color = Color.white; // orange with transparency
            Gizmos.DrawWireSphere(bg.triggerPoint, triggerRadius);

            Gizmos.color = Color.red; // reset color for next point
        }

        Gizmos.DrawLine(new Vector2(402, 0), new Vector2(404, -1));
        Gizmos.DrawLine(new Vector2(404, -1), new Vector2(406, -1));
        Gizmos.DrawLine(new Vector2(408, 0), new Vector2(406, -1));

        Gizmos.DrawLine(new Vector2(402, 0), new Vector2(404, -3));
        Gizmos.DrawLine(new Vector2(404, -3), new Vector2(406, -3));
        Gizmos.DrawLine(new Vector2(408, 0), new Vector2(406, -3));

        Gizmos.color = Color.white;

        Gizmos.DrawLine(new Vector2(404, -1), new Vector2(404.25f, -1.5f));
        Gizmos.DrawLine(new Vector2(404.25f, -1.5f), new Vector2(404.5f, -1f));
        Gizmos.DrawLine(new Vector2(404.5f, -1f), new Vector2(404.75f, -1.5f));
        Gizmos.DrawLine(new Vector2(404.75f, -1.5f), new Vector2(405f, -1f));
        Gizmos.DrawLine(new Vector2(405f, -1f), new Vector2(405.25f, -1.5f));
        Gizmos.DrawLine(new Vector2(405.25f, -1.5f), new Vector2(405.5f, -1f));
        Gizmos.DrawLine(new Vector2(405.5f, -1f), new Vector2(405.75f, -1.5f));
        Gizmos.DrawLine(new Vector2(405.75f, -1.5f), new Vector2(406f, -1f));

        Gizmos.DrawLine(new Vector2(404, -3), new Vector2(404.25f, -2.5f));
        Gizmos.DrawLine(new Vector2(404.25f, -2.5f), new Vector2(404.5f, -3f));
        Gizmos.DrawLine(new Vector2(404.5f, -3f), new Vector2(404.75f, -2.5f));
        Gizmos.DrawLine(new Vector2(404.75f, -2.5f), new Vector2(405f, -3f));
        Gizmos.DrawLine(new Vector2(405f, -3f), new Vector2(405.25f, -2.5f));
        Gizmos.DrawLine(new Vector2(405.25f, -2.5f), new Vector2(405.5f, -3f));
        Gizmos.DrawLine(new Vector2(405.5f, -3f), new Vector2(405.75f, -2.5f));
        Gizmos.DrawLine(new Vector2(405.75f, -2.5f), new Vector2(406f, -3f));
    }
}

[System.Serializable]
public class TransitionBackground
{
    public GameObject fromBackground;
    public GameObject toBackground;
    public Vector2 triggerPoint;
}
