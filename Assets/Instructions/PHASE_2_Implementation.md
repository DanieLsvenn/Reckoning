# PHASE 2: Dialogue (Ink 0.15.1) & Moral Tracking

Scope

- Integrate Ink runtime (.json) with Unity 6000.0.50f1
- Branching dialogue with choice handling
- Centralized Moral System manager updated by dialogue choices
- Example Ink file, tags, and JSON save/load
- Editor workflow to assign Ink stories per Philosopher

Requirements

- Ink production version: 0.15.1
- Unity 6000.0.50f1, Input System enabled

References (APIs verified)

- Ink: `Ink.Runtime.Story`, `.Continue()`, `.canContinue`, `.currentChoices`, `.ChooseChoiceIndex()`, `.currentTags`, `.variablesState`, `.state.ToJson()`, `.state.LoadJson()`

---

1. Import Ink

1.1 Add Ink Unity Integration

- **Option A - Package Manager (recommended):**
  - Open Window > Package Manager
  - Click the "+" button in top-left > Add package by name
  - Enter: `com.inklestudios.ink-unity-integration`
  - Click "Add"
- **Option B - Manual download:**

  - Go to https://github.com/inkle/ink-unity-integration/releases
  - Download the latest .unitypackage file
  - In Unity: Assets > Import Package > Custom Package, select the downloaded file

    1.2 Project Foldering

Create these folders for organization:

- In Project window, right-click Assets > Create > Folder, name it "Ink"
- Right-click Assets > Create > Folder, name it "Data" (if not already created)
- In Data folder, right-click > Create > Folder, name it "Philosophers" (if not already created)
- In Scripts folder, right-click > Create > Folder, name it "Dialogue"

**Note:** The Ink integration will automatically compile `.ink` files into `.json` TextAssets in the same folder.

---

2. Example Ink Content

**Step 1: Create your first Ink file**

- In Project window, navigate to Assets/Ink folder
- Right-click in empty space > Create > Ink Story, name it "plato"
- Double-click to open it in your default text editor
- Replace all content with this example:

```ink
# author: Designer A
# title: Plato Encounter

VAR idealism = 0
VAR materialism = 0

=== plato_intro ===
Plato: Welcome, traveler. #speaker:plato
You seek the forms or the shadows? #tag:prompt
* Seek the forms. #moral:idealism:+1
    Plato: The sun illuminates truth. #speaker:plato #sticker:idealism_sun
    -> continue_path
* Chase the shadows. #moral:materialism:+1
    Plato: The cave calls to the senses. #speaker:plato #sticker:idealism_cave
    -> continue_path

=== continue_path ===
Plato: Consider what is real: the idea or the matter? #speaker:plato
+ The idea. #moral:idealism:+1 #sticker:idealism_light
    -> END
+ The matter. #moral:materialism:+1
    -> END
```

**Step 2: Test the Ink file**

- Save the file in your text editor
- Return to Unity - you should see `plato.json` appear next to `plato.ink`
- Select the `plato.ink` file in Project window
- In Inspector, click the "Play" button to test your dialogue
- A window will open where you can click through the dialogue and see how choices work

**Step 3: Understanding the tags**

- `#speaker:plato` - identifies who's talking (for UI)
- `#moral:idealism:+1` - adds 1 point to idealism moral axis
- `#sticker:idealism_sun` - triggers a visual sticker (Phase 3)
- `#tag:prompt` - general purpose tag for any game logic

---

3. Moral System Manager

**Step 1: Create the MoralAxis enum**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `MoralAxis`
- Replace the content with:

`MoralAxis.cs`

```csharp
public enum MoralAxis
{
    Idealism,
    Materialism,
    Rationalism,
    Empiricism,
    Order,
    Chaos,
    Pessimism,
}
```

**Step 2: Create the MoralSystem manager**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `MoralSystem`
- Replace the content with:

`MoralSystem.cs`

```csharp
using System;
using System.Collections.Generic;
using UnityEngine;

[DefaultExecutionOrder(-50)]
public class MoralSystem : MonoBehaviour
{
    [Serializable]
    public class AxisValue
    {
        public MoralAxis axis;
        public int value;
    }

    [SerializeField] private List<AxisValue> initial = new();

    private readonly Dictionary<MoralAxis, int> _values = new();

    public static MoralSystem Instance { get; private set; }

    private void Awake()
    {
        if (Instance && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
        foreach (MoralAxis a in Enum.GetValues(typeof(MoralAxis)))
            _values[a] = 0;
        foreach (var iv in initial)
            _values[iv.axis] = iv.value;
    }

    public int Get(MoralAxis axis) => _values[axis];
    public void Add(MoralAxis axis, int delta) => _values[axis] = Get(axis) + delta;

    public void ApplyTag(string tag)
    {
        // Expected formats: "moral:idealism:+1" or "moral:materialism:-1"
        // Case-insensitive axis name
        if (!tag.StartsWith("moral:", StringComparison.OrdinalIgnoreCase)) return;
        var parts = tag.Split(':');
        if (parts.Length < 3) return;
        var axisStr = parts[1].Trim();
        var deltaStr = parts[2].Trim();
        if (TryParseAxis(axisStr, out var axis) && int.TryParse(deltaStr, out var delta))
            Add(axis, delta);
    }

    private static bool TryParseAxis(string s, out MoralAxis axis)
    {
        foreach (MoralAxis a in Enum.GetValues(typeof(MoralAxis)))
            if (string.Equals(a.ToString(), s, StringComparison.OrdinalIgnoreCase))
            { axis = a; return true; }
        axis = default; return false;
    }
}
```

**Step 3: Add MoralSystem to your scene**

- In Hierarchy, right-click > Create Empty, name it "MoralSystem"
- With MoralSystem selected, click "Add Component" > Scripts > Moral System
- In the Inspector, you can set initial values for any moral axes if desired
- Expand the "Initial" list and click "+" to add entries
- For each entry, select an Axis from dropdown and set a starting Value

---

4. Dialogue Runner & UI Hooks

**Step 1: Create the DialogueRunner script**

- In Assets/Scripts/Dialogue folder, right-click > Create > C# Script, name it `DialogueRunner`
- Replace the content with:

`DialogueRunner.cs`

```csharp
using System;
using System.Collections.Generic;
using Ink.Runtime;
using UnityEngine;

public class DialogueRunner : MonoBehaviour
{
    [Header("Story Source")]
    [SerializeField] private TextAsset inkJson;

    public event Action<string, List<string>> OnLine;
    public event Action<List<string>> OnChoices;
    public event Action OnEnd;

    private Story story;

    public void Begin(TextAsset source)
    {
        inkJson = source;
        story = new Story(inkJson.text);
        story.onError += (msg, type) =>
        {
            if (type == ErrorType.Warning) Debug.LogWarning(msg);
            else Debug.LogError(msg);
        };
        Continue(); // emit first unit (one line or choices or end)
    }

    // Advance exactly one unit:
    // - If canContinue: emit one line
    // - Else if choices exist: emit choices
    // - Else: end
    public void Continue()
    {
        if (story == null) return;

        if (story.canContinue)
        {
            var text = story.Continue().Trim();
            var tags = new List<string>(story.currentTags);
            ProcessTags(tags);
            OnLine?.Invoke(text, tags);
            return;
        }

        if (story.currentChoices != null && story.currentChoices.Count > 0)
        {
            var choiceTexts = new List<string>();
            foreach (var c in story.currentChoices)
                choiceTexts.Add(c.text);
            OnChoices?.Invoke(choiceTexts);
            return;
        }

        OnEnd?.Invoke();
    }

    public void Choose(int index)
    {
        if (story == null) return;

        if (story.currentChoices != null && index >= 0 && index < story.currentChoices.Count)
        {
            var choice = story.currentChoices[index];
            if (choice?.tags != null && choice.tags.Count > 0)
                ProcessTags(new List<string>(choice.tags));
        }
        story.ChooseChoiceIndex(index);
        Continue();
    }

    private void ProcessTags(List<string> tags)
    {
        if (tags == null) return;
        foreach (var t in tags)
            MoralSystem.Instance?.ApplyTag(t);
    }
}
```

**Step 2: Create a simple UI for testing**

- In Assets/Scripts/Dialogue folder, right-click > Create > C# Script, name it `SimpleDialogueUI`
- Replace the content with:

Minimal UI example (placeholder)
`SimpleDialogueUI.cs`

```csharp
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
```

**Step 3: Set up the dialogue system in your scene**

- In Hierarchy, right-click > Create Empty, name it "DialogueSystem"
- With DialogueSystem selected, click "Add Component" > Scripts > Dialogue Runner
- Click "Add Component" > Scripts > SimpleDialogueUI
- Click "Add Component" > Scripts > Dialogue Controller
- In the SimpleDialogueUI component, drag DialogueSystem (itself) into the "Runner" field
- In the DialogueController component, drag DialogueSystem (itself) into the "Runner" field

---

4b. In‑game Dialogue UI (Canvas)

Goal: Show dialogue lines on screen and present clickable choices. This replaces the Console-only SimpleDialogueUI.

Prerequisites

- DialogueSystem GameObject exists with:
  - DialogueRunner (required)
  - DialogueController (required) → Runner assigned to DialogueSystem
- InteractToDialogue in the scene to start stories (already covered above)

A) Create the UI hierarchy

- Hierarchy > UI > Canvas
  - Canvas: Render Mode = Screen Space - Overlay
  - Add Component: Canvas Group
  - Add Component: Canvas Scaler → UI Scale Mode = Scale With Screen Size, Reference 1920x1080, Match = 0.5
- Under Canvas, add UI > Panel → rename to DialoguePanel
  - Anchor: bottom stretch (minX=0, maxX=1, minY=0, maxY=0)
  - Size: Height ~ 260–320, Left/Right = 40, Bottom = 40
  - Background color: black with alpha ~ 0.6
- DialoguePanel children:
  - UI > Text (or TextMeshPro - Text) → rename BodyText
    - Anchors: stretch top (minX=0, maxX=1), set Top=20, Left/Right=20, Height ~ 140–180
    - Alignment: Upper Left, Enable Rich Text, Overflow = Overflow
    - If using TMP, set TextMeshProUGUI instead of Text
  - Empty GameObject → rename Choices
    - Add Vertical Layout Group (Child Alignment = Upper Left, Spacing = 8, Control Child Size Width = true)
    - Add Content Size Fitter (Vertical Fit = Preferred Size)
    - RectTransform: anchor below BodyText, Left/Right=20, Bottom=20, Top just under BodyText
  - Under Choices, add UI > Button → rename ChoiceButton
    - Add a Text (or TMP) child named Label
    - On the Button, set Transition colors as desired
    - Disable ChoiceButton GameObject (this is the runtime template)

B) Add the Dialogue UI controller

- Select Canvas (or DialoguePanel) → Add Component: Dialogue Canvas UI
- Fill fields:
  - Runner: drag DialogueSystem (the one with DialogueRunner)
  - Canvas Group: drag the Canvas’s CanvasGroup
  - Root: drag DialoguePanel
  - Body TMP (TextMeshProUGUI): drag your BodyText TMP component here
  - Choices Parent: drag Choices
  - Choice Button Prefab: drag ChoiceButton (the disabled template)
  - Hide Delay On End: 0.2–0.3 seconds recommended so the final line stays visible

Notes

- DialogueCanvasUI is TMP-only for the main body text. Use a TextMeshProUGUI for BodyText.
- Choice buttons can use TMP or uGUI for their label; the script will set either if present.

C) Remove the console-only UI

- Select DialogueSystem
- Disable or remove SimpleDialogueUI to avoid duplicate handling/logging

D) Test flow

- Press Play, approach an NPC, press E
- Expected:
  - DialoguePanel becomes visible
  - The latest line appears in BodyText
  - One button per choice appears under Choices
  - Clicking a choice (or pressing 1/2/3/4) calls runner.Choose(index) and advances
  - On story end, the panel hides

TextMeshPro notes

- If you use TMP, ensure TextMeshPro is installed (Window > Package Manager)
- You can use the TMP field directly. If you set up a Scripting Define Symbol TMP_PRESENT, TMP label handling code is compiled; otherwise keep to uGUI Text

Troubleshooting (UI)

- Panel never shows: ensure Dialogue Canvas UI’s Runner is assigned and DialoguePanel is set as Root
- Choices never appear: Choice Button Prefab must be the disabled template under Choices; Choices Parent must be assigned
- Clicking choices does nothing: ensure DialogueSystem has DialogueRunner and DialogueController; InteractToDialogue should be active to begin stories
- Text is clipped or small: adjust Canvas Scaler and RectTransform padding; increase BodyText Height and set Overflow
- Final line disappears instantly at the end:
  - Cause: Ink emits the last line and then OnEnd in the same frame; UI hid immediately.
  - Fix: Set DialogueCanvasUI → Hide Delay On End > 0 (e.g., 0.2s).

---

5. Hook Philosophers to Dialogue

**Step 1: Update PhilosopherData to include Ink**

- Find your existing `PhilosopherData.cs` script (from Phase 1)
- It should already have an `inkJson` field
- If not, add this line to the class: `public TextAsset inkJson;`

**Step 2: Assign Ink files to your philosopher data**

- In Project window, find your philosopher data assets (e.g., Assets/Data/Philosophers/Plato.asset)
- Select the Plato asset
- In Inspector, drag the `plato.json` file into the "Ink Json" field
- Repeat for any other philosopher data assets you have

**Step 3: Create DialogueController**

- In Assets/Scripts/Dialogue folder, right-click > Create > C# Script, name it `DialogueController`
- Replace the content with:

`DialogueController.cs`

- In Inspector, assign `inkJson` field to the compiled `plato.json` TextAsset.

Create `DialogueController.cs` to bridge NPC interact to Runner.

`DialogueController.cs`

```csharp
using UnityEngine;

public class DialogueController : MonoBehaviour
{
    [SerializeField] private DialogueRunner runner;

    public void BeginFor(PhilosopherNPC npc)
    {
        if (npc?.Data?.inkJson) runner.Begin(npc.Data.inkJson);
    }
}
```

**Step 4: Create the interaction bridge**

- In Assets/Scripts/Dialogue folder, right-click > Create > C# Script, name it `InteractToDialogue`
- Replace the content with:

Wire into `PhilosopherNPC.TryInteract()` via a small mediator.

`InteractToDialogue.cs`

```csharp
using System.Collections;
using UnityEngine;

public class InteractToDialogue : MonoBehaviour
{
    [SerializeField] private DialogueController controller;

    private void OnEnable()
    {
        // Defer subscription one frame to allow any spawners/bootstraps to run
        StartCoroutine(SubscribeNextFrame());
    }

    private void OnDisable()
    {
        UnhookAll();
    }

    private IEnumerator SubscribeNextFrame()
    {
        yield return null; // wait one frame for spawns
        HookAll();
    }

    private void HookAll()
    {
        foreach (var npc in FindObjectsOfType<PhilosopherNPC>())
            npc.OnRequestInteract += HandleInteract;
    }

    private void UnhookAll()
    {
        foreach (var npc in FindObjectsOfType<PhilosopherNPC>())
            npc.OnRequestInteract -= HandleInteract;
    }

    private void HandleInteract(PhilosopherNPC npc)
    {
        controller.BeginFor(npc);
    }
}
```

**Step 5: Wire everything together in the scene**

- Select DialogueSystem in Hierarchy
- Click "Add Component" > Scripts > Dialogue Controller
- In DialogueController component, drag DialogueSystem (itself) into the "Runner" field

- Select LevelRoot in Hierarchy
- Click "Add Component" > Scripts > Interact To Dialogue
- In InteractToDialogue component, drag DialogueSystem into the "Controller" field

**Note:** The InteractToDialogue script automatically finds the spawner and connects to all NPCs. If you spawn philosophers after the scene starts, you'll need to manually subscribe to their events.

---

6. Saving & Loading Dialogue State (Optional)

**Step 1: Create save/load utility**

- In Assets/Scripts/Dialogue folder, right-click > Create > C# Script, name it `InkSaveLoad`
- Replace the content with:

`InkSaveLoad.cs`

```csharp
using UnityEngine;

public static class InkSaveLoad
{
    private const string Key = "INK_SAVE";

    public static void Save(DialogueRunner runner, Ink.Runtime.Story story)
    {
        if (story == null) return;
        var json = story.state.ToJson();
        PlayerPrefs.SetString(Key, json);
        PlayerPrefs.Save();
    }

    public static bool TryLoad(Ink.Runtime.Story story)
    {
        if (story == null) return false;
        if (!PlayerPrefs.HasKey(Key)) return false;
        var json = PlayerPrefs.GetString(Key);
        story.state.LoadJson(json);
        return true;
    }
}
```

**Step 2: Integrate with DialogueRunner (optional)**

- If you want to automatically save/load story progress, modify the `DialogueRunner.Begin()` method
- After creating the story: `story = new Story(inkJson.text);`
- Add this line: `InkSaveLoad.TryLoad(story);`
- This will resume from the last saved state if one exists

---

7. Editor Workflow & Testing

**Complete setup checklist:**

1. **Ink files created and compiled:**

   - `plato.ink` exists in Assets/Ink/ folder
   - `plato.json` was automatically generated
   - Test the ink by selecting `plato.ink` and clicking "Play" in Inspector

2. **Moral system in scene:**

   - MoralSystem GameObject exists in Hierarchy
   - MoralSystem script attached

3. **Dialogue system in scene:**

   - DialogueSystem GameObject exists in Hierarchy
   - DialogueRunner and SimpleDialogueUI scripts attached
   - DialogueController script attached with Runner field assigned

4. **Interaction bridge:**

   - LevelRoot has InteractToDialogue script
   - Controller field points to DialogueSystem

5. **Philosopher data linked:**
   - Each PhilosopherData asset has inkJson field assigned to corresponding .json file

**Test the complete system:**

- Press Play
- Move to a philosopher (you should see "!" indicator)
- Press E to interact
- Dialogue lines should appear in Console
- Choices should auto-select after short delay
- Check MoralSystem values in Inspector during dialogue to see moral changes

---

8. Quick Test Checklist

**What should work:**

- ✅ Dialogue lines print in Console with tags
- ✅ Choices appear and are auto-chosen by SimpleDialogueUI
- ✅ After choices with `#moral:*:+N`, check `MoralSystem.Instance.Get(axis)` reflects changes
- ✅ Save/load works if integrated

**Troubleshooting:**

- **No dialogue appears:** Check that inkJson field is assigned in PhilosopherData
- **Moral values don't change:** Ensure MoralSystem exists in scene and moral tags are formatted correctly (`#moral:idealism:+1`)
- **Can't interact:** Verify Player has "Player" tag and InteractToDialogue is connected to DialogueController

---

9. Next (Phase 3 Preview)

**What we'll add next:**

- Visual sticker system that responds to `#sticker:*` tags
- Animated stickers (fade-in, scale, bounce effects)
- Multiple stickers per dialogue choice
- Auto-continue dialogue flow without blocking on sticker animations

---

Quick wiring: make E trigger dialogue (2-minute checklist)

1. InteractRouter subscribes to Player.OnInteract

- In Hierarchy, select LevelRoot.
- Add Component > Scripts > Interact Router.
- In the InteractRouter:
  - Player: drag your Player from Hierarchy.
  - Spawner: drag LevelRoot (that has PhilosopherSpawner) or the specific PhilosopherSpawner GameObject.

2. DialogueSystem to run Ink

- Create an empty GameObject named DialogueSystem.
- Add Component > Scripts > Dialogue Runner.
- Add Component > Scripts > Simple Dialogue UI.
- Add Component > Scripts > Dialogue Controller.
- In SimpleDialogueUI, set Runner to DialogueSystem (itself).
- In DialogueController, set Runner to DialogueSystem (itself).

3. Philosopher data must have Ink

- For each Assets/Data/Philosophers/\*.asset, assign the compiled .json (e.g., plato.json) into Ink Json.

4. Player tag and triggers

- Select Player and set Tag = Player.
- Make sure each Philosopher prefab has a trigger Collider2D and the indicator assigned in PhilosopherNPC.

5. Test

- Enter Play. Approach philosopher (indicator shows), press E.
- Expected Console logs: E pressed → InteractRouter.HandleInteract → PhilosopherNPC.TryInteract → Dialogue lines from SimpleDialogueUI.

Troubleshooting

- If Player logs “no listeners are subscribed,” InteractRouter is missing or not assigned a Player reference.
- If “HandleInteract” runs but no lines show, DialogueSystem is missing or DialogueController.Runner is not assigned.
- If nothing happens near an NPC, check the NPC’s Collider2D is trigger, Player tag, and that PhilosopherData.inkJson is assigned.
- If nothing happens near an NPC, check the NPC’s Collider2D is trigger, Player tag, and that PhilosopherData.inkJson is assigned.

## Fix: Apply moral tags when a choice is selected

Why

- Tags written on choice lines (e.g., `* Do X #moral:rationalism:+1`) live on `Choice.tags`.
- Previously we only processed `story.currentTags` that accompany printed lines, so choice tags were never applied.

Change

- Edit `Assets/Scripts/Dialogue/DialogueRunner.cs`, in `Choose(int index)`:
  - Before `story.ChooseChoiceIndex(index)`, read `story.currentChoices[index].tags` and pass them to `ProcessTags(...)`.

Code (for reference)

```csharp
// in DialogueRunner.Choose(int index)
if (story.currentChoices != null && index >= 0 && index < story.currentChoices.Count)
{
    var choice = story.currentChoices[index];
    if (choice?.tags != null && choice.tags.Count > 0)
        ProcessTags(new List<string>(choice.tags));
}
story.ChooseChoiceIndex(index);
Continue();
```

Verify

1. Open scene, ensure a MoralSystem object is present.
2. Start a dialogue and select any response with `#moral:*:+N` (see `Assets/Ink/Dialogue/socrates.ink`).
3. Watch Console:
   - You should see `[MoralSystem] Successfully applying ...` and the “=== MORAL COMPASS ===” dump increase for the relevant axis.
4. Repeat with several choices to confirm accumulation.

Notes

- Format must be `#moral:<axis>:+N` or `#moral:<axis>:-N` (case-insensitive axis).
- Tags on printed lines are still processed as before; this change only adds handling for tags on choices.
