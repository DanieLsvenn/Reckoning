using UnityEngine;

public class DialogueController : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;

    public void BeginFor(PhilosopherNPC npc)
    {
        if (npc?.Data?.inkJson) runner.Begin(npc.Data.inkJson);
    }
}