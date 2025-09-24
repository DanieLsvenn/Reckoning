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