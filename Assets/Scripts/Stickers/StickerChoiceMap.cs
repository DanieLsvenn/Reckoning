using UnityEngine;

[CreateAssetMenu(menuName = "Game/Visual/Sticker Choice Map")]
public class StickerChoiceMap : ScriptableObject
{
    public string philosopherId; // e.g., "plato"

    [System.Serializable]
    public class ChoiceStickers
    {
        public string choiceKey;    // e.g., "idealism" from ink choice tag #choice:idealism
        public StickerItem[] stickers;
    }

    public ChoiceStickers[] mappings;
}