using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerControl : InteractableControl
{
    [Header("Scanner Settings")]
    public GameObject targetCamera;
    public GameObject scannerTarget;
    public float scanRange = 1f;
    public float scanEdgeWidth = 1f;
    public float scanSpeed = 0.2f;
    public float scanInnerBlur = 1f;
    public float scanOutterBlur = 1f;
    public bool hideTargetAfterDestroyed = false;
    public List<GameObject> nextTargets;
    public List<GameObject> hideObjects;

    protected GameObject bgCam;
    protected Material scannerMat;
    protected ScannerTransitionControl transitionCon;

    // Use this for initialization
    void Start()
    {
        foreach (GameObject nextTarget in nextTargets)
        {
            if (nextTarget)
            {
                nextTarget.SetActive(false);
                if (nextTarget.GetComponent<ScannerControl>())
                {
                    nextTarget.GetComponent<ScannerControl>().scannerTarget.SetActive(false);
                }
            }
        }

        Init();
    }

    // Update is called once per frame
    void Update()
    {
        if (transitionCon != null && transitionCon.timer >= 1f)
        {
            BeforeDestroyed();
            Destroy(gameObject);
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
            transitionCon = scannerTarget.GetComponent<ScannerTransitionControl>();
            transitionCon.scannerMat = scannerMat;
            transitionCon.speed = scanSpeed;
        }
    }

    public override void BeginInteraction()
    {
        bgCam.SetActive(false);
        targetCamera.SetActive(true);

        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetVector("_Center", transform.position);

        transitionCon.Play(new TransitionData(transform.position));
    }

    public override void EndInteraction()
    {
    }

    public override void BeforeDestroyed()
    {
        scannerMat.SetFloat("_Timer", 0);

        if (nextTargets != null)
        {
            foreach (GameObject nextTarget in nextTargets)
            {
                nextTarget.SetActive(true);
                if (nextTarget.GetComponent<ScannerControl>())
                {
                    nextTarget.GetComponent<ScannerControl>().scannerTarget.SetActive(true);
                }
            }
        }

        if (hideObjects != null)
        {
            foreach (GameObject hide in hideObjects)
            {
                Destroy(hide);
            }
        }

        /*
        if (hideTargetAfterDestroyed)
        {
            Destroy(scannerTarget);
        }
        */
        bgCam.SetActive(true);
        InteractionUnready();
    }
}
