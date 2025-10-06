using UnityEngine;

/// <summary>
/// Debug utility for testing NPC one-time interaction system.
/// Add this to any GameObject in the scene to access debug methods.
/// </summary>
public class NPCInteractionTester : MonoBehaviour
{
    [Header("Debug Controls")]
    [SerializeField] private bool showDebugInfo = true;
    
    private void Update()
    {
        // Press R to reset all talked-to states (for testing)
        if (Input.GetKeyDown(KeyCode.R))
        {
            ResetAllTalkedToStates();
        }
        
        // Press T to show current talked-to status
        if (Input.GetKeyDown(KeyCode.T))
        {
            ShowTalkedToStatus();
        }
    }
    
    private void OnGUI()
    {
        if (!showDebugInfo) return;
        
        GUILayout.BeginArea(new Rect(10, 50, 400, 200));
        GUILayout.Label($"NPCs Talked To: {PhilosopherNPC.GetTalkedToCount()}");
        GUILayout.Label("Press 'R' to reset all talked-to states");
        GUILayout.Label("Press 'T' to log current status");
        
        if (GUILayout.Button("Reset Talked-To States"))
        {
            ResetAllTalkedToStates();
        }
        
        if (GUILayout.Button("Show Status"))
        {
            ShowTalkedToStatus();
        }
        
        GUILayout.EndArea();
    }
    
    [ContextMenu("Reset All Talked-To States")]
    public void ResetAllTalkedToStates()
    {
        PhilosopherNPC.ResetTalkedToState();
        Debug.Log("[NPCInteractionTester] Reset all NPC talked-to states for testing.");
    }
    
    [ContextMenu("Show Talked-To Status")]
    public void ShowTalkedToStatus()
    {
        Debug.Log($"[NPCInteractionTester] Total NPCs talked to: {PhilosopherNPC.GetTalkedToCount()}");
        
        var npcs = FindObjectsByType<PhilosopherNPC>(FindObjectsSortMode.None);
        foreach (var npc in npcs)
        {
            if (npc.Data != null)
            {
                string status = npc.HasBeenTalkedTo ? "✓ Talked To" : "○ Available";
                Debug.Log($"[NPCInteractionTester] {npc.Data.displayName} ({npc.Data.philosopherId}): {status}");
            }
        }
    }
}