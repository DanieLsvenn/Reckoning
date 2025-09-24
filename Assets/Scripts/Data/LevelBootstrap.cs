using UnityEngine;

public class LevelBootstrap : MonoBehaviour
{
    [SerializeField] private PhilosopherSpawner spawner;

    private void Awake()
    {
        if (spawner) spawner.SpawnAll();
    }
}