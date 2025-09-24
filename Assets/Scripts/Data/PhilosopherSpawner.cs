using System.Collections.Generic;
using UnityEngine;

public class PhilosopherSpawner : MonoBehaviour
{
    [System.Serializable]
    public class SpawnDef
    {
        public PhilosopherData data;
        public Vector2 position;
    }

    [SerializeField] private PhilosopherNPC philosopherPrefab;
    [SerializeField] private List<SpawnDef> spawns = new();

    private readonly List<PhilosopherNPC> _spawned = new();

    public IReadOnlyList<PhilosopherNPC> Spawned => _spawned;

    public void Clear()
    {
        foreach (var npc in _spawned)
            if (npc) Destroy(npc.gameObject);
        _spawned.Clear();
    }

    public void SpawnAll()
    {
        Clear();
        foreach (var s in spawns)
        {
            if (!s.data || !philosopherPrefab) continue;
            var npc = Instantiate(philosopherPrefab, s.position, Quaternion.identity, transform);
            npc.Initialize(s.data);
            _spawned.Add(npc);
        }
    }
}