using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ViewportControl : MonoBehaviour
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
        GameControl.cameraController.SwitchCamera(targetCameraCon);
        playerHeight0 = GameControl.playerController.heightStandard;
        GameControl.playerController.heightStandard = playerHeight;
    }

    protected void SwitchBack()
    {
        GameControl.cameraController.SwitchBack();
        GameControl.playerController.heightStandard = playerHeight0;
    }

    public virtual void SwitchViewport()
    {

    }

    public virtual void SwitchBackViewport()
    {

    }
}
