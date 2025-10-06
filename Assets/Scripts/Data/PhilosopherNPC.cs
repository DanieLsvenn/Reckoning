using UnityEngine;
using System.Collections.Generic;

[RequireComponent(typeof(Collider2D))]
public class PhilosopherNPC : MonoBehaviour
{
    [SerializeField] private PhilosopherData data;
    [SerializeField] private Transform indicator;
    [SerializeField] private float interactRadius = 2.5f;

    private Transform player;
    private bool playerInRange;

    public System.Action<PhilosopherNPC> OnRequestInteract;
    
    // Static tracking for NPCs that have been talked to
    private static readonly HashSet<string> _talkedToNPCs = new HashSet<string>();
    
    // Property to check if this NPC has been talked to
    public bool HasBeenTalkedTo => data != null && _talkedToNPCs.Contains(data.philosopherId);
    
    // Static method to mark an NPC as talked to
    public static void MarkAsTalkedTo(string philosopherId)
    {
        if (!string.IsNullOrEmpty(philosopherId))
        {
            _talkedToNPCs.Add(philosopherId);
            Debug.Log($"[PhilosopherNPC] Marked '{philosopherId}' as talked to. Total talked to: {_talkedToNPCs.Count}");
            
            // Update visual state of the specific NPC
            var npcs = FindObjectsByType<PhilosopherNPC>(FindObjectsSortMode.None);
            foreach (var npc in npcs)
            {
                if (npc.data != null && npc.data.philosopherId == philosopherId)
                {
                    npc.UpdateVisualState();
                    break;
                }
            }
        }
    }
    
    // Static method to reset talked-to state (useful for testing or new game)
    public static void ResetTalkedToState()
    {
        _talkedToNPCs.Clear();
        Debug.Log("[PhilosopherNPC] Reset all talked-to states.");
        
        // Update visual state of all NPCs in scene
        var npcs = FindObjectsByType<PhilosopherNPC>(FindObjectsSortMode.None);
        foreach (var npc in npcs)
        {
            npc.UpdateVisualState();
        }
    }
    
    // Public method to check talked-to status for debugging
    public static bool HasTalkedTo(string philosopherId)
    {
        return !string.IsNullOrEmpty(philosopherId) && _talkedToNPCs.Contains(philosopherId);
    }
    
    // Get count of talked-to NPCs for debugging
    public static int GetTalkedToCount()
    {
        return _talkedToNPCs.Count;
    }

    private void Reset()
    {
        var col = GetComponent<Collider2D>();
        col.isTrigger = true;
    }

    public void Initialize(PhilosopherData d)
    {
        data = d;
        var sr = GetComponent<SpriteRenderer>();
        if (sr && d && d.portrait) sr.sprite = d.portrait;
        name = d ? $"Philosopher_{d.displayName}" : name;
        
        // Update visual state based on talked-to status
        UpdateVisualState();
    }
    
    // Update visual appearance based on whether NPC has been talked to
    private void UpdateVisualState()
    {
        var sr = GetComponent<SpriteRenderer>();
        if (sr && HasBeenTalkedTo)
        {
            // Dim the sprite to indicate this NPC has been talked to
            sr.color = new Color(0.7f, 0.7f, 0.7f, 1f);
        }
        else if (sr)
        {
            // Normal color for available NPCs
            sr.color = Color.white;
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            player = other.transform;
            playerInRange = true;
            // Update visual state when player enters (in case status changed)
            UpdateVisualState();
            // Only show indicator if haven't talked to this NPC yet
            if (indicator && !HasBeenTalkedTo) 
                indicator.gameObject.SetActive(true);
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = false;
            if (indicator) indicator.gameObject.SetActive(false);
            player = null;
        }
    }

    public void TryInteract()
    {
        if (playerInRange && !HasBeenTalkedTo)
        {
            if (AudioManager.IsInitialized)
                AudioManager.Instance.PlaySound(SoundEffectType.DialogueInteract);
            if (FogRelocator.IsInitialized)
                FogRelocator.Instance.RelocateFog();
            OnRequestInteract?.Invoke(this);
        }
        else if (playerInRange && HasBeenTalkedTo)
        {
            Debug.Log($"[PhilosopherNPC] '{data?.displayName}' has already been talked to. Interaction blocked.");
        }
    }

    public PhilosopherData Data => data;
}