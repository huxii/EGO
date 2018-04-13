using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableControl : MonoBehaviour
{
    [Header("Interactable System")]
    public bool beginInteractionByButton = false;
    public bool endInteractionByButton = false;

    // Use this for initialization
    void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public virtual void BeginInteraction()
    {

    }

    public virtual void EndInteraction()
    {
    }

    public virtual void BeforeDestroyed()
    {      
    }
}
