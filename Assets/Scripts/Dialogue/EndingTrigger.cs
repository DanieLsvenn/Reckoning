using UnityEngine;
using UnityEngine.SceneManagement;

public class EndingTrigger : MonoBehaviour
{
    [Header("Scene Names")]
    [SerializeField] private string sageEndingScene = "Ending_Sage";
    [SerializeField] private string changemakerEndingScene = "Ending_Changemaker";
    [SerializeField] private string wandererEndingScene = "Ending_Wanderer";
    
    [Header("Debug Info")]
    [SerializeField] private bool showDebugInfo = true;
    [SerializeField] private EndingType predictedEnding;
    
    public enum EndingType
    {
        Sage,
        Changemaker,
        Wanderer,
        None
    }

    private void Start()
    {
        // Update predicted ending for inspector visualization
        UpdatePredictedEnding();
    }

    private void Update()
    {
        // Update predicted ending every frame for real-time preview
        if (Application.isPlaying)
        {
            UpdatePredictedEnding();
        }
    }

    private void UpdatePredictedEnding()
    {
        if (MoralSystem.Instance != null)
        {
            predictedEnding = CalculateEnding();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        // Check if the player entered the trigger
        if (other.CompareTag("Player"))
        {
            TriggerEnding();
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        // Support for 2D colliders as well
        if (other.CompareTag("Player"))
        {
            TriggerEnding();
        }
    }

    public void TriggerEnding()
    {
        if (MoralSystem.Instance == null)
        {
            Debug.LogError("[EndingTrigger] MoralSystem instance not found! Cannot determine ending.");
            return;
        }

        EndingType ending = CalculateEnding();
        
        if (showDebugInfo)
        {
            LogMoralValues();
            Debug.Log($"[EndingTrigger] Determined ending: {ending}");
        }

        LoadEndingScene(ending);
    }

    private EndingType CalculateEnding()
    {
        if (MoralSystem.Instance == null) 
        {
            Debug.LogError("[EndingTrigger] MoralSystem.Instance is null!");
            return EndingType.None;
        }

        // Get all moral axis values
        int idealism = MoralSystem.Instance.Get(MoralAxis.Idealism);
        int materialism = MoralSystem.Instance.Get(MoralAxis.Materialism);
        int rationalism = MoralSystem.Instance.Get(MoralAxis.Rationalism);
        int empiricism = MoralSystem.Instance.Get(MoralAxis.Empiricism);
        int order = MoralSystem.Instance.Get(MoralAxis.Order);
        int chaos = MoralSystem.Instance.Get(MoralAxis.Chaos);
        int pessimism = MoralSystem.Instance.Get(MoralAxis.Pessimism);

        // Debug log all values
        Debug.Log($"[EndingTrigger] Raw values - Idealism:{idealism}, Materialism:{materialism}, Rationalism:{rationalism}, Empiricism:{empiricism}, Order:{order}, Chaos:{chaos}, Pessimism:{pessimism}");

        // Apply ending calculation formula
        
        // Rule 1: If Pessimism ≥ 10 → THE WANDERER
        Debug.Log($"[EndingTrigger] Checking Rule 1 - Pessimism ({pessimism}) >= 10? {pessimism >= 10}");
        if (pessimism >= 10)
        {
            Debug.Log("[EndingTrigger] Rule 1 triggered: THE WANDERER (High Pessimism)");
            return EndingType.Wanderer;
        }

        // Rule 2: If (Idealism + Rationalism + Order) ≥ 15 → THE SAGE
        int sageScore = idealism + rationalism + order;
        Debug.Log($"[EndingTrigger] Checking Rule 2 - Sage Score ({idealism}+{rationalism}+{order}={sageScore}) >= 15? {sageScore >= 15}");
        if (sageScore >= 15)
        {
            Debug.Log("[EndingTrigger] Rule 2 triggered: THE SAGE (High Idealism+Rationalism+Order)");
            return EndingType.Sage;
        }

        // Rule 3: If (Materialism + Empiricism + Chaos) ≥ 15 → THE CHANGEMAKER
        int changemakerScore = materialism + empiricism + chaos;
        Debug.Log($"[EndingTrigger] Checking Rule 3 - Changemaker Score ({materialism}+{empiricism}+{chaos}={changemakerScore}) >= 15? {changemakerScore >= 15}");
        if (changemakerScore >= 15)
        {
            Debug.Log("[EndingTrigger] Rule 3 triggered: THE CHANGEMAKER (High Materialism+Empiricism+Chaos)");
            return EndingType.Changemaker;
        }

        // Rule 4: Otherwise → Ending determined by highest individual score
        int maxValue = Mathf.Max(idealism, materialism, rationalism, empiricism, order, chaos, pessimism);
        Debug.Log($"[EndingTrigger] Rule 4 - Highest individual score: {maxValue}");
        
        // Find which axis has the highest value (in case of ties, priority order matters)
        if (pessimism == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE WANDERER (Highest Pessimism)");
            return EndingType.Wanderer;
        }
        if (idealism == maxValue || rationalism == maxValue || order == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE SAGE (Highest Sage-related axis)");
            return EndingType.Sage;
        }
        if (materialism == maxValue || empiricism == maxValue || chaos == maxValue) 
        {
            Debug.Log("[EndingTrigger] Rule 4 result: THE CHANGEMAKER (Highest Changemaker-related axis)");
            return EndingType.Changemaker;
        }

        // Default fallback (shouldn't happen, but just in case)
        Debug.Log("[EndingTrigger] Fallback triggered: THE WANDERER (Default)");
        return EndingType.Wanderer;
    }

    private void LoadEndingScene(EndingType ending)
    {
        string sceneToLoad = "";
        
        switch (ending)
        {
            case EndingType.Sage:
                sceneToLoad = sageEndingScene;
                break;
            case EndingType.Changemaker:
                sceneToLoad = changemakerEndingScene;
                break;
            case EndingType.Wanderer:
                sceneToLoad = wandererEndingScene;
                break;
            default:
                Debug.LogError($"[EndingTrigger] Unknown ending type: {ending}");
                return;
        }

        if (string.IsNullOrEmpty(sceneToLoad))
        {
            Debug.LogError($"[EndingTrigger] Scene name not set for ending: {ending}");
            return;
        }

        Debug.Log($"[EndingTrigger] Loading ending scene: {sceneToLoad}");
        SceneManager.LoadScene(sceneToLoad);
    }

    private void LogMoralValues()
    {
        Debug.Log("=== ENDING CALCULATION ===");
        Debug.Log($"Idealism: {MoralSystem.Instance.Get(MoralAxis.Idealism)}");
        Debug.Log($"Materialism: {MoralSystem.Instance.Get(MoralAxis.Materialism)}");
        Debug.Log($"Rationalism: {MoralSystem.Instance.Get(MoralAxis.Rationalism)}");
        Debug.Log($"Empiricism: {MoralSystem.Instance.Get(MoralAxis.Empiricism)}");
        Debug.Log($"Order: {MoralSystem.Instance.Get(MoralAxis.Order)}");
        Debug.Log($"Chaos: {MoralSystem.Instance.Get(MoralAxis.Chaos)}");
        Debug.Log($"Pessimism: {MoralSystem.Instance.Get(MoralAxis.Pessimism)}");
        
        int sageScore = MoralSystem.Instance.Get(MoralAxis.Idealism) + 
                       MoralSystem.Instance.Get(MoralAxis.Rationalism) + 
                       MoralSystem.Instance.Get(MoralAxis.Order);
        int changemakerScore = MoralSystem.Instance.Get(MoralAxis.Materialism) + 
                              MoralSystem.Instance.Get(MoralAxis.Empiricism) + 
                              MoralSystem.Instance.Get(MoralAxis.Chaos);
        
        Debug.Log($"Sage Score (Idealism + Rationalism + Order): {sageScore}");
        Debug.Log($"Changemaker Score (Materialism + Empiricism + Chaos): {changemakerScore}");
        Debug.Log("===========================");
    }

    // Public method to manually trigger ending (useful for testing)
    [ContextMenu("Test Trigger Ending")]
    public void TestTriggerEnding()
    {
        TriggerEnding();
    }

    // Public method to check what ending would be triggered without loading the scene
    [ContextMenu("Preview Ending")]
    public void PreviewEnding()
    {
        if (MoralSystem.Instance == null)
        {
            Debug.LogWarning("[EndingTrigger] MoralSystem instance not found!");
            return;
        }

        EndingType ending = CalculateEnding();
        predictedEnding = ending;
        LogMoralValues();
        Debug.Log($"[EndingTrigger] Predicted ending: {ending}");
    }
}