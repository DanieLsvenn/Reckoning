using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class TextSpawner : MonoBehaviour
{
    [SerializeField] private List<TextTrigger> textTriggers = new();
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

        foreach (var textTrigger in textTriggers)
        {
            float distance = Vector2.Distance(player.position, textTrigger.triggerPosition);
            if (distance <= triggerRadius)
            {
                if (textTrigger.textObject != null && !textTrigger.textObject.activeSelf)
                {
                    textTrigger.textObject.SetActive(true);
                }
            }
        }
    }

    void OnDrawGizmos()
    {
        if (textTriggers == null) return;

        Gizmos.color = Color.red;
        foreach (var textTrigger in textTriggers)
        {
            // Draw trigger point
            Gizmos.DrawSphere(textTrigger.triggerPosition, 0.3f);

            // Draw trigger radius
            Gizmos.color = Color.white; // orange with transparency
            Gizmos.DrawWireSphere(textTrigger.triggerPosition, triggerRadius);

            Gizmos.color = Color.red; // reset color for next point
        }
    }
}

[System.Serializable]
public class TextTrigger
{
    public GameObject textObject;
    public Vector2 triggerPosition;
}
