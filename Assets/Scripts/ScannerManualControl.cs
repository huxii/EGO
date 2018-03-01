using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerManualControl : MonoBehaviour
{
    public GameObject scannerCamera;
    [Range(0f, 1f)]
    public float scanTimer = 0f;
    public float scanRange = 1f;
    public float scanEdgeWidth = 0.1f;
    public float scanInnerBlur = 1f;
    public float scanOutterBlur = 1f;

    Material scannerMat;
    List<GameObject> ppObjs;

    // Use this for initialization
    void Start()
    {
        scannerCamera.SetActive(true);
        CameraRenderImage camRender = scannerCamera.GetComponent<CameraRenderImage>();
        scannerMat = camRender.mat;
        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetFloat("_EdgeInnerBlur", scanInnerBlur);
        scannerMat.SetFloat("_EdgeOutterBlur", scanOutterBlur);

        ppObjs = new List<GameObject>();
        var allGameObjects = FindObjectsOfType(typeof(GameObject));
        foreach (GameObject o in allGameObjects)
        {
            if (o.layer == 8)
            {
                ppObjs.Add(o);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        scannerMat.SetFloat("_Timer", scanTimer);
        scannerMat.SetFloat("_EdgeWidth", scanEdgeWidth);
        scannerMat.SetFloat("_Range", scanRange);
        scannerMat.SetVector("_Center", transform.position);

        foreach (GameObject o in ppObjs)
        {
            if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
            {
                MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                foreach (MeshRenderer mesh in meshes)
                {
                    Material mat = mesh.material;
                    mat.SetFloat("_ReplacementTimer", scanTimer * scanRange);
                    mat.SetVector("_Center", transform.position);
                }
            }
        }
    }
}