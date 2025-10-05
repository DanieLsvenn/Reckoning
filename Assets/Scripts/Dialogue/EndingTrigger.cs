using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public class EndingTrigger : MonoBehaviour
{
    [System.Serializable]
    public class EndingScene
    {
        public EndingType endingType;
        public string sceneName;
        [TextArea(2, 4)]
        public string description;
    }

    [Header("Ending Scenes")]
    [SerializeField] private EndingScene[] endingScenes = new EndingScene[]
    {
        new EndingScene { endingType = EndingType.TheSage, sceneName = "Ending_Sage", description = "THE SAGE - Philosophy teacher dedicated to guiding students" },
        new EndingScene { endingType = EndingType.TheChangemaker, sceneName = "Ending_Changemaker", description = "THE CHANGEMAKER - Social activist using science and action" },
        new EndingScene { endingType = EndingType.TheWanderer, sceneName = "Ending_Wanderer", description = "THE WANDERER - Artist/writer aware of life's contradictions" }
    };

    [Header("Debug")]
    [SerializeField] private bool showDebugInfo = true;
    [SerializeField] private bool testEndingCalculation = false;

    public static EndingTrigger Instance { get; private set; }

    public enum EndingType
    {
        TheSage,
        TheChangemaker,
        TheWanderer,
        Default
    }

    private void Awake()
    {
        if (Instance && Instance != this) 
        { 
            Destroy(gameObject); 
            return; 
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    private void Start()
    {
        if (testEndingCalculation)
        {
            TestEndingCalculation();
        }
    }

    /// <summary>
    /// Calculates which ending the player should get based on their moral axis values
    /// </summary>
    /// <returns>The ending type based on the calculation formula</returns>
    public EndingType CalculateEnding()
    {
        if (MoralSystem.Instance == null)
        {
            Debug.LogError("[EndingTrigger] MoralSystem.Instance is null! Cannot calculate ending.");
            return EndingType.Default;
        }

        // Get all moral axis values
        int idealism = MoralSystem.Instance.Get(MoralAxis.Idealism);
        int materialism = MoralSystem.Instance.Get(MoralAxis.Materialism);
        int rationalism = MoralSystem.Instance.Get(MoralAxis.Rationalism);
        int empiricism = MoralSystem.Instance.Get(MoralAxis.Empiricism);
        int order = MoralSystem.Instance.Get(MoralAxis.Order);
        int chaos = MoralSystem.Instance.Get(MoralAxis.Chaos);
        int pessimism = MoralSystem.Instance.Get(MoralAxis.Pessimism);

        if (showDebugInfo)
        {
            Debug.Log($"[EndingTrigger] Current Moral Values:");
            Debug.Log($"Idealism: {idealism}, Materialism: {materialism}");
            Debug.Log($"Rationalism: {rationalism}, Empiricism: {empiricism}");
            Debug.Log($"Order: {order}, Chaos: {chaos}");
            Debug.Log($"Pessimism: {pessimism}");
        }

        // Apply ending calculation formula
        EndingType ending = ApplyEndingFormula(idealism, materialism, rationalism, empiricism, order, chaos, pessimism);

        if (showDebugInfo)
        {
            Debug.Log($"[EndingTrigger] Calculated ending: {ending}");
        }

        return ending;
    }

    /// <summary>
    /// Applies the ending calculation formula
    /// </summary>
    private EndingType ApplyEndingFormula(int idealism, int materialism, int rationalism, int empiricism, int order, int chaos, int pessimism)
    {
        // Formula Priority:
        // 1. If Pessimism ≥ 10 → ENDING 3: The Wanderer
        if (pessimism >= 10)
        {
            if (showDebugInfo)
                Debug.Log($"[EndingTrigger] Pessimism ({pessimism}) ≥ 10 → The Wanderer");
            return EndingType.TheWanderer;
        }

        // 2. If (Idealism + Rationalism + Order) ≥ 15 → ENDING 1: The Sage
        int sageScore = idealism + rationalism + order;
        if (sageScore >= 15)
        {
            if (showDebugInfo)
                Debug.Log($"[EndingTrigger] Sage Score ({idealism}+{rationalism}+{order}={sageScore}) ≥ 15 → The Sage");
            return EndingType.TheSage;
        }

        // 3. If (Materialism + Empiricism + Chaos) ≥ 15 → ENDING 2: The Changemaker
        int changemakerScore = materialism + empiricism + chaos;
        if (changemakerScore >= 15)
        {
            if (showDebugInfo)
                Debug.Log($"[EndingTrigger] Changemaker Score ({materialism}+{empiricism}+{chaos}={changemakerScore}) ≥ 15 → The Changemaker");
            return EndingType.TheChangemaker;
        }

        // 4. Otherwise → The ending is determined by the highest individual score
        int maxValue = Mathf.Max(idealism, materialism, rationalism, empiricism, order, chaos, pessimism);
        
        if (showDebugInfo)
            Debug.Log($"[EndingTrigger] No threshold met, using highest individual score: {maxValue}");

        // Find which axis has the highest value (in case of ties, priority order matters)
        if (pessimism == maxValue) return EndingType.TheWanderer;
        if (idealism == maxValue) return EndingType.TheSage;
        if (rationalism == maxValue) return EndingType.TheSage;
        if (order == maxValue) return EndingType.TheSage;
        if (materialism == maxValue) return EndingType.TheChangemaker;
        if (empiricism == maxValue) return EndingType.TheChangemaker;
        if (chaos == maxValue) return EndingType.TheChangemaker;

        // Fallback (should not happen if MoralSystem is working correctly)
        Debug.LogWarning("[EndingTrigger] Could not determine ending, defaulting to The Sage");
        return EndingType.TheSage;
    }

    /// <summary>
    /// Triggers the appropriate ending scene based on moral axis values
    /// </summary>
    public void TriggerEnding()
    {
        EndingType ending = CalculateEnding();
        LoadEndingScene(ending);
    }

    /// <summary>
    /// Loads the scene for the specified ending
    /// </summary>
    /// <param name="endingType">The type of ending to load</param>
    public void LoadEndingScene(EndingType endingType)
    {
        EndingScene endingScene = GetEndingScene(endingType);
        
        if (endingScene == null)
        {
            Debug.LogError($"[EndingTrigger] No ending scene configured for {endingType}!");
            return;
        }

        if (string.IsNullOrEmpty(endingScene.sceneName))
        {
            Debug.LogError($"[EndingTrigger] Scene name is empty for ending {endingType}!");
            return;
        }

        Debug.Log($"[EndingTrigger] Loading ending scene: {endingScene.sceneName} ({endingType})");
        Debug.Log($"[EndingTrigger] Ending Description: {endingScene.description}");

        // Save the current moral state before transitioning
        if (MoralSystem.Instance != null)
        {
            MoralSystem.Instance.LogCurrentValues();
        }

        // Load the ending scene
        SceneManager.LoadScene(endingScene.sceneName);
    }

    /// <summary>
    /// Gets the ending scene configuration for the specified ending type
    /// </summary>
    private EndingScene GetEndingScene(EndingType endingType)
    {
        foreach (var scene in endingScenes)
        {
            if (scene.endingType == endingType)
                return scene;
        }
        return null;
    }

    /// <summary>
    /// Test method to verify ending calculation logic
    /// </summary>
    [ContextMenu("Test Ending Calculation")]
    public void TestEndingCalculation()
    {
        if (MoralSystem.Instance == null)
        {
            Debug.LogError("[EndingTrigger] Cannot test ending calculation - MoralSystem.Instance is null!");
            return;
        }

        Debug.Log("=== ENDING CALCULATION TEST ===");
        EndingType result = CalculateEnding();
        Debug.Log($"Current ending would be: {result}");
        
        EndingScene scene = GetEndingScene(result);
        if (scene != null)
        {
            Debug.Log($"Scene to load: {scene.sceneName}");
            Debug.Log($"Description: {scene.description}");
        }
        Debug.Log("===============================");
    }

    /// <summary>
    /// Public method to check what ending would be triggered without actually triggering it
    /// </summary>
    /// <returns>The ending type that would be triggered</returns>
    public EndingType PreviewEnding()
    {
        return CalculateEnding();
    }

    /// <summary>
    /// Gets a description of the ending that would be triggered
    /// </summary>
    /// <returns>Description string of the ending</returns>
    public string GetEndingDescription()
    {
        EndingType endingType = CalculateEnding();
        EndingScene scene = GetEndingScene(endingType);
        return scene?.description ?? "No description available";
    }
}