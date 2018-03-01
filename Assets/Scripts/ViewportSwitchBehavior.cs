using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportSwitchBehavior : MonoBehaviour
{
    public Camera originCamera;
    public Camera targetCamera;
    public float playerHeight = 4f;
    public bool switchBack = false;
    public bool switchCon = false;
    public GameObject switchedConObj = null;

    GameObject player;

    CameraControl originCameraCon;
    CameraControl targetCameraCon;

    float playerHeight0;
    GameObject targetObject0;
    float distance0;
    Vector2 angleZero0;
    Vector2 angleRange0;
    Vector2 angleSensitivity0;
    Vector2 angleSmooth0;
    Vector2 dAngle0;

    bool switched = false;

    // Use this for initialization
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        originCameraCon = originCamera.GetComponent<CameraControl>();
        targetCameraCon = targetCamera.GetComponent<CameraControl>();
    }

    // Update is called once per frame
    void Update()
    {
    }

    void SwitchCamera()
    {
        if (switched)
        {
            return;
        }
        switched = true;

        playerHeight0 = player.GetComponent<PlayerControl>().heightAxis;
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

        player.GetComponent<PlayerControl>().heightAxis = playerHeight;

        if (switchCon)
        {
            originCameraCon.frozen = true;
            if (switchedConObj)
            {
                switchedConObj.GetComponent<ObjectControl>().frozen = false;
            }
        }
    }

    void SwitchBack()
    {
        if (!switched || !switchBack)
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
        player.GetComponent<PlayerControl>().heightAxis = playerHeight0;

        // potential bug
        if (switchCon)
        {
            originCameraCon.frozen = false;
            if (switchedConObj)
            {
                switchedConObj.GetComponent<ObjectControl>().frozen = true;
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            SwitchCamera();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            SwitchBack();
        }
    }

    void OnTriggerStay(Collider other)
    {
    }
}
