using UnityEngine;

public class DialogueController : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;

    public void BeginFor(PhilosopherNPC npc)
    {
        if (npc?.Data?.inkJson) 
        {
            // Set the current NPC in the runner before starting dialogue
            runner.SetCurrentNPC(npc);
            runner.Begin(npc.Data.inkJson);
        }
    }
}