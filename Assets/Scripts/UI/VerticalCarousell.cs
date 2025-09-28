using UnityEngine;
using UnityEngine.UI;

public class VerticalCarousel : MonoBehaviour
{
    public float speed = 50f;         // pixels per second
    public RectTransform stripA;      // first strip
    public RectTransform stripB;      // duplicate strip
    private float stripHeight;

    void Start()
    {
        // Assume both strips are the same height
        stripHeight = stripA.rect.height;

        // Place stripB right below stripA initially
        stripB.anchoredPosition = stripA.anchoredPosition - new Vector2(0, stripHeight);
    }

    void Update()
    {
        MoveStrip(stripA);
        MoveStrip(stripB);
    }

    void MoveStrip(RectTransform strip)
    {
        // Move upward
        strip.anchoredPosition += Vector2.up * speed * Time.deltaTime;

        // If moved past the top, reset to bottom
        if (strip.anchoredPosition.y >= stripHeight)
        {
            strip.anchoredPosition -= new Vector2(0, stripHeight * 2f);
        }
    }
}
