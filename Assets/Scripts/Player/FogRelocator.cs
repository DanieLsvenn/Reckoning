using UnityEngine;

public class FogRelocator : MonoBehaviour
{
    public static FogRelocator Instance;

    [SerializeField] private Transform player;
    [SerializeField] private Transform FogWall;

    public static bool IsInitialized => Instance != null;

    private void Awake()
    {
        // Singleton
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);  // Keep the SoundManager across scenes
        }
        else
        {
            Destroy(gameObject);
        }
    }

    public void RelocateFog()
    {
        if (FogWall == null || player == null) return;

        float playerX = player.position.x;
        float desiredX = playerX - 15;
        Vector3 fogPos = FogWall.transform.position;
        fogPos.x = desiredX;
        FogWall.transform.position = fogPos;
    }
}
