# PHASE 1: Movement, Interaction, and Camera Setup (Unity 6000.0.50f1)

Scope

- Side-scrolling movement (A/D)
- Infinite ground illusion (repeating tiles or moving backdrop)
- Philosopher spawning (prefab-based, gravityScale = 0)
- Interaction zones (E to talk) with an "!" indicator
- Cinemachine 3.1.x follow camera (2D)
- Designer-friendly prefab workflow, snap-to-grid option

Requirements

- Unity 6000.0.50f1
- Packages: Cinemachine 3.1.4, Input System 1.8+ (recommended), URP (optional)

Assumptions

- Using Unity Physics 2D for collisions/triggers.
- Input handled via the new Input System (binding A/D/E); we include a minimal fallback for the old Input Manager.

---

1. Project Setup

1.1 Install packages

- Open Window > Package Manager.
- Install "Cinemachine" (version 3.1.4).
- Install "Input System" if you are not already using it; enable it when prompted (Project Settings > Player > Active Input Handling: Input System Package).

  1.2 Scene setup (Base)

- Create a new scene: File > New Scene > Basic (Built-in) or Basic (URP). Save it as `Assets/Scenes/Main.unity`.
- In the Hierarchy window, right-click in empty space > Create Empty. Rename it to `LevelRoot`.
- (Optional) Add a Grid for snapping: In Hierarchy, right-click > 2D Object > Grid. This helps with precise object placement.
- Create Sorting Layers:
  - Go to Edit > Project Settings
  - In the left panel, click "Tags and Layers"
  - Expand "Sorting Layers"
  - Click the "+" button twice to add two new layers
  - Name them: `Characters` and `Indicators`
  - Close Project Settings

---

2. Player Character & Movement

2.1 Player Prefab

- In the Hierarchy window, right-click > Create Empty. Name it `Player`.
- With Player selected, in the Inspector click "Add Component":
  - Add `Sprite Renderer`:
    - Click "Add Component" > Rendering > Sprite Renderer
    - In the Sprite field, click the circle icon and choose any sprite (like the default Unity knob)
  - Add `Rigidbody2D`:
    - Click "Add Component" > Physics 2D > Rigidbody 2D
    - Set Body Type: Dynamic
    - Set Gravity Scale: 0
  - Add `Capsule Collider 2D`:
    - Click "Add Component" > Physics 2D > Capsule Collider 2D
    - Leave "Is Trigger" unchecked
  - Add the PlayerController2D script (we'll create this next)
- Set the Sprite Renderer's Sorting Layer:
  - In the Sprite Renderer component, change "Sorting Layer" dropdown from "Default" to "Characters"
- Create the prefab:

  - First create the folder: In Project window, right-click Assets > Create > Folder, name it "Prefabs"
  - Drag the `Player` from Hierarchy into the `Assets/Prefabs/` folder

    2.2 Movement Script: `PlayerController2D.cs`

- Create the script folder: In Project window, right-click Assets > Create > Folder, name it "Scripts"
- Inside Scripts folder, right-click > Create > Folder, name it "Player"
- In the Player folder, right-click > Create > C# Script, name it `PlayerController2D`
- Double-click the script to open it in your code editor
- Delete all the default content and paste this code:

```csharp
using UnityEngine;
#if ENABLE_INPUT_SYSTEM
using UnityEngine.InputSystem; // New Input System
#endif

[RequireComponent(typeof(Rigidbody2D))]
public class PlayerController2D : MonoBehaviour
{
    [Header("Movement")]
    [SerializeField] private float moveSpeed = 5f;
    [SerializeField] private float acceleration = 12f;
    [SerializeField] private float deceleration = 16f;

    [Header("Input")]
    [SerializeField] private string leftKey = "a";  // fallback for old Input Manager
    [SerializeField] private string rightKey = "d";
    [SerializeField] private KeyCode interactKey = KeyCode.E;

    private Rigidbody2D rb;
    private float targetX;
    private float currentX;

#if ENABLE_INPUT_SYSTEM
    private Keyboard keyboard;
#endif

    public System.Action OnInteract;

    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
#if ENABLE_INPUT_SYSTEM
        keyboard = Keyboard.current;
#endif
    }

    private void Update()
    {
        // Read input (A/D)
        float inputX = 0f;
#if ENABLE_INPUT_SYSTEM
        if (keyboard != null)
        {
            if (keyboard.aKey.isPressed) inputX -= 1f;
            if (keyboard.dKey.isPressed) inputX += 1f;
        }
        else
#endif
        {
            if (Input.GetKey(leftKey)) inputX -= 1f;
            if (Input.GetKey(rightKey)) inputX += 1f;
        }

        targetX = inputX * moveSpeed;
        // Smooth accelerate/decelerate
        currentX = Mathf.MoveTowards(currentX, targetX, (Mathf.Abs(targetX) > Mathf.Abs(currentX) ? acceleration : deceleration) * Time.deltaTime);

        // Interact (E)
#if ENABLE_INPUT_SYSTEM
        if (keyboard != null && keyboard.eKey.wasPressedThisFrame)
            OnInteract?.Invoke();
        else
#endif
        if (Input.GetKeyDown(interactKey))
            OnInteract?.Invoke();
    }

    private void FixedUpdate()
    {
        rb.velocity = new Vector2(currentX, 0f);
    }
}
```

Notes

- Gravity Scale 0 on the Rigidbody2D ensures no vertical motion.
- In Phase 2, `OnInteract` will trigger dialogue.
- After saving the script, go back to Unity and add it to your Player:
  - Select the Player in Hierarchy
  - Click "Add Component" > Scripts > Player Controller 2D

---

3. Infinite Ground Illusion (no gaps, no disappearing)

Goal: The player moves endlessly while a ground band “slides” under them. IMPORTANT: You need a band made of three tiles side‑by‑side (left, center, right). The script moves the whole band, not a single sprite.

Option A — Repeating Tilemap (simple)

- Create a Tilemap with a repeating ground tile and paint a very wide strip (e.g., 200–500 units). This is the easiest way for Phase 1.

Option B — 3‑tile band that follows the player (recommended)

1. Create a parent container

- Hierarchy: right‑click > Create Empty. Name it `GroundBand`.
- Set its position to Y ≈ −2 so it’s below the player.

2. Create the center tile

- Right‑click `GroundBand` > 2D Object > Sprites > Square (or your ground sprite). Name it `Tile_Center`.
- In the Inspector, adjust its scale/size so one tile is as wide as you want (e.g., 10 units wide). Keep Z = 0.
- Optional: Set the Sprite Renderer Sorting Layer to `Default` (below Characters) so it draws behind the player.

3. Duplicate left and right tiles

- Duplicate `Tile_Center` twice (Ctrl+D): rename to `Tile_Left` and `Tile_Right`.
- Place them exactly one tile width apart from center:
  - If your center tile is 10 units wide, set local Position X of `Tile_Left` to −10 and `Tile_Right` to +10 (leave `Tile_Center` at 0).
  - If you aren’t sure of the width, eyeball it now; the script will auto‑measure width at runtime, but the children still must be spaced edge‑to‑edge (no gaps/overlaps).

4. Add the follow script to the parent

- Select `GroundBand` (the parent). Click Add Component > Scripts > Repeat Band.
- In the component:
  - Assign `Player` to the Player field.
  - Tiles = 3.
  - Leave Width = 0 (the script will auto‑measure from the first SpriteRenderer child).

5. Test

- Enter Play and move A/D. The band should never leave the camera and will “step” as you move, without gaps.

Updated `RepeatBand.cs` (auto‑measures width, expects 3 child tiles)

```csharp
using UnityEngine;

public class RepeatBand : MonoBehaviour
{
  [SerializeField] private Transform player;
  [SerializeField, Min(1)] private int tiles = 3; // use odd numbers: 3, 5, ...
  [SerializeField] private float width = 0f;      // width of ONE tile in world units; 0 = auto from first child SpriteRenderer

  private void Awake()
  {
    // Auto-detect width from the first SpriteRenderer we find (self or children)
    if (width <= 0f)
    {
      var sr = GetComponentInChildren<SpriteRenderer>();
      if (sr != null)
        width = sr.bounds.size.x; // world-space width
    }
  }

  private void LateUpdate()
  {
    if (!player || width <= 0f || tiles <= 0)
      return;

    // Move the whole band so the center tile stays near the player.
    float px = player.position.x;
    float span = tiles * width;        // total width covered by all child tiles
    float halfSpan = span * 0.5f;

    // Snap band origin to tile-width increments so children recycle seamlessly
    float baseX = Mathf.Floor((px + halfSpan) / width) * width - halfSpan;
    var p = transform.position;
    p.x = baseX;
    transform.position = p;
  }
}
```

Troubleshooting (ground disappears or gaps appear)

- Only one sprite? You must have three child tiles (Left, Center, Right) under `GroundBand`. The script moves the parent; it doesn’t stretch one sprite.
- Wrong spacing? Child tiles must be placed edge‑to‑edge: Left at −width, Center at 0, Right at +width (where width is the world width of one tile).
- Width not detected? Ensure at least one child has a `SpriteRenderer`. If your tile’s width is very small/large, you can type a value into `Width` to override auto‑measure.
- Sorting order? If the ground seems gone, it might be behind the camera or in front of it. Keep ground on Sorting Layer `Default`, player on `Characters`.
- Camera z / object z? In 2D, set Z = 0 for sprites, and the Camera at Z = −10.

Optional fallback — One long tiled sprite (no script)

- Select a `Sprite Renderer` and set Draw Mode = Tiled, then increase Size X to something large (e.g., 200). This gives a long strip without scripting. It won’t recycle infinitely but is fine for early testing.

---

4. Philosopher Spawning (gravityScale = 0)

4.1 Philosopher Prefab

- In Hierarchy, right-click > Create Empty, name it `Philosopher`
- Add Sprite Renderer:
  - Click "Add Component" > Rendering > Sprite Renderer
  - Assign any portrait sprite (or use Unity's default circle sprite temporarily)
- Add Rigidbody2D:
  - Click "Add Component" > Physics 2D > Rigidbody 2D
  - Set Body Type: Dynamic (or Kinematic if you prefer)
  - Set Gravity Scale: 0
- Add CircleCollider2D:
  - Click "Add Component" > Physics 2D > Circle Collider 2D
  - Check "Is Trigger": true
- Add the PhilosopherNPC script (we'll create this after the data script)
- Create the "!" indicator:
  - Right-click on Philosopher in Hierarchy > Create Empty Child, name it `Indicator`
  - Add Sprite Renderer to Indicator
  - Assign an exclamation mark sprite (or use text "!" with TextMeshPro)
  - Set Sorting Layer to "Indicators"
  - Position it above the philosopher (e.g., Y = +1)
  - In Inspector, uncheck the checkbox next to "Indicator" to disable it initially
- Create prefab: Drag Philosopher into `Assets/Prefabs/` folder

  4.2 Data (ScriptableObject)

Create the PhilosopherData script:

- In Project, right-click Assets/Scripts > Create > Folder, name it "Data"
- In Data folder, right-click > Create > C# Script, name it `PhilosopherData`
- Replace the content with:

`PhilosopherData.cs````csharp
using UnityEngine;

[CreateAssetMenu(menuName = "Game/NPC/Philosopher Data")]
public class PhilosopherData : ScriptableObject
{
public string philosopherId; // e.g., "plato"
public string displayName; // e.g., "Plato"
public Sprite portrait; // default sprite
public TextAsset inkJson; // set in Phase 2
}

````

4.3 NPC Component

Create the PhilosopherNPC script:
- In Assets/Scripts folder, right-click > Create > C# Script, name it `PhilosopherNPC`
- Replace the content with:

`PhilosopherNPC.cs`

```csharp
using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class PhilosopherNPC : MonoBehaviour
{
    [SerializeField] private PhilosopherData data;
    [SerializeField] private Transform indicator;
    [SerializeField] private float interactRadius = 2.5f;

    private Transform player;
    private bool playerInRange;

    public System.Action<PhilosopherNPC> OnRequestInteract;

    private void Reset()
    {
        var col = GetComponent<Collider2D>();
        col.isTrigger = true;
    }

    public void Initialize(PhilosopherData d)
    {
        data = d;
        var sr = GetComponent<SpriteRenderer>();
        if (sr && d && d.portrait) sr.sprite = d.portrait;
        name = d ? $"Philosopher_{d.displayName}" : name;
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            player = other.transform;
            playerInRange = true;
            if (indicator) indicator.gameObject.SetActive(true);
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = false;
            if (indicator) indicator.gameObject.SetActive(false);
            player = null;
        }
    }

    public void TryInteract()
    {
        if (playerInRange)
            OnRequestInteract?.Invoke(this);
    }

    public PhilosopherData Data => data;
}
```

4.4 Spawner

Create the PhilosopherSpawner script:

- In Assets/Scripts folder, right-click > Create > C# Script, name it `PhilosopherSpawner`
- Replace the content with:

`PhilosopherSpawner.cs`

```csharp
using System.Collections.Generic;
using UnityEngine;

public class PhilosopherSpawner : MonoBehaviour
{
    [System.Serializable]
    public class SpawnDef
    {
        public PhilosopherData data;
        public Vector2 position;
    }

    [SerializeField] private PhilosopherNPC philosopherPrefab;
    [SerializeField] private List<SpawnDef> spawns = new();

    private readonly List<PhilosopherNPC> _spawned = new();

    public IReadOnlyList<PhilosopherNPC> Spawned => _spawned;

    public void Clear()
    {
        foreach (var npc in _spawned)
            if (npc) Destroy(npc.gameObject);
        _spawned.Clear();
    }

    public void SpawnAll()
    {
        Clear();
        foreach (var s in spawns)
        {
            if (!s.data || !philosopherPrefab) continue;
            var npc = Instantiate(philosopherPrefab, s.position, Quaternion.identity, transform);
            npc.Initialize(s.data);
            _spawned.Add(npc);
        }
    }
}
```

Editor Workflow

Now let's wire everything together:

1. **Add scripts to Philosopher prefab:**

   - Select Philosopher prefab in Project window and click "Open Prefab"
   - Click "Add Component" > Scripts > Philosopher NPC
   - In the PhilosopherNPC component, drag the "Indicator" child object into the "Indicator" field
   - Click the back arrow to exit prefab mode

2. **Set up the spawner:**

   - Select LevelRoot in Hierarchy
   - Click "Add Component" > Scripts > Philosopher Spawner
   - Drag the Philosopher prefab from Project into the "Philosopher Prefab" field

3. **Create some philosopher data:**

   - In Project, right-click Assets > Create > Folder, name it "Data"
   - In Data folder, right-click > Create > Folder, name it "Philosophers"
   - In Philosophers folder, right-click > Create > Game/NPC/Philosopher Data, name it "Plato"
   - Select the Plato asset and fill in the Inspector:
     - Philosopher Id: "plato"
     - Display Name: "Plato"
     - Portrait: (assign any sprite)
     - Ink Json: (leave empty for now - Phase 2)
   - Create 1-2 more philosopher data assets (e.g., Aristotle, Socrates)

4. **Configure spawn positions:**
   - Select LevelRoot, look at the Philosopher Spawner component
   - Set the "Spawns" list size to match your number of philosophers (e.g., 3)
   - For each spawn entry:
     - Drag a philosopher data asset into the "Data" field
     - Set Position (e.g., first at x=5, second at x=10, third at x=15, all with y=0)

Bootstrap (Auto-spawn philosophers)

Create a simple script to automatically spawn philosophers when the game starts:

- In Assets/Scripts folder, right-click > Create > C# Script, name it `LevelBootstrap`
- Replace the content with:

`LevelBootstrap.cs`

```csharp
using UnityEngine;

public class LevelBootstrap : MonoBehaviour
{
    [SerializeField] private PhilosopherSpawner spawner;

    private void Awake()
    {
        if (spawner) spawner.SpawnAll();
    }
}
```

**Add to scene:**

- Select LevelRoot in Hierarchy
- Click "Add Component" > Scripts > Level Bootstrap
- In the component, drag LevelRoot (itself) into the "Spawner" field

---

5. Interaction Zones + "!" Indicator

5.1 Wiring Player to NPCs

Create a script to connect player interaction to nearby philosophers:

- In Assets/Scripts folder, right-click > Create > C# Script, name it `InteractRouter`
- Replace the content with:

`InteractRouter.cs`

```csharp
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
```

**Add to scene:**

- Select LevelRoot in Hierarchy
- Click "Add Component" > Scripts > Interact Router
- Drag Player from Hierarchy into the "Player" field
- Drag LevelRoot (itself) into the "Spawner" field

**Set Player tag:**

- Select Player in Hierarchy
- In Inspector, click the "Tag" dropdown (below the name field)
- Select "Player" (or create it if it doesn't exist: click "Add Tag", add "Player" to the list)

  5.2 Indicator Setup

- In `Philosopher` prefab, add a child `Indicator` with a small "!" sprite.
- Position near the head, set Sorting Layer: `Indicators`, and uncheck active by default.
- `PhilosopherNPC` toggles it when player enters/exits trigger.

---

6. Cinemachine 3.1.4 Follow Camera (2D)

Important: In Cinemachine v3, the core virtual camera component is `CinemachineCamera` (replacing the legacy `CinemachineVirtualCamera`). The workflow is similar: you add a Cinemachine Brain to your Unity Camera, then add one or more Cinemachine cameras to the scene that follow your target.

Steps

- **Add CinemachineBrain to main camera:**

  - Select "Main Camera" in Hierarchy
  - Click "Add Component" > Cinemachine > Cinemachine Brain

- **Create a follow camera:**

  - In Hierarchy, right-click > Cinemachine > Create Camera
  - This creates a GameObject with a CinemachineCamera component
  - Rename it to "PlayerFollowCam"

- **Configure the camera:**
  - Select PlayerFollowCam in Hierarchy
  - In the CinemachineCamera component:
    - Drag Player from Hierarchy into the "Follow" field
    - Set Priority to 10 (higher than default cameras)
    - In the "Aim" section, change from "Composer" to "FramingTransposer"
    - In the "Body" section, you can use "FramingTransposer" for strict 2D following
  - Adjust the camera position and settings as needed

References

- Docs: Cinemachine 3.1, 2D and top-down guidance.

---

7. Designer-Friendly Workflow & Snap-to-Grid

Prefabs

- `Assets/Prefabs/Player.prefab`
- `Assets/Prefabs/Philosopher.prefab`
- `Assets/Prefabs/Bands/GroundBand.prefab`

Data

- `Assets/Data/Philosophers/*.asset` (ScriptableObjects)

Hierarchy Template

- `LevelRoot`
  - `Player`
  - `PhilosopherSpawner`
  - `Bands`
  - `Cameras`

Snap-to-Grid (optional)

- Enable Grid snapping: In the Scene View, set Snap to 1 unit.
- You can also add this helper:

`SnapToGrid.cs`

```csharp
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

[ExecuteAlways]
public class SnapToGrid : MonoBehaviour
{
    public float cellSize = 1f;

    private void OnValidate() => Snap();
    private void OnDrawGizmosSelected() => Snap();

    private void Snap()
    {
#if UNITY_EDITOR
        if (!EditorApplication.isPlaying)
        {
            var p = transform.position;
            p.x = Mathf.Round(p.x / cellSize) * cellSize;
            p.y = Mathf.Round(p.y / cellSize) * cellSize;
            transform.position = p;
        }
#endif
    }
}
```

---

8. Quick Test Checklist

- Enter Play Mode:
  - Player moves left/right with A/D.
  - Infinite ground illusion holds; background doesn’t run out.
  - Cinemachine follows smoothly.
  - Approaching a philosopher shows the "!" indicator.
  - Pressing E triggers NPC `TryInteract()` (Phase 2 will open Ink dialogue).

---

10. Player Idle/Run Animation (using ErisEsra templates)

Goal: When standing still, play Idle; when pressing A/D, play Run Side, with flip on left.

1. Prepare sprites

- In Project window, locate `Assets/Sprites/Player/ErisEsra's Character Templates`.
- Identify the Idle side frames and Run side frames (usually named accordingly in the sprite sheet). If Sprite Mode is Multiple, open Sprite Editor and slice if needed.

2. Create animation clips

- Create folder `Assets/Animations/Player`.
- In that folder: Right-click > Create > Animation > name `Idle.anim`.
- Repeat: create `Run.anim`.
- Select `Idle.anim` → drag the Idle frames from the Project window into the Animation window timeline (Window > Animation > Animation). Set Samples (e.g., 6–12) to taste.
- Select `Run.anim` → drag the Run side frames. Set Samples higher (e.g., 10–14) for snappier run.

3. Create an Animator Controller

- Right-click `Assets/Animations/Player` > Create > Animator Controller → name `Player.controller`.
- Double-click to open Animator window. Drag `Idle.anim` and `Run.anim` in.
- Set `Idle` as the default state (right-click Idle > Set as Layer Default State).

4. Add parameters and transitions

- In Animator window Parameters tab: Add Float `Speed` and Float `MoveX`.
- Transitions:
  - Idle → Run: condition `Speed` Greater Than 0.05.
  - Run → Idle: condition `Speed` Less Than 0.05.
- Optional: Uncheck “Has Exit Time” on these transitions for immediate responsiveness.
- Set Transition Duration small (e.g., 0.05–0.1) if needed.

5. Assign to Player

- Select `Player` in Hierarchy.
- Add/ensure an `Animator` component.
- Set Controller to `Assets/Animations/Player/Player.controller`.
- Ensure `Sprite Renderer` exists on the same GameObject.

6. Script wiring (already done)

- `PlayerController2D` now sets:
  - `Speed` = `Mathf.Abs(currentX)`
  - `MoveX` = sign of movement (−1, 0, +1)
- It also flips the sprite left/right by `SpriteRenderer.flipX`.

7. Test

- Press Play. Standing still: Idle plays. Hold `A` or `D`: Run plays; facing flips when moving left.

Troubleshooting

- No animation? Confirm `Animator` has the controller assigned and states wired.
- Wrong frames? Re-open Sprite Editor and ensure the correct sub-sprites are referenced in clips.
- Not flipping? Check Player’s `Sprite Renderer` and make sure no parent object is also mirroring scale.

---

9. Next (Phase 2 Preview)

- Integrate Ink 0.15.1.
- Central Moral System manager.
- Dialogue choices modify moral stats via tags or external functions.
- Persist state as JSON.

---

# PHASE 2: Runtime Sprite Swapping for Philosophers

Goal: Allow each Philosopher prefab to change its portrait at runtime (e.g., highlight on proximity, flash a “talking” pose on interact). This works with existing prefabs and data; alternate sprites are optional.

Requirements

- No new packages.
- Reuse current PhilosopherData, PhilosopherNPC, InteractRouter.

Overview

- Add optional sprites to PhilosopherData.
- Add a tiny state machine to PhilosopherNPC (Default, Highlight, Talking) and public APIs:
  - SetPortrait(Sprite)
  - SetVisualState(VisualState)
- Make NPC auto-switch to Highlight when the player enters the trigger, Default when leaving.
- Make InteractRouter briefly set Talking state on E, then restore.

1) Update PhilosopherData (add optional portraits)

- Open Assets/Scripts/Data/PhilosopherData.cs and add two optional sprite fields.

```csharp
// filepath: Assets/Scripts/Data/PhilosopherData.cs
using UnityEngine;

[CreateAssetMenu(menuName = "Game/NPC/Philosopher Data")]
public class PhilosopherData : ScriptableObject
{
    public string philosopherId; // e.g., "plato"
    public string displayName;   // e.g., "Plato"
    public Sprite portrait;      // default sprite

    // ...existing code...
    public TextAsset inkJson;    // set in Phase 2

    // NEW (optional) portraits — assign if you want different visuals for states
    public Sprite highlightPortrait; // shown when player is in range
    public Sprite talkingPortrait;   // flashed when interacting
}
```

2) Update PhilosopherNPC (runtime swap + simple state)

- Open Assets/Scripts/PhilosopherNPC.cs and add:
  - Cached SpriteRenderer
  - VisualState enum + ApplyVisualState()
  - Public SetPortrait(Sprite) and SetVisualState(VisualState)
  - Auto Highlight on trigger enter, Default on trigger exit
  - Public IsPlayerInRange getter

```csharp
// filepath: Assets/Scripts/PhilosopherNPC.cs
using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class PhilosopherNPC : MonoBehaviour
{
    [SerializeField] private PhilosopherData data;
    [SerializeField] private Transform indicator;
    [SerializeField] private float interactRadius = 2.5f;

    // NEW: cache renderer
    private SpriteRenderer sr;

    // ...existing code...
    private Transform player;
    private bool playerInRange;

    // Expose range state
    public bool IsPlayerInRange => playerInRange;

    public System.Action<PhilosopherNPC> OnRequestInteract;

    // NEW: visual states
    public enum VisualState { Default, Highlight, Talking }
    [SerializeField] private VisualState visualState = VisualState.Default;

    private void Awake()
    {
        // NEW: cache SR
        sr = GetComponent<SpriteRenderer>();
    }

    private void Reset()
    {
        var col = GetComponent<Collider2D>();
        col.isTrigger = true;
    }

    public void Initialize(PhilosopherData d)
    {
        data = d;
        // ...existing code...
        if (sr == null) sr = GetComponent<SpriteRenderer>();
        if (sr && d && d.portrait) sr.sprite = d.portrait;
        name = d ? $"Philosopher_{d.displayName}" : name;

        // NEW: ensure visual state is applied from data
        ApplyVisualState();
    }

    // NEW: public API to set any sprite directly
    public void SetPortrait(Sprite sprite)
    {
        if (sr && sprite) sr.sprite = sprite;
    }

    // NEW: set state and apply
    public void SetVisualState(VisualState state)
    {
        visualState = state;
        ApplyVisualState();
    }

    // NEW: resolve which sprite to use for current state
    private void ApplyVisualState()
    {
        if (sr == null) sr = GetComponent<SpriteRenderer>();
        if (sr == null) return;

        Sprite next = null;
        if (data != null)
        {
            switch (visualState)
            {
                case VisualState.Highlight:
                    next = data.highlightPortrait ? data.highlightPortrait : data.portrait;
                    break;
                case VisualState.Talking:
                    next = data.talkingPortrait ? data.talkingPortrait : data.portrait;
                    break;
                default:
                    next = data.portrait;
                    break;
            }
        }
        if (next != null) sr.sprite = next;
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            player = other.transform;
            playerInRange = true;
            if (indicator) indicator.gameObject.SetActive(true);

            // NEW: auto-highlight when in range
            SetVisualState(VisualState.Highlight);
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = false;
            if (indicator) indicator.gameObject.SetActive(false);
            player = null;

            // NEW: back to default when out of range
            SetVisualState(VisualState.Default);
        }
    }

    public void TryInteract()
    {
        if (playerInRange)
            OnRequestInteract?.Invoke(this);
    }

    public PhilosopherData Data => data;
}
```

3) Update InteractRouter (flash “Talking” on E)

- Open Assets/Scripts/InteractRouter.cs and add a brief “talking” flash, then restore based on range.
- If you skip assigning talking/highlight portraits, it gracefully falls back to default.

```csharp
// filepath: Assets/Scripts/InteractRouter.cs
using System.Linq;
using UnityEngine;
// NEW
using System.Collections;

public class InteractRouter : MonoBehaviour
{
    [SerializeField] private PlayerController2D player;
    [SerializeField] private PhilosopherSpawner spawner;

    // NEW: how long to show the "talking" portrait
    [SerializeField] private float talkFlashSeconds = 0.35f;

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
        {
            target.TryInteract(); // Phase 2/3 will open dialogue

            // NEW: briefly show "talking" sprite
            StopAllCoroutines();
            StartCoroutine(FlashTalking(target));
        }
    }

    // NEW: coroutine to flash talking then restore
    private IEnumerator FlashTalking(PhilosopherNPC npc)
    {
        npc.SetVisualState(PhilosopherNPC.VisualState.Talking);
        yield return new WaitForSeconds(talkFlashSeconds);
        npc.SetVisualState(npc.IsPlayerInRange
            ? PhilosopherNPC.VisualState.Highlight
            : PhilosopherNPC.VisualState.Default);
    }
}
```

4) Editor steps

- Open each PhilosopherData asset (Assets/Data/Philosophers/*.asset):
  - Set Portrait (default) as before.
  - Optionally set Highlight Portrait and Talking Portrait.
- Press Play:
  - Approach an NPC → indicator shows and portrait switches to Highlight.
  - Press E → portrait flashes to Talking for talkFlashSeconds, then returns to Highlight/Default.

Troubleshooting

- No change on proximity?
  - Ensure your Player has Tag “Player”.
  - Confirm the Philosopher has a trigger Collider2D and the NPC script on the same GameObject as the SpriteRenderer.
- Not seeing alternate sprites?
  - Leave Highlight/Talking empty to fall back to Portrait.
  - Verify the SpriteRenderer is on the same object with PhilosopherNPC (not only on a child).
````
