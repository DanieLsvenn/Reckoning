using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DynamicParallaxBackground : MonoBehaviour
{
    private float startPos, length;
    public GameObject cam;
    public float parallaxEffect = 0.5f;   // 0 = moves with cam, 1 = static
    [Tooltip("Left <- Negative | Positive -> Right")]
    public float driftSpeed = -0.1f;       // Cloud drift speed
    public bool useBoxCollider = false;

    void Start()
    {
        startPos = transform.position.x;
        length = GetComponent<SpriteRenderer>().bounds.size.x;

        if (useBoxCollider)
        {
            length = GetComponent<BoxCollider>().bounds.size.x;
        }
    }

    void Update()
    {
        // Parallax effect from camera
        float distance = cam.transform.position.x * parallaxEffect;
        float movement = cam.transform.position.x * (1 - parallaxEffect);

        // Add drifting offset
        float driftOffset = Time.time * driftSpeed;

        transform.position = new Vector3(startPos + distance + driftOffset, transform.position.y, transform.position.z);

        // Reposition when fully left OR right (drift + camera combined)
        if (movement + driftOffset > startPos + length + driftOffset * 2)
        {
            startPos += length;
        }
        else if (movement + driftOffset < startPos - length + driftOffset * 2)
        {
            startPos -= length;
        }
    }
}
