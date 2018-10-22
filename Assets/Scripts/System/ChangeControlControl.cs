using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeControlControl : InteractableControl
{
    [Header("Change Control")]
    public GameObject targetControl;
    public GameObject targetCamera;

	// Use this for initialization
	void Start ()
    {
        //Init();
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public override void BeginInteraction()
    {
        base.BeginInteraction();

        Services.cameraController.SwitchBack();
        Services.cameraController.SwitchCamera(targetCamera.GetComponent<CameraControl>());
        Services.cameraController.frozen = true;
        if (targetControl)
        {
            targetControl.GetComponent<ObjectControl>().frozen = false;
        }
    }

    public override void EndInteraction()
    {
        base.EndInteraction();

        Services.cameraController.SwitchBack();
        Services.cameraController.frozen = false;
        if (targetControl)
        {
            targetControl.GetComponent<ObjectControl>().frozen = true;
        }
    }

    public override void ExitCollider()
    {
        base.ExitCollider();

        EndInteraction();
    }
}
