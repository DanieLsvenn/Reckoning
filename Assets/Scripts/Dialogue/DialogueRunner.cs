using System;
using System.Collections.Generic;
using Ink;
using Ink.Runtime;
using UnityEngine;

public class DialogueRunner : MonoBehaviour
{
    [Header("Story Source")]
    [SerializeField] private TextAsset inkJson;

    public event Action<string, List<string>> OnLine; // content, tags
    public event Action<List<string>> OnChoices; // choice texts
    public event Action OnEnd;
    public event Action<List<string>> OnTags;

    // Static property to track if dialogue is currently active
    public static bool IsDialogueActive { get; private set; } = false;
    
    // Track the current NPC being talked to
    private PhilosopherNPC currentNPC;

    // NEW: sticker integration controls
    [Header("Tags & Stickers")]
    [SerializeField] private StickerSystem stickerSystem;      // assign for anchoring
    [SerializeField] private bool broadcastTags = true;        // emit OnTags for listeners
    [SerializeField] private bool spawnStickersInRunner = false; // if true, runner spawns stickers directly

    private Story story;

    public void SetCurrentNPC(PhilosopherNPC npc)
    {
        currentNPC = npc;
    }
    
    public void Begin(TextAsset source)
    {
        inkJson = source;
        story = new Story(inkJson.text);
        InkSaveLoad.TryLoad(story);
        story.onError += (msg, type) =>
        {
            if (type == ErrorType.Warning) Debug.LogWarning(msg);
            else Debug.LogError(msg);
        };
        
        // Set dialogue as active when starting
        IsDialogueActive = true;
        
        Continue();
    }

    public void Choose(int index)
    {
        if (story == null) return;

        // NEW: apply tags attached to the selected choice itself
        if (story.currentChoices != null && index >= 0 && index < story.currentChoices.Count)
        {
            var choice = story.currentChoices[index];
            if (choice?.tags != null && choice.tags.Count > 0)
                ProcessTags(new List<string>(choice.tags));
        }

        story.ChooseChoiceIndex(index);
        Continue();
    }

    public void Continue()
    {
        if (story == null) return;

        // If a choice is already waiting, show it and return.
        if (!story.canContinue && story.currentChoices != null && story.currentChoices.Count > 0)
        {
            var choiceTexts = new List<string>();
            foreach (var c in story.currentChoices)
                choiceTexts.Add(c.text);
            OnChoices?.Invoke(choiceTexts);
            return;
        }

        // Step exactly one (non-empty) line.
        if (story.canContinue)
        {
            string text = null;
            do
            {
                text = story.Continue().Trim();
            }
            while (string.IsNullOrEmpty(text) && story.canContinue);

            var tags = new List<string>(story.currentTags);
            ProcessTags(tags);

            if (!string.IsNullOrEmpty(text))
            {
                OnLine?.Invoke(text, tags);
                return; // stop here; UI/typewriter controls when to call Continue again
            }
        }

        // No more content this step; either show choices or end.
        if (story.currentChoices != null && story.currentChoices.Count > 0)
        {
            var choiceTexts = new List<string>();
            foreach (var c in story.currentChoices)
                choiceTexts.Add(c.text);
            OnChoices?.Invoke(choiceTexts);
        }
        else
        {
            // Mark current NPC as talked to before ending dialogue
            if (currentNPC?.Data != null)
            {
                PhilosopherNPC.MarkAsTalkedTo(currentNPC.Data.philosopherId);
            }
            
            // Set dialogue as inactive when ending
            IsDialogueActive = false;
            
            // Clear current NPC reference
            currentNPC = null;
            
            OnEnd?.Invoke();
        }
    }

    private void ProcessTags(List<string> tags)
    {
        if (tags == null) return;

        Debug.Log($"[DialogueRunner] Processing {tags.Count} tags: [{string.Join(", ", tags)}]");

        bool hasMoralTag = false;
        foreach (var t in tags)
        {
            if (t.StartsWith("moral:", StringComparison.OrdinalIgnoreCase))
                hasMoralTag = true;
            MoralSystem.Instance?.ApplyTag(t);
        }

        // Anchor sticker root to speaker (safe even if we don't spawn here)
        TryAnchorStickerRootToSpeaker(tags);

        // Spawn stickers here ONLY if explicitly enabled
        if (spawnStickersInRunner && stickerSystem != null)
        {
            foreach (var t in tags)
            {
                if (t.StartsWith("sticker:", StringComparison.OrdinalIgnoreCase))
                {
                    var key = t.Substring("sticker:".Length).Trim();
                    if (!string.IsNullOrEmpty(key))
                        stickerSystem.SpawnByTag(key);
                }
            }
        }

        // Notify listeners only if enabled (prevents duplicate spawns if your bridge uses OnLine)
        if (broadcastTags && tags.Count > 0)
            OnTags?.Invoke(tags);

        // Log moral compass after any moral changes
        if (hasMoralTag && MoralSystem.Instance != null)
        {
            MoralSystem.Instance.LogCurrentValues();
        }
    }

    // NEW: move the StickerSystem to the philosopher speaking (by #speaker:id)
    private void TryAnchorStickerRootToSpeaker(List<string> tags)
    {
        if (stickerSystem == null || tags == null) return;

        // Find the first speaker:* tag
        string speakerId = null;
        for (int i = 0; i < tags.Count; i++)
        {
            var t = tags[i];
            if (t.StartsWith("speaker:", StringComparison.OrdinalIgnoreCase))
            {
                speakerId = t.Substring("speaker:".Length).Trim();
                break;
            }
        }
        if (string.IsNullOrEmpty(speakerId)) return;

        // Find the philosopher NPC in scene whose data.philosopherId matches the tag
        var npcs = UnityEngine.Object.FindObjectsByType<PhilosopherNPC>(FindObjectsInactive.Exclude, FindObjectsSortMode.None);
        for (int i = 0; i < npcs.Length; i++)
        {
            var npc = npcs[i];
            if (npc && npc.Data && string.Equals(npc.Data.philosopherId, speakerId, StringComparison.OrdinalIgnoreCase))
            {
                // StickerSystem.StickerRoot points to its own Transform in your inspector,
                // so moving the StickerSystem transform anchors spawns near the speaker.
                stickerSystem.transform.position = npc.transform.position;
                return;
            }
        }
    }
}