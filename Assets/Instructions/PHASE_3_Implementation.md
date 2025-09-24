# PHASE 3: Sticker System & Visual Effects

Scope

- Data-driven stickers per philosopher and/or per dialogue choice
- Stickers start hidden; animate in on matching tags or choice
- Support multiple stickers per trigger
- Non-blocking: dialogue auto-continues after spawn (unless a choice is required)
- ScriptableObject as primary data source; JSON also supported

Assumptions

- Phase 2 is integrated; DialogueRunner surfaces tags per line
- Tags like `#sticker:idealism_sun` are available; you can also address by `philosopherId` + `dialogueChoice`

---

1. Data Model

**Step 1: Create the StickerItem and StickerSet scripts**

- In Assets/Scripts folder, right-click > Create > Folder, name it "Stickers"
- In Stickers folder, right-click > Create > C# Script, name it `StickerDefinition`
- Replace the content with:

`StickerDefinition.cs`

```csharp
using UnityEngine;

[System.Serializable]
public class StickerItem
{
    public string key;                // e.g., "idealism_sun"
    public Sprite sprite;
    public Vector2 position;
    public float fadeInTime = 0.5f;
    public float scaleInTime = 0.35f;
    public float startScale = 0.8f;
    public bool bounce;
}

[CreateAssetMenu(menuName = "Game/Visual/Sticker Set")]
public class StickerSet : ScriptableObject
{
    public string philosopherId;      // e.g., "plato"

    [Tooltip("Match by sticker key via #sticker:key tag")]
    public StickerItem[] stickers;    // globally available by key
}
```

**Step 2: Create the choice mapping script (optional)**

- In Assets/Scripts/Stickers folder, right-click > Create > C# Script, name it `StickerChoiceMap`
- Replace the content with:

Alternate mapping by choice label
`StickerChoiceMap.cs`

```csharp
using UnityEngine;

[CreateAssetMenu(menuName = "Game/Visual/Sticker Choice Map")]
public class StickerChoiceMap : ScriptableObject
{
    public string philosopherId; // e.g., "plato"

    [System.Serializable]
    public class ChoiceStickers
    {
        public string choiceKey;    // e.g., "idealism" from ink choice tag #choice:idealism
        public StickerItem[] stickers;
    }

    public ChoiceStickers[] mappings;
}
```

**Step 3: Create sticker data assets**

- In Project window, right-click Assets/Data > Create > Folder, name it "Stickers"
- In Stickers folder, right-click > Create > Game/Visual/Sticker Set, name it "PlatoStickers"
- Select the PlatoStickers asset and configure it:
  - Philosopher Id: "plato"
  - Set Stickers array size to 3
  - Fill each sticker:
    - Key: "idealism_sun", Sprite: (assign sun sprite), Position: (2, 1), Fade In Time: 0.5
    - Key: "idealism_cave", Sprite: (assign cave sprite), Position: (3, 0), Fade In Time: 0.8
    - Key: "idealism_light", Sprite: (assign light sprite), Position: (1, 2), Fade In Time: 1.2

**Step 4: JSON option (alternative to ScriptableObjects)**

- If your team prefers JSON files, create `Assets/Data/Stickers/plato_stickers.json`:
- Copy this example and adjust sprite names/positions as needed:

JSON option (for teams preferring text data)

- Example file `Assets/Data/Stickers/plato_stickers.json`:

```json
{
  "philosopherId": "plato",
  "dialogueChoice": "idealism",
  "stickers": [
    { "key": "idealism_sun", "position": [2, 1], "fadeInTime": 0.5 },
    { "key": "idealism_cave", "position": [3, 0], "fadeInTime": 0.8 },
    { "key": "idealism_light", "position": [1, 2], "fadeInTime": 1.2 }
  ]
}
```

---

2. Runtime: Sticker System

**Step 1: Create the StickerSystem script**

- In Assets/Scripts/Stickers folder, right-click > Create > C# Script, name it `StickerSystem`
- Replace the content with:

`StickerSystem.cs`

```csharp
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class StickerSystem : MonoBehaviour
{
    [SerializeField] private Transform stickerRoot; // parent in world space, near NPC
    [SerializeField] private StickerSet[] sets;      // assign per scene or global
    [SerializeField] private StickerChoiceMap[] choiceMaps;
    [SerializeField] private GameObject stickerPrefab; // simple SpriteRenderer container

    private readonly Dictionary<string, StickerItem> _index = new(); // key -> item

    private void Awake()
    {
        BuildIndex();
    }

    private void BuildIndex()
    {
        _index.Clear();
        foreach (var set in sets)
        {
            if (set?.stickers == null) continue;
            foreach (var s in set.stickers)
            {
                if (s == null || string.IsNullOrEmpty(s.key) || _index.ContainsKey(s.key)) continue;
                _index[s.key] = s;
            }
        }
    }

    public void SpawnByTag(string stickerKey)
    {
        if (!_index.TryGetValue(stickerKey, out var item))
        {
            Debug.LogWarning($"Sticker key not found: {stickerKey}");
            return;
        }
        Spawn(item);
    }

    public void SpawnByChoice(string philosopherId, string choiceKey)
    {
        foreach (var map in choiceMaps)
        {
            if (map == null || map.philosopherId != philosopherId) continue;
            foreach (var m in map.mappings)
            {
                if (m.choiceKey == choiceKey)
                {
                    foreach (var s in m.stickers)
                        Spawn(s);
                }
            }
        }
    }

    private void Spawn(StickerItem item)
    {
        if (!stickerPrefab) return;
        var go = Instantiate(stickerPrefab, stickerRoot ? stickerRoot : transform);
        go.transform.localPosition = item.position;
        var sr = go.GetComponentInChildren<SpriteRenderer>();
        if (sr) sr.sprite = item.sprite;
        var anim = go.GetComponent<StickerAnimator>();
        if (anim)
        {
            anim.PlayIn(item.fadeInTime, item.scaleInTime, item.startScale, item.bounce);
        }
    }
}
```

**Step 2: Create the StickerAnimator script**

- In Assets/Scripts/Stickers folder, right-click > Create > C# Script, name it `StickerAnimator`
- Replace the content with:

`StickerAnimator.cs`

```csharp
using System.Collections;
using UnityEngine;

public class StickerAnimator : MonoBehaviour
{
    private CanvasGroup cg;
    private Transform tr;
    private SpriteRenderer[] srs;

    private void Awake()
    {
        tr = transform;
        cg = GetComponent<CanvasGroup>(); // optional
        srs = GetComponentsInChildren<SpriteRenderer>(true);
        SetAlpha(0f);
    }

    public void PlayIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        StopAllCoroutines();
        StartCoroutine(CoIn(fadeIn, scaleIn, startScale, bounce));
    }

    private IEnumerator CoIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        float t = 0f;
        var endScale = Vector3.one;
        tr.localScale = Vector3.one * Mathf.Max(0.001f, startScale);
        SetAlpha(0f);

        float maxDur = Mathf.Max(Mathf.Max(0.0001f, fadeIn), Mathf.Max(0.0001f, scaleIn));
        while (t < maxDur)
        {
            t += Time.deltaTime;
            float a = Mathf.Clamp01(fadeIn <= 0f ? 1f : t / fadeIn);
            float s = Mathf.Clamp01(scaleIn <= 0f ? 1f : t / scaleIn);
            SetAlpha(a);
            tr.localScale = Vector3.Lerp(Vector3.one * startScale, endScale, EaseOutBack(s, bounce ? 1.5f : 0f));
            yield return null;
        }
        SetAlpha(1f);
        tr.localScale = endScale;
    }

    private void SetAlpha(float a)
    {
        if (cg) cg.alpha = a;
        if (srs != null)
        {
            for (int i = 0; i < srs.Length; i++)
            {
                var sr = srs[i];
                if (!sr) continue;
                var c = sr.color;
                c.a = a;
                sr.color = c;
            }
        }
    }

    private static float EaseOutBack(float x, float overshoot)
    {
        if (overshoot <= 0f) return 1f - Mathf.Pow(1f - x, 2f);
        float c1 = overshoot;
        float c3 = c1 + 1f;
        return 1f + c3 * Mathf.Pow(x - 1f, 3) + c1 * Mathf.Pow(x - 1f, 2);
    }
}
```

**Step 3: Create the Sticker prefab**

- In Hierarchy, right-click > Create Empty, name it "Sticker"
- Add components:
  - Click "Add Component" > Rendering > Sprite Renderer
  - Click "Add Component" > UI > Canvas Group (this controls transparency)
  - Click "Add Component" > Scripts > Sticker Animator
- Create prefab:
  - Create folder: In Project, right-click Assets/Prefabs > Create > Folder, name it "UI"
  - Drag Sticker from Hierarchy to Assets/Prefabs/UI folder
  - Delete the Sticker from Hierarchy (we only need the prefab)

**Step 4: Set up StickerSystem in scene**

- In Hierarchy, right-click > Create Empty, name it "StickerSystem"
- Position it near your philosophers (or as child of one philosopher for testing)
- Click "Add Component" > Scripts > Sticker System
- Configure the component:
  - Sticker Root: Drag StickerSystem (itself) into this field
  - Sets: Set size to 1, drag your PlatoStickers asset into element 0
  - Sticker Prefab: Drag the Sticker prefab from Assets/Prefabs/UI into this field

---

3. Integrate with Dialogue

**Step 1: Create the bridge script**

- In Assets/Scripts/Stickers folder, right-click > Create > C# Script, name it `StickerDialogueBridge`
- Replace the content with:

`StickerDialogueBridge.cs`

```csharp
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
        }

        // Optional: capture which NPC started the dialogue
        var linker = FindObjectOfType<InteractToDialogue>();
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

    private void OnEnd()
    {
        currentNPC = null;
    }
}
```

**Step 2: Add bridge to your scene**

- Select StickerSystem in Hierarchy
- Click "Add Component" > Scripts > Sticker Dialogue Bridge
- Configure the component:
  - Runner: Drag DialogueSystem from Hierarchy
  - Stickers: Drag StickerSystem (itself) into this field
  - Spawner: Drag LevelRoot from Hierarchy (which has the PhilosopherSpawner)

**Step 3: Test sticker integration**

- Make sure your Plato.ink file has sticker tags like `#sticker:idealism_sun`
- Make sure your PlatoStickers asset has a sticker with key "idealism_sun"
- Press Play, interact with Plato, and you should see stickers fade in during dialogue!

---

4. Dialogue Auto-Continue

**How it works:**

- The DialogueRunner from Phase 2 already continues lines automatically until choices appear
- Sticker spawns happen immediately when tags are processed - they don't block dialogue flow
- Sticker animations run independently using coroutines, so dialogue keeps moving
- Only actual choices pause the dialogue flow

**No additional setup needed** - the system is designed to be non-blocking by default!

---

5. Editor Workflow Summary

**Complete setup steps:**

1. **Create sticker assets:**

   - StickerSet assets in Assets/Data/Stickers/ with proper keys and sprites
   - Keys must match the tags in your Ink files (`#sticker:key_name`)

2. **Set up scene objects:**

   - StickerSystem GameObject with all scripts attached
   - Sticker prefab assigned and configured
   - StickerDialogueBridge connected to DialogueRunner and StickerSystem

3. **Ink content:**

   - Add `#sticker:key_name` tags to your dialogue lines
   - Multiple stickers per line: `#sticker:sun #sticker:cave #sticker:light`

4. **Test workflow:**
   - Press Play > Interact with philosopher
   - Dialogue with sticker tags should spawn animated sprites
   - Stickers appear at positions relative to StickerSystem root

---

6. Quick Test Checklist

**What should work:**

- ✅ Lines tagged with `#sticker:*` spawn matching sprites at defined positions
- ✅ Multiple stickers per line work (add multiple tags: `#sticker:sun #sticker:cave`)
- ✅ Dialogue continues automatically; only pauses for actual choices
- ✅ Stickers fade in with smooth animation (scale + alpha)

**Troubleshooting:**

- **Stickers don't appear:** Check that sticker keys in Ink match exactly with StickerSet keys
- **Wrong positions:** Verify StickerSystem position and sticker Position values in StickerSet
- **No animation:** Ensure CanvasGroup and StickerAnimator are on the sticker prefab
- **Stickers too fast/slow:** Adjust fadeInTime and scaleInTime in StickerItem data

---

## Troubleshooting: Sticker tags do not spawn

Symptom

- Log shows:
  - [MoralSystem] Processing tag: 'sticker:idealism_sun'
  - [MoralSystem] Tag doesn't start with 'moral:': 'sticker:idealism_sun'
- Sticker doesn’t appear.

Root cause

- DialogueRunner is not broadcasting tags to the Sticker system. MoralSystem correctly ignores non-moral tags.

Fix

1. DialogueRunner: broadcast tags to listeners

```csharp
// filepath: Assets/Scripts/Dialogue/DialogueRunner.cs
using System;
using System.Collections.Generic;
// ...existing code...

public class DialogueRunner : MonoBehaviour
{
    // ...existing code...
    // NEW: broadcast all tags for each processed line/choice
    public event Action<List<string>> OnTags;
    // ...existing code...

    private void ProcessTags(List<string> tags)
    {
        // ...existing code that forwards tags to MoralSystem.ApplyTag (etc.)...

        // NEW: let other systems (stickers, sfx, camera) react to tags
        if (tags != null && tags.Count > 0)
            OnTags?.Invoke(tags);
    }

    // ...existing code...
}
```

2. StickerDialogueBridge: subscribe to OnTags and spawn stickers

```csharp
// filepath: Assets/Scripts/Stickers/StickerDialogueBridge.cs
using System;
using System.Collections.Generic;
using UnityEngine;
// ...existing code...

public class StickerDialogueBridge : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;
    [SerializeField] private StickerSystem stickers;
    // ...existing code...

    private void Awake()
    {
        if (runner)
        {
            // ...existing subscriptions...
            // NEW: subscribe to raw tags from DialogueRunner
            runner.OnTags += HandleTags;
        }
    }

    private void OnDestroy()
    {
        if (runner)
        {
            // ...existing unsubscriptions...
            // NEW: unsubscribe
            runner.OnTags -= HandleTags;
        }
    }

    // NEW: spawn any #sticker:* tags
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

    // ...existing code...
}
```

3. Optional: stop MoralSystem from logging non-moral tags

```csharp
// filepath: Assets/Scripts/Dialogue/MoralSystem.cs
// ...existing code...
public class MoralSystem : MonoBehaviour
{
    // ...existing code...
    public void ApplyTag(string tag)
    {
        // ...existing code (you may keep the initial debug if needed)...
        // Ignore non-moral tags silently to avoid noise
        if (!tag.StartsWith("moral:", StringComparison.OrdinalIgnoreCase))
            return;

        // ...existing code that parses and applies moral changes...
    }
}
```

4. Scene wiring checklist

- StickerDialogueBridge:
  - Runner: assign the same DialogueRunner used by your DialogueCanvasUI.
  - Stickers: assign your StickerSystem.
- StickerSystem:
  - Sets: include your “Plato Stickers” asset (with key “idealism_sun” exactly).
  - Sticker Prefab: a prefab with SpriteRenderer + CanvasGroup + StickerAnimator.
  - Sticker Root: a transform where stickers should appear (itself is fine).
- Test path:
  - Choose “To seek the Forms.” → the next line with `#sticker:idealism_sun` should spawn the sticker.

If it still doesn’t trigger, please share:

- DialogueRunner.cs (Continue/ProcessTags portions)
- StickerDialogueBridge component setup (screenshot)
- StickerSystem inspector (sets, prefab, root)
- Console logs around the choice/line where the tag appears

---

## Fallback: Direct sticker handling in DialogueRunner (no bridge)

If StickerDialogueBridge isn’t in the scene, wire stickers directly in DialogueRunner:

```csharp
// filepath: Assets/Scripts/Dialogue/DialogueRunner.cs
// ...existing code...
[SerializeField] private StickerSystem stickerSystem; // assign in Inspector

private void ProcessTags(List<string> tags)
{
    // ...existing code applying MoralSystem...

    // Directly spawn stickers for any #sticker:* tags
    foreach (var t in tags)
    {
        if (t.StartsWith("sticker:", StringComparison.OrdinalIgnoreCase))
        {
            var key = t.Substring("sticker:".Length).Trim();
            if (!string.IsNullOrEmpty(key))
                stickerSystem?.SpawnByTag(key);
        }
    }

    // ...existing code that invokes OnTags...
}
```

Scene wiring

- Select your DialogueRunner in Hierarchy and assign StickerSystem in the new field.
- Ensure StickerSystem has:
  - Sets including your “PlatoStickers” (key must match: idealism_sun).
  - Sticker Prefab assigned.
  - Sticker Root set (self is fine).

Now, when a line has `#sticker:idealism_sun`, the sticker spawns even without the bridge.

---

## Important: No Canvas required for world-space stickers

- If your stickers are world-space visuals near NPCs, use a SpriteRenderer-only prefab. You do NOT need a Canvas or CanvasGroup.
- If you want screen-space UI stickers (e.g., HUD overlay), use a Canvas + UI Image + CanvasGroup.

Sticker prefab variants

- World-space (recommended for this project):
  - Components: Sprite Renderer, Sticker Animator
  - DO NOT add Canvas or CanvasGroup.
- UI overlay (optional):
  - Parent under a Canvas (Screen Space or World Space), add Image + CanvasGroup + Sticker Animator.

Updated StickerAnimator (supports both SR and UI)

- Replace the previous StickerAnimator with the version below. It fades via CanvasGroup when present, otherwise via SpriteRenderer.color.a.

```csharp
// filepath: Assets/Scripts/Stickers/StickerAnimator.cs
using System.Collections;
using UnityEngine;

public class StickerAnimator : MonoBehaviour
{
    private CanvasGroup cg;
    private Transform tr;
    private SpriteRenderer[] srs;

    private void Awake()
    {
        tr = transform;
        cg = GetComponent<CanvasGroup>(); // optional
        srs = GetComponentsInChildren<SpriteRenderer>(true);
        SetAlpha(0f);
    }

    public void PlayIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        StopAllCoroutines();
        StartCoroutine(CoIn(fadeIn, scaleIn, startScale, bounce));
    }

    private IEnumerator CoIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        float t = 0f;
        var endScale = Vector3.one;
        tr.localScale = Vector3.one * Mathf.Max(0.001f, startScale);
        SetAlpha(0f);

        float maxDur = Mathf.Max(Mathf.Max(0.0001f, fadeIn), Mathf.Max(0.0001f, scaleIn));
        while (t < maxDur)
        {
            t += Time.deltaTime;
            float a = Mathf.Clamp01(fadeIn <= 0f ? 1f : t / fadeIn);
            float s = Mathf.Clamp01(scaleIn <= 0f ? 1f : t / scaleIn);
            SetAlpha(a);
            tr.localScale = Vector3.Lerp(Vector3.one * startScale, endScale, EaseOutBack(s, bounce ? 1.5f : 0f));
            yield return null;
        }
        SetAlpha(1f);
        tr.localScale = endScale;
    }

    private void SetAlpha(float a)
    {
        if (cg) cg.alpha = a;
        if (srs != null)
        {
            for (int i = 0; i < srs.Length; i++)
            {
                var sr = srs[i];
                if (!sr) continue;
                var c = sr.color;
                c.a = a;
                sr.color = c;
            }
        }
    }

    private static float EaseOutBack(float x, float overshoot)
    {
        if (overshoot <= 0f) return 1f - Mathf.Pow(1f - x, 2f);
        float c1 = overshoot;
        float c3 = c1 + 1f;
        return 1f + c3 * Mathf.Pow(x - 1f, 3) + c1 * Mathf.Pow(x - 1f, 2);
    }
}
```

Sticker prefab (world-space) setup

- Hierarchy: Create Empty “Sticker”
- Add:
  - Sprite Renderer
  - Sticker Animator (new version above)
- Make a prefab and assign it to StickerSystem.Sticker Prefab.

Optional UI variant

- Under a Canvas:
  - Add Image + CanvasGroup + Sticker Animator
  - StickerSystem will still work; StickerAnimator will fade via CanvasGroup.
