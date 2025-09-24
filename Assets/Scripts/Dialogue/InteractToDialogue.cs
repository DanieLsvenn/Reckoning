using UnityEngine;

public class InteractToDialogue : MonoBehaviour
{
    [SerializeField] private DialogueController controller;

    private void Awake()
    {
        // Subscribe to all NPCs at runtime
        var spawner = Object.FindFirstObjectByType<PhilosopherSpawner>();
        if (spawner)
        {
            foreach (var npc in spawner.Spawned)
                npc.OnRequestInteract += HandleInteract;
        }
    }

    private void OnDestroy()
    {
        var spawner = Object.FindFirstObjectByType<PhilosopherSpawner>();
        if (spawner)
        {
            foreach (var npc in spawner.Spawned)
                npc.OnRequestInteract -= HandleInteract;
        }
    }

    private void HandleInteract(PhilosopherNPC npc)
    {
        controller.BeginFor(npc);
    }
}