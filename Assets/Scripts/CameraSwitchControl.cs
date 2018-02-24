using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CameraSwitchControl : MonoBehaviour
{
    public bool switchBack = false;

    public Camera originCamera;
    public Camera targetCamera;
    public GameObject hideObjects;
    public GameObject showObjects;
    public float playerHeight = 4f;

    GameObject player;

    CameraControl originCameraCon;
    CameraControl targetCameraCon;

    GameObject targetObject0;
    float distance0;
    Vector2 angleZero0;
    Vector2 angleRange0;
    Vector2 angleSensitivity0;
    Vector2 angleSmooth0;
    Vector2 dAngle0;

    bool dissolveStart = false;
    float dissolveTimer = 0;
    float dissolveSpeed = 0.5f;

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
        if (dissolveStart)
        {
            dissolveTimer += Time.deltaTime * dissolveSpeed;

            MeshRenderer[] meshes = hideObjects.GetComponentsInChildren<MeshRenderer>();
            foreach (MeshRenderer mesh in meshes)
            {
                Material mat = mesh.material;
                mat.SetFloat("_DissolveTimer", dissolveTimer);
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
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

            if (hideObjects)
            {
                dissolveStart = true;
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            if (switchBack)
            {
                originCameraCon.targetObject = targetObject0;
                originCameraCon.distance = distance0;
                originCameraCon.angleZero = angleZero0;
                originCameraCon.angleRange = angleRange0;
                originCameraCon.angleSensitivity = angleSensitivity0;
                originCameraCon.angleSmooth = angleSmooth0;
                originCameraCon.dAngle = dAngle0;
            }
        }
    }

    void OnTriggerStay(Collider other)
    {
        /*
        MeshRenderer[] meshes = showObjects.GetComponentsInChildren<MeshRenderer>();
        foreach (MeshRenderer mesh in meshes)
        {
            Material mat = mesh.material;
            mat.DOFade(1, 1f);
        }

        originTransform.DORotate(targetTransform.eulerAngles, 1f);
        originTransform.DOMove(targetTransform.position, 1f).OnComplete(
            () =>
            {
                meshes = hideObjects.GetComponentsInChildren<MeshRenderer>();
                foreach (MeshRenderer mesh in meshes)
                {
                    Material mat = mesh.material;
                    mat.DOFade(0, 1f);
                }
                Camera cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
                cam.GetComponent<CameraControl>().targetTransform = targetTransform;
            }
            );

    */
    }
}
