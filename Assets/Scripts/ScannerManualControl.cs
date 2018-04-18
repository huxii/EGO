using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerManualControl : ScannerControl
{
    [Header("Scanner Manual Settings")]
    [Range(0f, 1f)]
    public float scanManualTimer = 0f;

    // Use this for initialization
    void Start()
    {
        Init();
        bgCam.SetActive(false);
        targetCamera.SetActive(true);
    }

    // Update is called once per frame
    void Update()
    {
        scannerMat.SetFloat("_Timer", scanManualTimer);
        scannerMat.SetVector("_Center", transform.position);
        /*
        foreach (GameObject o in ppObjs)
        {
            if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
            {
                MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                foreach (MeshRenderer mesh in meshes)
                {
                    foreach (Material mat in mesh.materials)
                    {
                        mat.SetFloat("_ReplacementTimer", scanManualTimer * scanRange);
                        mat.SetVector("_Center", transform.position);
                    }
                }
            }
        }
        */
    }
}
