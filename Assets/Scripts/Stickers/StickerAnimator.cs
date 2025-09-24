using System.Collections;
using UnityEngine;

[RequireComponent(typeof(CanvasGroup))]
public class StickerAnimator : MonoBehaviour
{
    private CanvasGroup cg;
    private Transform tr;
    // NEW: end scale for this play cycle
    private float _targetScale = 1f;

    private void Awake()
    {
        cg = GetComponent<CanvasGroup>();
        tr = transform;
        if (!cg) cg = gameObject.AddComponent<CanvasGroup>();
        cg.alpha = 0f;
    }

    // ...existing code...

    public void PlayIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        // NEW: default to 1 if not specified
        PlayIn(fadeIn, scaleIn, startScale, bounce, 1f);
    }

    // NEW: overload that accepts targetScale (final size)
    public void PlayIn(float fadeIn, float scaleIn, float startScale, bool bounce, float targetScale)
    {
        _targetScale = Mathf.Max(0.01f, targetScale);
        StopAllCoroutines();
        StartCoroutine(CoIn(fadeIn, scaleIn, startScale, bounce));
    }

    private IEnumerator CoIn(float fadeIn, float scaleIn, float startScale, bool bounce)
    {
        float t = 0f;
        // NEW: compute start/end using targetScale
        var endScale = Vector3.one * _targetScale;
        tr.localScale = Vector3.one * Mathf.Max(0.001f, startScale) * _targetScale;
        cg.alpha = 0f;

        // scale and fade concurrently
        while (t < Mathf.Max(fadeIn, scaleIn))
        {
            t += Time.deltaTime;
            float a = Mathf.Clamp01(fadeIn <= 0f ? 1f : t / fadeIn);
            float s = Mathf.Clamp01(scaleIn <= 0f ? 1f : t / scaleIn);
            cg.alpha = a;
            tr.localScale = Vector3.Lerp(
                Vector3.one * Mathf.Max(0.001f, startScale) * _targetScale,
                endScale,
                EaseOutBack(s, bounce ? 1.5f : 0f)
            );
            yield return null;
        }
        cg.alpha = 1f;
        tr.localScale = endScale;
    }

    private static float EaseOutBack(float x, float overshoot)
    {
        if (overshoot <= 0f) return 1f - Mathf.Pow(1f - x, 2f);
        float c1 = overshoot;
        float c3 = c1 + 1f;
        return 1f + c3 * Mathf.Pow(x - 1f, 3) + c1 * Mathf.Pow(x - 1f, 2);
    }
}