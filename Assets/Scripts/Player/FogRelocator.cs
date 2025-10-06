using UnityEngine;

[RequireComponent(typeof(Collider2D))]
public class FogRelocator : MonoBehaviour
{
    public static FogRelocator Instance;

    [SerializeField] private Transform player;
    [SerializeField] private Transform FogWall;

    private Collider2D frTrigger;

    public static bool IsInitialized => Instance != null;

    private void Awake()
    {
        frTrigger = GetComponent<Collider2D>();

        frTrigger.isTrigger = true;
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        RelocateFog();
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
