using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class InteractableControl : ActorControl
{
    public UnityEvent onBeginInteraction;
    public UnityEvent onEndInteraction;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    public virtual void BeginInteraction()
    {
        onBeginInteraction.Invoke();
    }

    public virtual void EndInteraction()
    {
        onEndInteraction.Invoke();
    }
}
