using UnityEngine;

public class FloatingEffect : MonoBehaviour
{
    [Tooltip("How high/low it moves")]
    [SerializeField] private float floatAmplitude = 0.5f;
    [Tooltip("How fast it moves")]
    [SerializeField] private float floatFrequency = 1f;

    private float baseY;

    void Start()
    {
        baseY = transform.position.y; // use localPosition for additive effect
    }

    void FixedUpdate()
    {
        float offsetY = Mathf.Sin(Time.time * floatFrequency) * floatAmplitude;
        Vector3 pos = transform.position;
        pos.y = baseY + offsetY;
        transform.position = pos; // only affect local Y
    }
}
