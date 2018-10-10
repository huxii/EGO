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
        GameControl.cameraController.SwitchCamera(targetCameraCon);
        if (GameControl.playerController)
        {
            playerHeight0 = GameControl.playerController.heightStandard;
            GameControl.playerController.heightStandard = playerHeight;
        }
    }

    protected void SwitchBack()
    {
        switched = false;
        GameControl.cameraController.SwitchBack();
        if (GameControl.playerController)
        {
            GameControl.playerController.heightStandard = playerHeight0;
        }
    }
}
