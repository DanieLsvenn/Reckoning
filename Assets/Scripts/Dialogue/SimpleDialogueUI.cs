using System.Collections.Generic;
using UnityEngine;

public class SimpleDialogueUI : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;

    private void Awake()
    {
        if (runner)
        {
            runner.OnLine += (text, tags) => Debug.Log($"LINE: {text} | TAGS: {string.Join(",", tags)}");
            runner.OnChoices += ShowChoices;
            runner.OnEnd += () => Debug.Log("DIALOGUE END");
        }
    }

    private void ShowChoices(List<string> choices)
    {
        for (int i = 0; i < choices.Count; i++)
            Debug.Log($"CHOICE {i}: {choices[i]}");
        // For testing, auto-pick choice 0 after short delay
        Invoke(nameof(ChooseZero), 0.25f);
    }

    private void ChooseZero()
    {
        runner.Choose(0);
    }
}