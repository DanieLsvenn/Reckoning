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