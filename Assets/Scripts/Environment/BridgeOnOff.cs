using System;
using UnityEngine;

public class BridgeOnOff : MonoBehaviour
{
    [SerializeField] private float triggerRadius = 0.5f;
    [SerializeField] private Vector2 triggerPositionOn;
    [SerializeField] private Vector2 triggerPositionOff;
    [SerializeField] private GameObject bridge;

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

        float distanceOn = Vector2.Distance(player.position, triggerPositionOn);
        float distanceOff = Vector2.Distance(player.position, triggerPositionOff);
        if (distanceOn <= triggerRadius)
        {
            bridge.SetActive(true);
        }
        if (distanceOff <= triggerRadius)
        {
            bridge.SetActive(false);
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        // Draw trigger point
        Gizmos.DrawSphere(triggerPositionOn, 0.5f);
        Gizmos.DrawSphere(triggerPositionOff, 0.5f);

        Gizmos.color = Color.red; // reset color for next point
    }
}
