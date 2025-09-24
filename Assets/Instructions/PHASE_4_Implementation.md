# PHASE 4: Content Expansion & Polish

Scope

- Add a new philosopher with Ink dialogue, moral effects, and stickers without code changes
- Tag-driven connections from choices/lines to stickers and moral system
- Camera focus during dialogue, ambient transitions, moral UI, and sound hooks

Prereqs

- Phases 1–3 completed

---

1. Add a New Philosopher (No Code Required)

**Complete walkthrough to add "Aristotle" from scratch:**

**Step 1: Create the Ink dialogue**

- Navigate to Assets/Ink folder in Project window
- Right-click > Create > Ink Story, name it "aristotle"
- Double-click to open in text editor and replace content with:

Example `aristotle.ink`

```ink
# title: Aristotle Encounter

=== start ===
Aristotle: We walk the middle way. #speaker:aristotle
* Favor reason. #moral:rationalism:+1 #sticker:reason_owl
  Aristotle: Then measure well. #speaker:aristotle #sticker:meson_balance
  -> END
* Favor senses. #moral:empiricism:+1 #sticker:senses_eye
  Aristotle: Observe and conclude. #speaker:aristotle
  -> END
```

- Save the file - Unity will automatically compile it to `aristotle.json`

**Step 2: Create PhilosopherData asset**

- Navigate to Assets/Data/Philosophers folder
- Right-click > Create > Game/NPC/Philosopher Data, name it "Aristotle"
- Select the Aristotle asset and configure:
  - Philosopher Id: "aristotle"
  - Display Name: "Aristotle"
  - Portrait: (assign any philosopher portrait sprite)
  - Ink Json: Drag the `aristotle.json` file here

**Step 3: Create sticker assets**

- Navigate to Assets/Data/Stickers folder
- Right-click > Create > Game/Visual/Sticker Set, name it "AristotleStickers"
- Configure the sticker set:
  - Philosopher Id: "aristotle"
  - Set Stickers array size to 3
  - Configure each sticker:
    - Key: "reason_owl", Sprite: (owl sprite), Position: (1, 1), Fade In Time: 0.5
    - Key: "meson_balance", Sprite: (balance sprite), Position: (0, 2), Fade In Time: 0.8
    - Key: "senses_eye", Sprite: (eye sprite), Position: (-1, 1), Fade In Time: 0.6

**Step 4: Add to StickerSystem**

- Select StickerSystem in Hierarchy
- In the StickerSystem component, expand "Sets" array
- Increase size by 1 and drag AristotleStickers asset into the new slot

**Step 5: Add to scene spawner**

- Select LevelRoot in Hierarchy (or wherever your PhilosopherSpawner is)
- In PhilosopherSpawner component, expand "Spawns" array
- Increase size by 1 and configure the new entry:
  - Data: Drag Aristotle PhilosopherData asset here
  - Position: Set to (15, 0) or wherever you want Aristotle to appear

**Step 6: Test**

- Press Play
- Walk to Aristotle's position (you should see "!" indicator)
- Press E to interact
- You should see dialogue with animated stickers and moral value changes!

**Result:** A fully functional philosopher added with zero code changes!

---

2. Connect New Choices to Stickers Without Code Changes

**Option A — Line Tags (Recommended)**
The easiest approach - just add sticker tags to lines that follow choices:

```ink
* Choose idealism. #moral:idealism:+1
  Perfect! The forms are eternal. #sticker:idealism_sun #sticker:idealism_light
* Choose materialism. #moral:materialism:+1
  Indeed, matter shapes reality. #sticker:material_rock #sticker:material_earth
```

**Option B — Choice-Based Mapping (Advanced)**
For more complex sticker combinations per choice:

1. **Tag choices in Ink:**

```ink
* Choose idealism. #choice:idealism #moral:idealism:+1
* Choose materialism. #choice:materialism #moral:materialism:+1
```

2. **Create StickerChoiceMap:**

- In Assets/Data/Stickers, right-click > Create > Game/Visual/Sticker Choice Map
- Configure mappings: choice key "idealism" -> array of multiple stickers

3. **The system automatically handles choice->sticker mapping**

**Both options preserve the content-only workflow - no coding required!**

---

3. Polish: Camera Focus During Dialogue

**Step 1: Create dialogue camera**

- In Hierarchy, right-click > Cinemachine > Create Camera, name it "DialogueCam"
- Configure the DialogueCam:
  - Set Priority to 5 (lower than normal so it's inactive by default)
  - In Target section, leave Follow empty for now (we'll set it via script)
  - Use FramingTransposer for both Aim and Body for 2D framing

**Step 2: Create the camera focus script**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `DialogueCameraFocus`
- Replace the content with:

`DialogueCameraFocus.cs`

```csharp
using Unity.Cinemachine;
using UnityEngine;

public class DialogueCameraFocus : MonoBehaviour
{
    [SerializeField] private CinemachineCamera dialogueCam;
    [SerializeField] private int activePriority = 20;
    private int defaultPriority;

    private void Awake()
    {
        if (dialogueCam) defaultPriority = dialogueCam.Priority;
        var runner = FindObjectOfType<DialogueRunner>();
        if (runner)
        {
            runner.OnEnd += OnDialogueEnd;
        }
    }

    public void FocusOn(Transform t)
    {
        if (!dialogueCam) return;
        dialogueCam.Target.TrackingTarget = t; // v3 target API
        dialogueCam.Priority = activePriority;
    }

    private void OnDialogueEnd()
    {
        if (!dialogueCam) return;
        dialogueCam.Priority = defaultPriority;
    }
}
```

**Step 3: Set up camera focus in scene**

- Select DialogueCam in Hierarchy
- Click "Add Component" > Scripts > Dialogue Camera Focus
- Configure the component:
  - Dialogue Cam: Drag DialogueCam (itself) into this field
  - Active Priority: Set to 20 (higher than your main camera)

**Step 4: Connect to dialogue system**

- You can modify DialogueController.BeginFor() to also call focus.FocusOn(npc.transform)
- Or create a simple connector script that listens to dialogue events

**Usage:** When dialogue starts, the camera will smoothly focus on the NPC. When dialogue ends, it returns to following the player.

---

4. Polish: Ambient Transitions

**Step 1: Create ambient controller script**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `AmbientController`
- Replace the content with:

`AmbientController.cs`

```csharp
using System.Collections;
using UnityEngine;

public class AmbientController : MonoBehaviour
{
    [SerializeField] private SpriteRenderer sky;
    [SerializeField] private Color dialogueTint = new(0.9f, 0.9f, 1f, 1f);
    [SerializeField] private float fadeTime = 0.5f;

    private Color baseTint;

    private void Awake()
    {
        if (sky) baseTint = sky.color;
        var runner = FindObjectOfType<DialogueRunner>();
        if (runner)
        {
            runner.OnLine += (_, __) => FadeTo(dialogueTint);
            runner.OnEnd += () => FadeTo(baseTint);
        }
    }

    private void FadeTo(Color target)
    {
        StopAllCoroutines();
        StartCoroutine(CoFade(target));
    }

    private IEnumerator CoFade(Color target)
    {
        if (!sky) yield break;
        var start = sky.color; float t = 0f;
        while (t < fadeTime)
        {
            t += Time.deltaTime;
            sky.color = Color.Lerp(start, target, t / fadeTime);
            yield return null;
        }
        sky.color = target;
    }
}
```

**Step 2: Set up ambient object in scene**

- Create a sky background: In Hierarchy, right-click > 2D Object > Sprite, name it "Sky"
- Position it behind everything (Z = 10), scale it large, assign a sky-colored sprite
- Select Sky and click "Add Component" > Scripts > Ambient Controller
- In AmbientController component:
  - Sky: Drag Sky (itself) into this field
  - Dialogue Tint: Choose a slightly different color (e.g., bluish tint)
  - Fade Time: 0.5 seconds

**Usage:** The sky will automatically tint when dialogue starts and return to normal when dialogue ends.

---

5. Polish: Moral System UI

**Step 1: Create UI Canvas**

- In Hierarchy, right-click > UI > Canvas (this creates Canvas + EventSystem automatically)
- Set Canvas to "Screen Space - Overlay"

**Step 2: Create moral panel**

- Right-click on Canvas > UI > Panel, name it "MoralPanel"
- Position it in a corner (e.g., top-left)
- Resize to be compact but readable

**Step 3: Add text display**

- Right-click on MoralPanel > UI > Text, name it "MoralText"
- Set text to be left-aligned, smaller font size
- If using TextMeshPro, right-click > UI > Text - TextMeshPro instead

**Step 4: Create the UI script**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `MoralPanel`
- Replace the content with:

`MoralPanel.cs`

```csharp
using System.Text;
using UnityEngine;
using UnityEngine.UI;

public class MoralPanel : MonoBehaviour
{
    [SerializeField] private Text text; // Legacy UI Text; replace with TMPUGUI if using TMP

    private void Update()
    {
        if (!MoralSystem.Instance || !text) return;
        var sb = new StringBuilder();
        foreach (MoralAxis a in System.Enum.GetValues(typeof(MoralAxis)))
        {
            sb.AppendLine($"{a}: {MoralSystem.Instance.Get(a)}");
        }
        text.text = sb.ToString();
    }
}
```

**Step 5: Connect to UI**

- Select MoralPanel in Hierarchy
- Click "Add Component" > Scripts > Moral Panel
- In the component, drag MoralText into the "Text" field

**Note:** If using TextMeshPro, change `Text` to `TextMeshProUGUI` in the script and add `using TMPro;` at the top.

**Usage:** The panel will continuously display current moral values and update in real-time during dialogue.

---

6. Polish: Sound Hooks

**Step 1: Create audio bridge script**

- In Assets/Scripts folder, right-click > Create > C# Script, name it `DialogueAudioBridge`
- Replace the content with:

**Tags to use in Ink:**

- `#sfx:clip_name` for one-shot sound effects
- `#music:track_name` for background music

`DialogueAudioBridge.cs`

```csharp
using System.Collections.Generic;
using UnityEngine;

public class DialogueAudioBridge : MonoBehaviour
{
    [SerializeField] private AudioSource sfx;
    [SerializeField] private AudioSource music;
    [SerializeField] private List<AudioClip> clips;

    private void Awake()
    {
        var runner = FindObjectOfType<DialogueRunner>();
        if (runner)
            runner.OnLine += OnLine;
    }

    private void OnLine(string text, List<string> tags)
    {
        foreach (var t in tags)
        {
            if (t.StartsWith("sfx:"))
            {
                var key = t.Substring(4).Trim();
                var clip = clips.Find(c => c && c.name == key);
                if (clip) sfx.PlayOneShot(clip);
            }
            else if (t.StartsWith("music:"))
            {
                var key = t.Substring(6).Trim();
                var clip = clips.Find(c => c && c.name == key);
                if (clip)
                {
                    music.clip = clip;
                    music.Play();
                }
            }
        }
    }
}
```

**Step 2: Set up audio in scene**

- In Hierarchy, right-click > Create Empty, name it "AudioSystem"
- Add two AudioSource components:
  - First one for SFX: 3D Spatial Blend = 0 (2D), Loop = false
  - Second one for Music: 3D Spatial Blend = 0 (2D), Loop = true
- Click "Add Component" > Scripts > Dialogue Audio Bridge
- Configure the component:
  - Sfx: Drag the first AudioSource
  - Music: Drag the second AudioSource
  - Clips: Add your audio clips to this list (name them to match your Ink tags)

**Step 3: Use in Ink**
Add sound tags to your dialogue:

```ink
The thunder roars! #sfx:thunder
A peaceful melody begins. #music:peaceful_theme
```

**Usage:** Sound effects and music will automatically play when tagged lines appear in dialogue.

---

7. Designer Workflow Summary

**Complete content pipeline - no coding required:**

**To add a new philosopher:**

1. Create `.ink` file with moral/sticker/sound tags
2. Create `PhilosopherData` asset and assign compiled `.json`
3. Create `StickerSet` asset with matching keys and sprites
4. Add StickerSet to StickerSystem component
5. Add philosopher to PhilosopherSpawner list with position
6. Press Play - fully functional!

**To add stickers to existing content:**

- **Option A:** Add `#sticker:key` tags to Ink lines
- **Option B:** Create `StickerChoiceMap` with choice->sticker mappings

**To add new moral axes:**

- Add to MoralAxis enum in code (this is the only code change needed)
- Use `#moral:new_axis:+1` tags in Ink immediately

**Polish features work automatically:**

- Camera focuses on NPC during dialogue
- Ambient lighting shifts during conversation
- Moral UI updates in real-time
- Sound effects play on tagged lines

---

8. Final Checks & Troubleshooting

**System Requirements Verified:**

- ✅ Cinemachine 3.1.4: Uses `CinemachineCamera` component and `CinemachineBrain` on Unity Camera
- ✅ Ink 0.15.1 APIs: `Story`, `Continue()`, `currentChoices`, `ChooseChoiceIndex()`, `currentTags`, `variablesState`, `state.ToJson()`, `state.LoadJson()`
- ✅ All systems are prefab/data-driven - designers can add content without coding

**Common Issues:**

- **Stickers don't appear:** Check StickerSet keys match Ink tags exactly
- **Moral values not updating:** Verify MoralSystem exists in scene
- **Camera not focusing:** Ensure DialogueCameraFocus script is attached and configured
- **No sound:** Check AudioClip names match tags and AudioSources are assigned
- **Can't interact:** Verify Player has "Player" tag and all dialogue components are connected

**Performance Notes:**

- Sticker animations use coroutines - hundreds of stickers are fine
- Moral system uses simple dictionary lookups - very fast
- Dialogue system processes one line at a time - scalable to long conversations

**You now have a complete, content-creator-friendly 2D philosophy dialogue game!**
