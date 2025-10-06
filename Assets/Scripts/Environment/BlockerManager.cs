using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class BlockerManager : MonoBehaviour
{
    [SerializeField] private List<Blocker> blockers = new();
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

    // Update is called once per frame
    void Update()
    {
        if (player == null) return;

        foreach (var blocker in blockers)
        {
            float distance = Vector2.Distance(player.position, blocker.triggerPosition);
            if (distance <= triggerRadius)
            {
                blocker.blocker.SetActive(true);
            }
        }
    }
    void OnDrawGizmos()
    {
        if (blockers == null) return;

        Gizmos.color = Color.red;
        foreach (var blocker in blockers)
        {
            // Draw trigger point
            Gizmos.DrawSphere(blocker.triggerPosition, 0.3f);

            // Draw trigger radius
            Gizmos.color = Color.white; // orange with transparency
            Gizmos.DrawWireSphere(blocker.triggerPosition, triggerRadius);

            Gizmos.color = Color.red; // reset color for next point
        }
    }
}

[System.Serializable]
public class Blocker
{
    public GameObject blocker;
    public Vector2 triggerPosition;
}