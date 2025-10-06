# Ending Fade-Out System

This system provides a smooth 4-second white fade-out effect when the player enters the ending trigger, before transitioning to the ending scene.

## Features

- **Smooth Fade**: 4-second white fade-out effect (customizable duration)
- **Movement Lock**: Player movement is disabled during fade
- **Auto-Setup**: Automatically creates the white overlay UI if none is assigned
- **Debug Tools**: Test fade effect without triggering ending
- **Prevents Multiple Triggers**: Safe from multiple activations

## Setup Instructions

### Option 1: Automatic Setup (Recommended)

1. The system will automatically create a white fade overlay when the scene starts
2. No additional setup required - just ensure `createFadeOverlayAutomatically` is checked in the inspector

### Option 2: Manual Setup

1. Create a Canvas in your scene (or use existing one)
2. Create an Image child object named "WhiteFadeOverlay"
3. Set the Image to:
   - Color: White (1, 1, 1, 0) - fully transparent alpha
   - Anchor: Stretch to fill entire screen
   - Raycast Target: Unchecked (optional)
4. Assign this Image to the `Fade Overlay` field in EndingTrigger

## Configuration

In the `EndingTrigger` component inspector:

- **Fade Out Duration**: How long the fade takes (default: 4 seconds)
- **Fade Overlay**: Manually assign white overlay Image (optional if auto-creating)
- **Create Fade Overlay Automatically**: Enable auto-setup (recommended: checked)

## Testing

Use the context menu options on the EndingTrigger component:

- **Test Fade Effect**: Fade to white and back without loading ending scene
- **Test Trigger Ending**: Full ending sequence with fade (loads ending scene)
- **Preview Ending**: Shows which ending would be triggered

## Technical Details

### How It Works

1. Player enters trigger → `TriggerEnding()` called
2. Movement is disabled via `EndingTrigger.IsFadingOut = true`
3. White overlay fades from transparent to opaque over specified duration
4. Ending scene is loaded after fade completes

### Player Movement Integration

The PlayerController2D now checks both:

- `DialogueRunner.IsDialogueActive` (for dialogue state)
- `EndingTrigger.IsFadingOut` (for ending fade state)

When either is true, player movement, animations, and walking sounds are disabled.

## Troubleshooting

**Fade overlay not visible:**

- Check Canvas sorting order (should be high, like 9999)
- Ensure Image component is set to white color
- Verify RectTransform covers full screen

**Movement not disabled during fade:**

- Ensure PlayerController2D has been updated with fade state checks
- Check debug output shows "Ending=Fading" when fade is active

**Multiple fade triggers:**

- System prevents multiple triggers automatically
- If issues persist, check `isTriggered` flag in EndingTrigger
