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

    [SerializeField]
    protected GameObject bgCam;
    protected Material scannerMat;
    protected ScannerTransitionControl transitionCon;

    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        if (transitionCon != null && transitionCon.Done())
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
        scannerMat.SetFloat("_EdgeWidth", scanEdgeWidth);
        scannerMat.SetFloat("_EdgeInnerBlur", scanInnerBlur);
        scannerMat.SetFloat("_EdgeOutterBlur", scanOutterBlur);

        if (scannerTarget)
        {
            transitionCon = scannerTarget.GetComponent<ScannerTransitionControl>();
            transitionCon.SetScannerMat(scannerMat);
            transitionCon.speed = scanSpeed;
        }
    }

    public override void BeginInteraction()
    {
        SoundUpdate();

        bgCam.GetComponent<Camera>().enabled = false;
        targetCamera.SetActive(true);

        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetFloat("_Range", scanRange);
        scannerMat.SetVector("_Center", transform.position);

        transitionCon.Play(new TransitionData(transform.position));
        /*
        if (gameObject.name == "TableLampScannerTrigger")
        {
            SoundControl.Instance.ChangeMusic(SoundControl.BGM.InValley, gameObject.transform.position,5);
            SoundControl.Instance.PlayAmbience(SoundControl.Ambience.AfterTable, gameObject.transform.position, 5);
        }else if (gameObject.name == "MakeupScannerSphereTrigger"){
            SoundControl.Instance.PlayEffect(SoundControl.SFX.Makeup, gameObject.transform.position, 1);
        }*/
    }

    public override void EndInteraction()
    {
        
    }

    public override void BeforeDestroyed()
    {
        scannerMat.SetFloat("_Timer", 0);

        bgCam.GetComponent<Camera>().enabled = true;
        InteractionUnready();
    }
}
