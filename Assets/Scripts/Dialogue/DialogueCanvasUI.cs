using System.Collections; // + for coroutines
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class DialogueCanvasUI : MonoBehaviour
{
	[SerializeField] private DialogueRunner runner;

	[Header("UI")]
	[SerializeField] private CanvasGroup canvasGroup;
	[SerializeField] private GameObject root;

	// Removed legacy uGUI Text support to avoid confusion
	// [SerializeField] private Text bodyText;
	[SerializeField] private TMP_Text bodyTMP;

	[SerializeField] private Transform choicesParent;
	[SerializeField] private Button choiceButtonPrefab;

	[Header("Behaviour")]
	[SerializeField] private bool appendLines = false;
	[SerializeField] private bool showOnStart = true;
	[SerializeField] private bool hideOnEnd = true;
	[SerializeField] private KeyCode[] choiceHotkeys = { KeyCode.Alpha1, KeyCode.Alpha2, KeyCode.Alpha3, KeyCode.Alpha4 };

	// + New: advance and typewriter controls
	[Header("Advance")]
	[SerializeField] private KeyCode advanceKey = KeyCode.Space;
	[SerializeField] private bool autoAdvance = true;
	[SerializeField, Min(0f)] private float autoAdvanceDelay = 3f;

	[Header("Typewriter")]
	[SerializeField, Min(1f)] private float charsPerSecond = 40f;

	// + Runtime state
	private readonly List<Button> _spawned = new();
	private Coroutine _typingCo;
	private Coroutine _autoAdvanceCo;
	private bool _isTyping;
	private bool _hasChoices;

	private void Awake()
	{
		if (!runner) runner = Object.FindFirstObjectByType<DialogueRunner>();
		if (!canvasGroup) canvasGroup = GetComponentInParent<CanvasGroup>();

		// Auto-find TMP text if not assigned
		if (!bodyTMP)
			bodyTMP = GetComponentInChildren<TMP_Text>(true);
		if (!bodyTMP)
			Debug.LogWarning("[DialogueCanvasUI] No TMP_Text assigned/found for Body text.");

		HideImmediate();

		if (runner)
		{
			runner.OnLine += HandleLine;
			runner.OnChoices += HandleChoices;
			runner.OnEnd += HandleEnd;
		}
	}

	private void OnDestroy()
	{
		if (runner)
		{
			runner.OnLine -= HandleLine;
			runner.OnChoices -= HandleChoices;
			runner.OnEnd -= HandleEnd;
		}
		StopAllCoroutines();
	}

	private void Update()
	{
		// Optional: keyboard shortcuts for first few choices
		if (_spawned.Count > 0)
		{
			for (int i = 0; i < _spawned.Count && i < choiceHotkeys.Length; i++)
			{
				if (Input.GetKeyDown(choiceHotkeys[i]) && _spawned[i] && _spawned[i].gameObject.activeInHierarchy)
				{
					_spawned[i].onClick.Invoke();
					return;
				}
			}
		}

		// + Spacebar gating (only when no choices visible)
		if (Input.GetKeyDown(advanceKey) && !_hasChoices)
		{
			if (_isTyping)
			{
				// Skip to full line
				FinishTypewriter();
			}
			else
			{
				// Advance to next line/end
				CancelAutoAdvance();
				runner?.Continue();
			}
		}
	}

	private void HandleLine(string text, List<string> tags)
	{
		if (showOnStart) Show();

		// New line: cancel choices and any pending auto-advance, start typewriter
		ClearChoices();
		_hasChoices = false;
		CancelAutoAdvance();
		StartTypewriter(text);
	}

	private void HandleChoices(List<string> choices)
	{
		if (showOnStart) Show();

		// Choices: stop typewriter/auto-advance and present options
		CancelTypewriter();
		CancelAutoAdvance();
		_hasChoices = true;

		ClearChoices();
		for (int i = 0; i < choices.Count; i++)
		{
			var btn = Instantiate(choiceButtonPrefab, choicesParent);
			btn.gameObject.SetActive(true);
			_spawned.Add(btn);

			// Label
			var label = btn.GetComponentInChildren<Text>(true);
			if (label) label.text = choices[i];
			var labelTMP = btn.GetComponentInChildren<TMP_Text>(true);
			if (labelTMP) labelTMP.text = choices[i];

			int index = i;
			btn.onClick.AddListener(() =>
			{
				CancelTypewriter();
				CancelAutoAdvance();
				DisableInteract();
				runner.Choose(index);
			});
		}
		EnableInteract();
	}

	private void HandleEnd()
	{
		ClearChoices();
		CancelTypewriter();
		CancelAutoAdvance();
		if (hideOnEnd) Hide();
	}

	// --- Typewriter ---

	private void StartTypewriter(string fullText)
	{
		CancelTypewriter();
		SetBodyText(fullText);                // set full text first
		if (bodyTMP) bodyTMP.maxVisibleCharacters = 0; // hide all characters
		if (bodyTMP) bodyTMP.ForceMeshUpdate();
		_typingCo = StartCoroutine(TypeRoutine());
	}

	private IEnumerator TypeRoutine()
	{
		_isTyping = true;

		if (!bodyTMP)
		{
			// Fallback: no TMP component assigned
			_isTyping = false;
			if (autoAdvance && !_hasChoices) ScheduleAutoAdvance();
			yield break;
		}

		int total = bodyTMP.textInfo.characterCount;
		if (total <= 0)
		{
			bodyTMP.ForceMeshUpdate();
			total = bodyTMP.textInfo.characterCount;
		}

		float delay = 1f / Mathf.Max(1f, charsPerSecond);
		for (int i = 1; i <= total; i++)
		{
			bodyTMP.maxVisibleCharacters = i;
			yield return new WaitForSeconds(delay);
		}

		_isTyping = false;

		// Schedule auto-advance after the line is fully revealed (if no choices)
		if (autoAdvance && !_hasChoices)
			ScheduleAutoAdvance();
	}

	private void FinishTypewriter()
	{
		if (!bodyTMP) { _isTyping = false; return; }
		CancelTypewriter();
		bodyTMP.maxVisibleCharacters = int.MaxValue; // reveal all
		_isTyping = false;

		// If no choices will be shown, start auto-advance timer now
		if (autoAdvance && !_hasChoices)
			ScheduleAutoAdvance();
	}

	private void CancelTypewriter()
	{
		if (_typingCo != null)
		{
			StopCoroutine(_typingCo);
			_typingCo = null;
		}
		_isTyping = false;
		if (bodyTMP) bodyTMP.maxVisibleCharacters = int.MaxValue;
	}

	private void ScheduleAutoAdvance()
	{
		CancelAutoAdvance();
		_autoAdvanceCo = StartCoroutine(AutoAdvanceRoutine());
	}

	private IEnumerator AutoAdvanceRoutine()
	{
		yield return new WaitForSeconds(autoAdvanceDelay);
		// Only advance if still no choices and not typing
		if (!_hasChoices && !_isTyping)
		{
			runner?.Continue();
		}
		_autoAdvanceCo = null;
	}

	private void CancelAutoAdvance()
	{
		if (_autoAdvanceCo != null)
		{
			StopCoroutine(_autoAdvanceCo);
			_autoAdvanceCo = null;
		}
	}

	// --- Existing helpers (unchanged) ---

	private void ClearChoices()
	{
		foreach (var b in _spawned)
			if (b) Destroy(b.gameObject);
		_spawned.Clear();
	}

	private void SetBodyText(string value)
	{
		// TMP-only
		if (bodyTMP) bodyTMP.text = value;
	}

	private string GetBodyText()
	{
		return bodyTMP ? bodyTMP.text : string.Empty;
	}

	private void Show()
	{
		if (root) root.SetActive(true);
		if (canvasGroup)
		{
			canvasGroup.alpha = 1f;
			canvasGroup.blocksRaycasts = true;
			canvasGroup.interactable = true;
		}
	}

	private void Hide()
	{
		if (canvasGroup)
		{
			canvasGroup.alpha = 0f;
			canvasGroup.blocksRaycasts = false;
			canvasGroup.interactable = false;
		}
		if (root) root.SetActive(false);
		SetBodyText(string.Empty);
	}

	private void HideImmediate() => Hide();
	private void EnableInteract() { if (canvasGroup) canvasGroup.interactable = true; }
	private void DisableInteract() { if (canvasGroup) canvasGroup.interactable = false; }
}
