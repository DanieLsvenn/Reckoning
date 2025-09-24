using System.Linq;
using UnityEngine;

public class InteractRouter : MonoBehaviour
{
    [SerializeField] private PlayerController2D player;
    [SerializeField] private PhilosopherSpawner spawner;

    private void Awake()
    {
        if (player)
            player.OnInteract += HandleInteract;
    }

    private void OnDestroy()
    {
        if (player)
            player.OnInteract -= HandleInteract;
    }

    private void HandleInteract()
    {
        if (spawner == null) return;
        var me = player.transform.position;
        var target = spawner.Spawned
            .Where(n => n != null)
            .OrderBy(n => Vector2.SqrMagnitude((Vector2)n.transform.position - (Vector2)me))
            .FirstOrDefault();
        if (target)
            target.TryInteract(); // Phase 2 will open dialogue
    }
}