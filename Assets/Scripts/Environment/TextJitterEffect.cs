using UnityEngine;
using TMPro;

[RequireComponent(typeof(TMP_Text))]
public class TextJitterEffect : MonoBehaviour
{
    [Header("Jitter Settings")]
    [SerializeField] private float jitterAmount = 2f;   // How far chars can move
    [SerializeField] private float jitterSpeed = 25f;   // How fast they move
    [SerializeField] private bool useGlitchColor = true;

    private TMP_Text tmpText;
    private Mesh mesh;
    private Vector3[] vertices;

    void Awake()
    {
        tmpText = GetComponent<TMP_Text>();
    }

    void Update()
    {
        tmpText.ForceMeshUpdate();
        mesh = tmpText.mesh;
        vertices = mesh.vertices;

        int charCount = tmpText.textInfo.characterCount;
        for (int i = 0; i < charCount; i++)
        {
            if (!tmpText.textInfo.characterInfo[i].isVisible) continue;

            int vertexIndex = tmpText.textInfo.characterInfo[i].vertexIndex;
            Vector3 offset = new Vector3(
                Mathf.Sin(Time.time * jitterSpeed + i) * jitterAmount,
                Mathf.Cos(Time.time * jitterSpeed * 1.2f + i) * jitterAmount,
                0);

            // Apply offset to each vertex of the character
            vertices[vertexIndex + 0] += offset;
            vertices[vertexIndex + 1] += offset;
            vertices[vertexIndex + 2] += offset;
            vertices[vertexIndex + 3] += offset;
        }

        mesh.vertices = vertices;
        tmpText.canvasRenderer.SetMesh(mesh);

        // Optional glitchy colors
        if (useGlitchColor)
        {
            var colors = mesh.colors32;
            for (int i = 0; i < colors.Length; i++)
            {
                if (Random.value < 0.05f) // small chance per frame
                {
                    colors[i] = new Color32(
                        (byte)Random.Range(100, 255),
                        (byte)Random.Range(0, 255),
                        (byte)Random.Range(100, 255),
                        255);
                }
            }
            mesh.colors32 = colors;
        }
    }
}