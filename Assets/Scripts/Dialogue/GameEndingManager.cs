using UnityEngine;
using UnityEngine.Events;

/// <summary>
/// Integrates ending trigger system with game completion events
/// Handles the flow from game completion to ending scenes
/// </summary>
public class GameEndingManager : MonoBehaviour
{
    [Header("Game Completion Settings")]
    [SerializeField] private bool triggerEndingOnAwake = false;
    [SerializeField] private float delayBeforeEnding = 2f;
    
    [Header("Events")]
    [SerializeField] private UnityEvent OnGameCompleted;
    [SerializeField] private UnityEvent OnEndingCalculated;
    [SerializeField] private UnityEvent<string> OnEndingDescriptionReady;

    [Header("Debug")]
    [SerializeField] private bool showDebugLogs = true;

    private bool gameCompleted = false;

    private void Start()
    {
        if (triggerEndingOnAwake)
        {
            CompleteGame();
        }
    }

    /// <summary>
    /// Call this method when the game is completed (all dialogues finished, final objective reached, etc.)
    /// </summary>
    public void CompleteGame()
    {
        if (gameCompleted)
        {
            if (showDebugLogs)
                Debug.Log("[GameEndingManager] Game already completed, ignoring duplicate call.");
            return;
        }

        gameCompleted = true;

        if (showDebugLogs)
            Debug.Log("[GameEndingManager] Game completed! Preparing to trigger ending...");

        OnGameCompleted?.Invoke();

        // Calculate ending and show preview
        if (EndingTrigger.Instance != null)
        {
            EndingTrigger.EndingType ending = EndingTrigger.Instance.PreviewEnding();
            string description = EndingTrigger.Instance.GetEndingDescription();

            if (showDebugLogs)
            {
                Debug.Log($"[GameEndingManager] Calculated ending: {ending}");
                Debug.Log($"[GameEndingManager] Description: {description}");
            }

            OnEndingCalculated?.Invoke();
            OnEndingDescriptionReady?.Invoke(description);
        }

        // Trigger ending after delay
        if (delayBeforeEnding > 0)
        {
            Invoke(nameof(TriggerEndingDelayed), delayBeforeEnding);
        }
        else
        {
            TriggerEndingDelayed();
        }
    }

    /// <summary>
    /// Internal method to trigger ending with delay
    /// </summary>
    private void TriggerEndingDelayed()
    {
        if (EndingTrigger.Instance != null)
        {
            if (showDebugLogs)
                Debug.Log("[GameEndingManager] Triggering ending scene transition...");
            
            EndingTrigger.Instance.TriggerEnding();
        }
        else
        {
            Debug.LogError("[GameEndingManager] EndingTrigger.Instance is null! Cannot trigger ending.");
        }
    }

    /// <summary>
    /// Force trigger ending immediately (bypasses completion check and delay)
    /// </summary>
    public void ForceEndingTrigger()
    {
        if (showDebugLogs)
            Debug.Log("[GameEndingManager] Force triggering ending...");

        if (EndingTrigger.Instance != null)
        {
            EndingTrigger.Instance.TriggerEnding();
        }
        else
        {
            Debug.LogError("[GameEndingManager] EndingTrigger.Instance is null!");
        }
    }

    /// <summary>
    /// Resets the completion state (useful for testing)
    /// </summary>
    [ContextMenu("Reset Game Completion")]
    public void ResetGameCompletion()
    {
        gameCompleted = false;
        CancelInvoke(nameof(TriggerEndingDelayed));
        
        if (showDebugLogs)
            Debug.Log("[GameEndingManager] Game completion reset.");
    }

    /// <summary>
    /// Shows current ending info without triggering it
    /// </summary>
    [ContextMenu("Show Current Ending Info")]
    public void ShowCurrentEndingInfo()
    {
        if (EndingTrigger.Instance == null)
        {
            Debug.LogError("[GameEndingManager] EndingTrigger.Instance is null!");
            return;
        }

        EndingTrigger.EndingType ending = EndingTrigger.Instance.PreviewEnding();
        string description = EndingTrigger.Instance.GetEndingDescription();

        Debug.Log("=== CURRENT ENDING INFO ===");
        Debug.Log($"Ending: {ending}");
        Debug.Log($"Description: {description}");
        Debug.Log("===========================");
    }

    /// <summary>
    /// Public property to check if game is completed
    /// </summary>
    public bool IsGameCompleted => gameCompleted;

    /// <summary>
    /// Integration point for dialogue system - call this when the final dialogue ends
    /// </summary>
    public void OnFinalDialogueEnded()
    {
        if (showDebugLogs)
            Debug.Log("[GameEndingManager] Final dialogue ended, completing game...");
        
        CompleteGame();
    }

    /// <summary>
    /// Integration point for other systems - call this when a specific objective is completed
    /// </summary>
    public void OnObjectiveCompleted()
    {
        if (showDebugLogs)
            Debug.Log("[GameEndingManager] Objective completed, completing game...");
        
        CompleteGame();
    }
}