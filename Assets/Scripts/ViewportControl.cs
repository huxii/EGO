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
        /*
        if (switched)
        {
            return;
        }
        switched = true;

        playerHeight0 = GameControl.playerController.heightStandard;
        targetObject0 = originCameraCon.targetObject;
        distance0 = originCameraCon.distance;
        angleZero0 = originCameraCon.angleZero;
        angleRange0 = originCameraCon.angleRange;
        angleSensitivity0 = originCameraCon.angleSensitivity;
        angleSmooth0 = originCameraCon.angleSmooth;
        dAngle0 = originCameraCon.dAngle;

        originCameraCon.targetObject = targetCameraCon.targetObject;
        originCameraCon.distance = targetCameraCon.distance;
        originCameraCon.angleZero = targetCameraCon.angleZero;
        originCameraCon.angleRange = targetCameraCon.angleRange;
        originCameraCon.angleSensitivity = targetCameraCon.angleSensitivity;
        originCameraCon.angleSmooth = targetCameraCon.angleSmooth;
        originCameraCon.dAngle = new Vector2(0, 0);

        GameControl.playerController.heightStandard = playerHeight;
        */

    }

    protected void SwitchBack()
    {
        GameControl.cameraController.SwitchBack();
        GameControl.playerController.heightStandard = playerHeight0;

        /*
        if (!switched)
        {
            return;
        }
        switched = false;

        originCameraCon.targetObject = targetObject0;
        originCameraCon.distance = distance0;
        originCameraCon.angleZero = angleZero0;
        originCameraCon.angleRange = angleRange0;
        originCameraCon.angleSensitivity = angleSensitivity0;
        originCameraCon.angleSmooth = angleSmooth0;
        originCameraCon.dAngle = dAngle0;
        GameControl.playerController.heightStandard = playerHeight0;
        */
    }

    public virtual void SwitchViewport()
    {

    }

    public virtual void SwitchBackViewport()
    {

    }
}
