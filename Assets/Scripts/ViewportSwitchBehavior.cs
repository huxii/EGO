using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportSwitchBehavior : ViewportControl
{
    public bool switchControl = false;
    public GameObject targetControl = null;

    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
    }

    public override void SwitchViewport()
    {
        SwitchCamera();

        if (switchControl)
        {
            Camera.main.GetComponent<CameraControl>().frozen = true;
            if (targetControl)
            {
                targetControl.GetComponent<ObjectControl>().frozen = false;
            }
        }
    }

    public override void SwitchBackViewport()
    {
        SwitchBack();

        // potential bug
        if (switchControl)
        {
            Camera.main.GetComponent<CameraControl>().frozen = false;
            if (targetControl)
            {
                targetControl.GetComponent<ObjectControl>().frozen = true;
            }
        }
    }
}
