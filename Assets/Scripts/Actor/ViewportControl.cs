using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ViewportControl : ActorControl
{
    public GameObject targetCamera;
    public float playerHeight = 4f;

    protected bool switched = false;

    [SerializeField]
    CameraControl originCameraCon;
    CameraControl targetCameraCon;

    float playerHeight0;

    // Use this for initialization
    void Start ()
    {
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    protected void Init()
    {
        originCameraCon = Camera.main.GetComponent<CameraControl>();
        targetCameraCon = targetCamera.GetComponent<CameraControl>();
    }

    protected void SwitchCamera()
    {
        switched = true;
        Services.cameraController.SwitchCamera(targetCameraCon);
        if (Services.playerController)
        {
            playerHeight0 = Services.playerController.heightStandard;
            Services.playerController.heightStandard = playerHeight;
        }
    }

    protected void SwitchBack()
    {
        switched = false;
        Services.cameraController.SwitchBack();
        if (Services.playerController)
        {
            Services.playerController.heightStandard = playerHeight0;
        }
    }
}
