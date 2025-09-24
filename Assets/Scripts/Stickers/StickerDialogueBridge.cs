using System;
using System.Collections.Generic;
using UnityEngine;

public class StickerDialogueBridge : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;
    [SerializeField] private StickerSystem stickers;
    [SerializeField] private PhilosopherSpawner spawner;

    private PhilosopherNPC currentNPC;

    private void Awake()
    {
        if (runner)
        {
            runner.OnLine += OnLine;
            runner.OnChoices += OnChoices;
            runner.OnEnd += OnEnd;
            runner.OnTags += HandleTags;
        }

        // Optional: capture which NPC started the dialogue
        var linker = UnityEngine.Object.FindFirstObjectByType<InteractToDialogue>();
        if (linker == null) return; // if you keep a reference when starting BeginFor, set currentNPC there
    }

    public void SetCurrent(PhilosopherNPC npc) => currentNPC = npc;

    private void OnLine(string text, List<string> tags)
    {
        if (tags == null) return;
        foreach (var t in tags)
        {
            if (t.StartsWith("sticker:"))
            {
                var key = t.Substring("sticker:".Length).Trim();
                stickers?.SpawnByTag(key);
            }
        }
    }

    private void OnChoices(List<string> choices)
    {
        // UI displays choices. After the player selects, DialogueRunner.Choose() will continue lines
        // Use choice tags via Ink to map to sticker spawns in Choose()
    }

    private void HandleTags(List<string> tags)
    {
        if (tags == null || stickers == null) return;
        foreach (var t in tags)
        {
            if (t.StartsWith("sticker:", StringComparison.OrdinalIgnoreCase))
            {
                var key = t.Substring("sticker:".Length).Trim();
                if (!string.IsNullOrEmpty(key))
                    stickers.SpawnByTag(key);
            }
        }
    }

    private void OnEnd()
    {
        currentNPC = null;
    }
}