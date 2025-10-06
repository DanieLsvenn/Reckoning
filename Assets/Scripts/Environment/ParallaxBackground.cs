using UnityEngine;

public class ParallaxBackground : MonoBehaviour
{
    private float startPosX, length;
    public GameObject cam;
    public float parallaxEffect; // The speed at which the background should move relative to the camera
    public bool useBoxCollider = false;

    [Header("Floating Effect")]
    [SerializeField] private bool enableFloating = false;
    [Tooltip("How high/low it moves")]
    [SerializeField] private float floatAmplitude = 0.5f;
    [Tooltip("How fast it moves")]
    [SerializeField] private float floatFrequency = 1f;

    private float startPosY;

    void Start()
    {
        startPosX = transform.position.x;
        startPosY = transform.position.y;

        if (useBoxCollider)
            length = GetComponent<BoxCollider>().bounds.size.x;
        else
            length = GetComponent<SpriteRenderer>().bounds.size.x;
    }

    void FixedUpdate()
    {
        UpdateParallax();
    }

    void UpdateParallax()
    {
        float distance = cam.transform.position.x * parallaxEffect;
        float movement = cam.transform.position.x * (1 - parallaxEffect);

        // Horizontal parallax
        float newX = startPosX + distance;

        // Vertical floating
        float newY = startPosY;
        if (enableFloating)
        {
            newY += Mathf.Sin(Time.time * floatFrequency) * floatAmplitude;
        }

        transform.position = new Vector3(newX, newY, transform.position.z);

        // Infinite scrolling
        if (movement > startPosX + length)
            startPosX += length;
        else if (movement < startPosX - length)
            startPosX -= length;
    }
}
