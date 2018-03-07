using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerControl : InteractableControl
{
    [Header("Scanner Settings")]
    public GameObject scannerTarget;
    public float scanRange = 1f;
    public float scanEdgeWidth = 1f;
    public float scanSpeed = 0.2f;
    public float scanInnerBlur = 1f;
    public float scanOutterBlur = 1f;
    public bool hideTargetAfterDestroyed = false;

    protected GameObject bgCam;
    protected Material scannerMat;
    [SerializeField]
    protected List<GameObject> ppObjs;

    bool startScanner;
    float scanTimer;

    // Use this for initialization
    void Start()
    {
        startScanner = false;
        scanTimer = 0f;

        foreach (GameObject nextTarget in nextTargets)
        {
            nextTarget.SetActive(false);
            if (nextTarget.GetComponent<ScannerControl>())
            {
                nextTarget.GetComponent<ScannerControl>().scannerTarget.SetActive(false);
            }
        }

        Init();
    }

    // Update is called once per frame
    void Update()
    {
        if (startScanner)
        {
            if (scanTimer < 1.0f)
            {
                scanTimer += Time.deltaTime * scanSpeed;
                scannerMat.SetFloat("_Timer", scanTimer);

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
                            }
                        }
                    }
                }
            }
            else
            {
                BeforeDestroyed();
                Destroy(gameObject);
            }
        }
    }

    protected void Init()
    {
        bgCam = GameObject.FindGameObjectWithTag("ScannerBgCamera");

        CameraRenderImage camRender = targetCamera.GetComponent<CameraRenderImage>();
        scannerMat = camRender.mat;
        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetFloat("_Range", scanRange);
        scannerMat.SetFloat("_EdgeWidth", scanEdgeWidth);
        scannerMat.SetFloat("_EdgeInnerBlur", scanInnerBlur);
        scannerMat.SetFloat("_EdgeOutterBlur", scanOutterBlur);

        if (scannerTarget)
        {
            ppObjs = new List<GameObject>();
            Transform[] allChildren = scannerTarget.GetComponentsInChildren<Transform>();
            foreach (Transform child in allChildren)
            {
                //Debug.Log(child.gameObject);
                if (child.gameObject.layer == 8)
                {
                    ppObjs.Add(child.gameObject);
                    MeshRenderer[] meshes = child.gameObject.GetComponentsInChildren<MeshRenderer>();
                    foreach (MeshRenderer mesh in meshes)
                    {
                        foreach (Material mat in mesh.materials)
                        {
                            mat.SetFloat("_ReplacementTimer", 0);
                        }
                    }
                }
            }
        }
    }

    public override void BeginInteraction()
    {
        if (!startScanner)
        {
            bgCam.SetActive(false);
            targetCamera.SetActive(true);
            startScanner = true;
            scanTimer = 0;
            scannerMat.SetFloat("_Timer", 0);
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
                            mat.SetVector("_Center", transform.position);
                        }
                    }
                }
            }
        }
    }

    public override void EndInteraction()
    {
    }

    public override void BeforeDestroyed()
    {
        scannerMat.SetFloat("_Timer", 0);
        foreach (GameObject nextTarget in nextTargets)
        {
            nextTarget.SetActive(true);
            if (nextTarget.GetComponent<ScannerControl>())
            {
                nextTarget.GetComponent<ScannerControl>().scannerTarget.SetActive(true);
            }         
        }

        if (hideTargetAfterDestroyed)
        {
            scannerTarget.SetActive(false);
        }

        bgCam.SetActive(true);
    }
}
