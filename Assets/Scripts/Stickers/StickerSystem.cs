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

        // If no animator, at least apply final scale immediately
        var anim = go.GetComponent<StickerAnimator>();
        if (!anim)
            go.transform.localScale = Vector3.one * Mathf.Max(0.01f, item.scale);

        var sr = go.GetComponentInChildren<SpriteRenderer>();
        if (sr) sr.sprite = item.sprite;

        if (anim)
        {
            // pass target scale so final size matches data
            anim.PlayIn(item.fadeInTime, item.scaleInTime, item.startScale, item.bounce, Mathf.Max(0.01f, item.scale));
        }
    }
}