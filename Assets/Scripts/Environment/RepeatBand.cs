using System.Collections.Generic;
using UnityEngine;

// Robust band tiler: keeps 3 (or more) child tiles and reuses them in a ring.
// No parent movement, no divisions in update => no NaN.
[DisallowMultipleComponent]
public class RepeatBand : MonoBehaviour
{
    [SerializeField] private Transform player;
    [SerializeField] private float tileWidth = 0f; // world width of one tile; 0 = auto from first child SpriteRenderer
    [SerializeField] private Transform[] tileRefs; // optional manual assignment (otherwise auto-grab children with SpriteRenderer)
    [SerializeField] private bool debugLogs = false;

    private readonly List<Transform> _tiles = new();
    private readonly List<Vector3> _initialWorldPos = new();

    private void Awake()
    {
        CollectTiles();
        MeasureTileWidth();
        SortTilesByX();
        CacheInitialPositions();

        if (debugLogs)
        {
            Debug.Log($"[RepeatBand] Awake on {name}. Tiles={_tiles.Count}, tileWidth={tileWidth}", this);
            if (_tiles.Count == 0)
                Debug.LogWarning("[RepeatBand] No child tiles with SpriteRenderer found. Assign tileRefs or add children.", this);
            if (tileWidth <= Mathf.Epsilon)
                Debug.LogWarning("[RepeatBand] tileWidth is <= 0. Set it manually or ensure at least one child has a SpriteRenderer.", this);
        }
    }

    private void CollectTiles()
    {
        _tiles.Clear();
        if (tileRefs != null && tileRefs.Length > 0)
        {
            foreach (var t in tileRefs)
                if (t != null) _tiles.Add(t);
        }
        else
        {
            var srs = GetComponentsInChildren<SpriteRenderer>();
            foreach (var sr in srs)
            {
                if (sr.transform != transform)
                    _tiles.Add(sr.transform);
            }
        }
    }

    private void MeasureTileWidth()
    {
        if (tileWidth > 0f) return;

        // Prefer deriving from child spacing if we have at least 2 tiles placed edge-to-edge.
        if (_tiles.Count >= 2)
        {
            SortTilesByX();
            tileWidth = Mathf.Abs(_tiles[1].position.x - _tiles[0].position.x);
        }

        // Fallback to bounds width if spacing didn’t yield a positive value.
        if (tileWidth <= Mathf.Epsilon && _tiles.Count > 0)
        {
            var sr = _tiles[0].GetComponent<SpriteRenderer>();
            if (sr != null)
                tileWidth = sr.bounds.size.x;
        }

        // Final clamp to avoid zero/NaN/Infinity
        if (!float.IsFinite(tileWidth) || tileWidth <= Mathf.Epsilon)
        {
            if (debugLogs) Debug.LogWarning("[RepeatBand] tileWidth invalid; defaulting to 1.", this);
            tileWidth = 1f;
        }
    }

    private void SortTilesByX()
    {
        _tiles.Sort((a, b) => a.position.x.CompareTo(b.position.x));
    }

    private void CacheInitialPositions()
    {
        _initialWorldPos.Clear();
        for (int i = 0; i < _tiles.Count; i++)
            _initialWorldPos.Add(_tiles[i].position);
    }

    private void LateUpdate()
    {
        if (!player)
        {
            if (debugLogs) Debug.LogWarning("[RepeatBand] No player assigned.", this);
            return;
        }
        if (_tiles.Count == 0)
        {
            if (debugLogs) Debug.LogWarning("[RepeatBand] No tiles to arrange.", this);
            return;
        }
        if (tileWidth <= Mathf.Epsilon)
        {
            if (debugLogs) Debug.LogWarning("[RepeatBand] tileWidth <= 0; skipping update.", this);
            return;
        }

        // Deterministic placement: align tiles around the player's X.
        float px = player.position.x;
        float centerX = Mathf.Round(px / tileWidth) * tileWidth; // snap to nearest tile multiple

        int n = _tiles.Count;
        int half = n / 2; // works for odd and even counts
        float startX = centerX - tileWidth * half;

        for (int i = 0; i < n; i++)
        {
            var t = _tiles[i];
            var basePos = (i < _initialWorldPos.Count) ? _initialWorldPos[i] : t.position;
            float targetX = startX + tileWidth * i;
            t.position = new Vector3(targetX, basePos.y, basePos.z);
        }

        if (debugLogs)
            Debug.Log($"[RepeatBand] centerX={centerX:F2}, tileWidth={tileWidth:F3}, n={n}", this);
    }
}