using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerManualControl : ScannerControl
{
    [Range(0f, 1f)]
    public float scanTimer = 0f;

    // Use this for initialization
    void Start()
    {
        scannerCamera.SetActive(true);
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        scannerMat.SetFloat("_Timer", scanTimer);
        scannerMat.SetVector("_Center", transform.position);

        foreach (GameObject o in ppObjs)
        {
            if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
            {
                MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                foreach (MeshRenderer mesh in meshes)
                {
                    foreach (Material mat in mesh.materials)
                    {
                        mat.SetFloat("_ReplacementTimer", scanTimer * scanRange);
                        mat.SetVector("_Center", transform.position);
                    }
                }
            }
        }
    }
}
