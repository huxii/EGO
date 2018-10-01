using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class InteractableControl : MonoBehaviour
{
    [Header("Interactable System")]
    public UnityEvent onEnterCollider;
    public UnityEvent onExitCollider;
    public UnityEvent onBeginInteraction;
    public UnityEvent onEndInteraction;

    // Use this for initialization
    void Start ()
    {
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public void EnterCollider()
    {
        onEnterCollider.Invoke();
    }

    public void ExitCollider()
    {
        onExitCollider.Invoke();
    }

    public void BeginInteraction()
    {
        onBeginInteraction.Invoke();
    }

    public void EndInteraction()
    {
        onEndInteraction.Invoke();
    }
}
