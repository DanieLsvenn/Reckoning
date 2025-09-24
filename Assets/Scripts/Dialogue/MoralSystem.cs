using System;
using System.Collections.Generic;
using UnityEngine;

[DefaultExecutionOrder(-50)]
public class MoralSystem : MonoBehaviour
{
    [Serializable]
    public class AxisValue
    {
        public MoralAxis axis;
        public int value;
    }

    [SerializeField] private List<AxisValue> initial = new();

    private readonly Dictionary<MoralAxis, int> _values = new();

    public static MoralSystem Instance { get; private set; }

    // --- Live Inspector view (serialized so it shows and updates in the default Inspector)
    [Serializable]
    private class LiveAlignment
    {
        public int Idealism;
        public int Materialism;
        public int Rationalism;
        public int Empiricism;
        public int Order;
        public int Chaos;
        public int Pessimism;
    }

    [Header("Live Alignment Shift")]
    [SerializeField] private LiveAlignment live = new LiveAlignment();

    [Tooltip("Optional HUD overlay in Play Mode.")]
    [SerializeField] private bool showOverlay = false;
    [SerializeField] private Vector2 overlayPos = new Vector2(20, 20);

    private void Awake()
    {
        if (Instance && Instance != this) { Destroy(gameObject); return; }
        Instance = this;

        foreach (MoralAxis a in Enum.GetValues(typeof(MoralAxis)))
            _values[a] = 0;
        foreach (var iv in initial)
            _values[iv.axis] = iv.value;

        SyncLiveFromValues();
    }

    public int Get(MoralAxis axis) => _values[axis];

    public void Add(MoralAxis axis, int delta)
    {
        _values[axis] = Get(axis) + delta;
        SyncLiveFromValues();
    }

    public void LogCurrentValues()
    {
        Debug.Log("=== MORAL COMPASS ===");
        foreach (MoralAxis axis in Enum.GetValues(typeof(MoralAxis)))
        {
            Debug.Log($"{axis}: {Get(axis)}");
        }
        Debug.Log("=====================");
    }

    public void ApplyTag(string tag)
    {
        // Ignore non-moral tags silently to reduce noise
        if (!tag.StartsWith("moral:", StringComparison.OrdinalIgnoreCase))
            return;

        Debug.Log($"[MoralSystem] Processing moral tag: '{tag}'");

        var parts = tag.Split(':');
        if (parts.Length < 3)
        {
            Debug.Log($"[MoralSystem] Tag doesn't have 3 parts: '{tag}' (has {parts.Length})");
            return;
        }

        var axisStr = parts[1].Trim();
        var deltaStr = parts[2].Trim();

        Debug.Log($"[MoralSystem] Parsed - Axis: '{axisStr}', Delta: '{deltaStr}'");

        if (TryParseAxis(axisStr, out var axis) && int.TryParse(deltaStr, out var delta))
        {
            Debug.Log($"[MoralSystem] Successfully applying {delta} to {axis}");
            Add(axis, delta);
        }
        else
        {
            Debug.Log($"[MoralSystem] Failed to parse - Axis valid: {TryParseAxis(axisStr, out _)}, Delta valid: {int.TryParse(deltaStr, out _)}");
        }
    }

    private static bool TryParseAxis(string s, out MoralAxis axis)
    {
        foreach (MoralAxis a in Enum.GetValues(typeof(MoralAxis)))
            if (string.Equals(a.ToString(), s, StringComparison.OrdinalIgnoreCase))
            { axis = a; return true; }
        axis = default; return false;
    }

    // --- Keep the serialized 'live' struct in sync so the Inspector shows real-time numbers
    private void SyncLiveFromValues()
    {
        live.Idealism   = Get(MoralAxis.Idealism);
        live.Materialism= Get(MoralAxis.Materialism);
        live.Rationalism= Get(MoralAxis.Rationalism);
        live.Empiricism = Get(MoralAxis.Empiricism);
        live.Order      = Get(MoralAxis.Order);
        live.Chaos      = Get(MoralAxis.Chaos);
        live.Pessimism  = Get(MoralAxis.Pessimism);
    }

    // --- Optional runtime overlay for quick visual feedback without opening the Inspector
    private void OnGUI()
    {
        if (!showOverlay || !Application.isPlaying) return;

        float x = overlayPos.x;
        float y = overlayPos.y;
        float line = 20f;
        float width = 220f;
        int rows = 1 + 7; // title + 7 axes

        GUI.Box(new Rect(x, y, width, rows * line + 10), "Live Alignment");
        y += 25f;

        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Idealism: {live.Idealism}");   y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Materialism: {live.Materialism}"); y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Rationalism: {live.Rationalism}"); y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Empiricism: {live.Empiricism}");   y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Order: {live.Order}");             y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Chaos: {live.Chaos}");             y += line;
        GUI.Label(new Rect(x + 10, y, width - 20, line), $"Pessimism: {live.Pessimism}");     y += line;
    }
}