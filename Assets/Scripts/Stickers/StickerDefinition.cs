using UnityEngine;

[System.Serializable]
public class StickerItem
{
    public string key;                // e.g., "idealism_sun"
    public Sprite sprite;
    public Vector2 position;
    public float fadeInTime = 0.5f;
    public float scaleInTime = 0.35f;
    public float startScale = 0.8f;
    public bool bounce;
    // NEW: final size multiplier for this sticker (1 = original size)
    [Min(0.01f)] public float scale = 1f;
}

[CreateAssetMenu(menuName = "Game/Visual/Sticker Set")]
public class StickerSet : ScriptableObject
{
    public string philosopherId;      // e.g., "plato"

    [Tooltip("Match by sticker key via #sticker:key tag")]
    public StickerItem[] stickers;    // globally available by key
}