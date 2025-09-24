using UnityEngine;

[CreateAssetMenu(menuName = "Game/NPC/Philosopher Data")]
public class PhilosopherData : ScriptableObject
{
    public string philosopherId; // e.g., "plato"
    public string displayName; // e.g., "Plato"
    public Sprite portrait; // default sprite
    public TextAsset inkJson; // set in Phase 2
}