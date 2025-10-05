using UnityEngine;
using UnityEngine.Events;

/// <summary>
/// A simple component that can be attached to GameObjects to trigger endings
/// Can be used with Unity Events, dialogue system callbacks, or other game events
/// </summary>
public class EndingTriggerHelper : MonoBehaviour
{
    [Header("Events")]
    [SerializeField] private UnityEvent OnEndingTriggered;
    [SerializeField] private UnityEvent<EndingTrigger.EndingType> OnSpecificEndingTriggered;

    [Header("Debug")]
    [SerializeField] private bool showEndingPreview = true;

    /// <summary>
    /// Triggers the ending based on current moral values
    /// Can be called from Unity Events, buttons, dialogue events, etc.
    /// </summary>
    public void TriggerEnding()
    {
        if (EndingTrigger.Instance == null)
        {
            Debug.LogError("[EndingTriggerHelper] EndingTrigger.Instance is null! Make sure there's an EndingTrigger in the scene.");
            return;
        }

        EndingTrigger.EndingType ending = EndingTrigger.Instance.PreviewEnding();
        Debug.Log($"[EndingTriggerHelper] Triggering ending: {ending}");

        OnEndingTriggered?.Invoke();
        OnSpecificEndingTriggered?.Invoke(ending);

        EndingTrigger.Instance.TriggerEnding();
    }

    /// <summary>
    /// Just shows what ending would be triggered without actually triggering it
    /// Useful for testing or UI display
    /// </summary>
    public void PreviewEnding()
    {
        if (EndingTrigger.Instance == null)
        {
            Debug.LogError("[EndingTriggerHelper] EndingTrigger.Instance is null!");
            return;
        }

        EndingTrigger.EndingType ending = EndingTrigger.Instance.PreviewEnding();
        string description = EndingTrigger.Instance.GetEndingDescription();
        
        Debug.Log($"[EndingTriggerHelper] Current ending would be: {ending}");
        Debug.Log($"[EndingTriggerHelper] Description: {description}");
    }

    /// <summary>
    /// Shows ending preview in the inspector during play mode
    /// </summary>
    private void OnGUI()
    {
        if (!showEndingPreview || !Application.isPlaying || EndingTrigger.Instance == null) 
            return;

        // Position the preview in the top-right corner
        float width = 300f;
        float height = 80f;
        float x = Screen.width - width - 20f;
        float y = 20f;

        GUI.Box(new Rect(x, y, width, height), "Ending Preview");
        
        EndingTrigger.EndingType currentEnding = EndingTrigger.Instance.PreviewEnding();
        GUI.Label(new Rect(x + 10, y + 25, width - 20, 20), $"Current Ending: {currentEnding}");
        
        if (GUI.Button(new Rect(x + 10, y + 50, 100, 20), "Trigger Ending"))
        {
            TriggerEnding();
        }
        
        if (GUI.Button(new Rect(x + 120, y + 50, 100, 20), "Preview Details"))
        {
            PreviewEnding();
        }
    }

    /// <summary>
    /// Test method for manual testing in the inspector
    /// </summary>
    [ContextMenu("Test Trigger Ending")]
    public void TestTriggerEnding()
    {
        TriggerEnding();
    }

    /// <summary>
    /// Test method for manual testing in the inspector
    /// </summary>
    [ContextMenu("Test Preview Ending")]
    public void TestPreviewEnding()
    {
        PreviewEnding();
    }
}