using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeControlControl : InteractableControl
{
    [Header("Change Control")]
    public GameObject targetControl;

	// Use this for initialization
	void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public override void BeginInteraction()
    {
        Camera.main.GetComponent<CameraControl>().frozen = true;
        if (targetControl)
        {
            targetControl.GetComponent<ObjectControl>().frozen = false;
        }
    }

    public override void EndInteraction()
    {
        Camera.main.GetComponent<CameraControl>().frozen = false;
        if (targetControl)
        {
            targetControl.GetComponent<ObjectControl>().frozen = true;
        }
    }
}
