using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScannerTransitionControl : TransitionEffectControl
{
    Material scannerMat;
    float scannerRange;

    // Use this for initialization
    void Start()
    {
        timer = 0;
        Init();

        foreach (Material mat in mats)
        {
            mat.SetFloat("_ReplacementTimer", 0);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (start)
        {
            timer += Time.deltaTime * speed;
            scannerMat.SetFloat("_Timer", timer);

            float scannerTimer = timer * scannerRange;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_ReplacementTimer", scannerTimer);
            }

            if (timer >= 1.0f)
            {
                BeforeEnd();
                start = false;
            }
        }
    }

    public override void Play(TransitionData data = null)
    {
        start = true;

        scannerRange = scannerMat.GetFloat("_Range");

        foreach (Material mat in mats)
        {
            mat.SetVector("_Center", data.pos);
        }
    }

    public void SetScannerMat(Material mat)
    {
        scannerMat = mat;
    }
}
