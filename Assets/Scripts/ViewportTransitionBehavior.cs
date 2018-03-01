using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : MonoBehaviour
{
    public Camera originCamera;
    public Camera targetCamera;
    public float playerHeight = 4f;
    public GameObject hideObjects;
    public GameObject showObjects;

    GameObject player;

    CameraControl originCameraCon;
    CameraControl targetCameraCon;

    bool switched = false;

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

            if (dissolveTimer >= 1)
            {
                dissolveStart = false;
                hideObjects.SetActive(false);
            }
        }
    }

    void SwitchCamera()
    {
        if (switched)
        {
            return;
        }
        switched = true;

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

    void SwitchBack()
    {
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
        }
    }

    void OnTriggerStay(Collider other)
    {
    }
}
