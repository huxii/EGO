using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class ScannerControl : TransitionEffectControl
{
    public float scanRange = 1f;
    public float scanEdgeWidth = 1f;
    public float scanInnerBlur = 1f;
    public float scanOutterBlur = 1f;

    private GameObject bgCam;
    private Material scannerMat;

    // Use this for initialization
    void Start()
    {
        bgCam = GameObject.FindGameObjectWithTag("ScannerBgCamera");

        Init();
    }

    public void Play(GameObject camera)
    {
        isPlaying = true;
        timer = 0;

        CameraRenderImage camRender = camera.GetComponent<CameraRenderImage>();
        scannerMat = camRender.mat;
        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetFloat("_EdgeWidth", scanEdgeWidth);
        scannerMat.SetFloat("_EdgeInnerBlur", scanInnerBlur);
        scannerMat.SetFloat("_EdgeOutterBlur", scanOutterBlur);
        scannerMat.SetVector("_Center", camera.transform.position);

        foreach (Material mat in mats)
        {
            mat.SetFloat("_ReplacementTimer", 0);
            mat.SetVector("_Center", camera.transform.position);
        }

        bgCam.SetActive(false);
        camera.SetActive(true);

        if (GetComponent<OutlineControl>())
        {
            GetComponent<OutlineControl>().SetWidth(0);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (isPlaying)
        {
            timer += Time.deltaTime * speed;
            scannerMat.SetFloat("_Timer", timer);

            float scannerTimer = timer * scanRange;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_ReplacementTimer", scannerTimer);
            }

            if (timer >= 1f)
            {
                if (destroyWhenDone)
                {
                    Destroy(gameObject);
                    
                }
                isPlaying = false;
                bgCam.SetActive(true);

                nextTransition.Invoke();

                if (gameObject.GetComponent<InteractableControl>())
                {
                    gameObject.GetComponent<InteractableControl>().EndInteraction();
                }
            }
        }
    }
}
