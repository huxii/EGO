using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportPivotSwitchBehavior : MonoBehaviour
{
    public Transform originTransform;
    public Transform targetTransform;
    public GameObject hideObjects;
    public GameObject showObjects;

    // Use this for initialization
    void Start()
    {
        MeshRenderer[] meshes = showObjects.GetComponentsInChildren<MeshRenderer>();
        foreach (MeshRenderer mesh in meshes)
        {
            Material mat = mesh.material;
            mat.DOFade(0, 0f);
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    void OnTriggerStay(Collider other)
    {
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
    }
}
