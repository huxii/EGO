using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public abstract class ActorControl : MonoBehaviour
{
    public UnityEvent onEnterCollider;
    public UnityEvent onExitCollider;

    // Use this for initialization
    void Start ()
    {
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public virtual void EnterCollider()
    {
        onEnterCollider.Invoke();
    }

    public virtual void ExitCollider()
    {
        onExitCollider.Invoke();
    }
}
