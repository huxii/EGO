using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportSwitchBehavior : ViewportControl
{
    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
    }

    public override void BeginInteraction()
    {
        SwitchCamera();

        if (changeInteractionControl)
        {
            Camera.main.GetComponent<CameraControl>().frozen = true;
            if (targetControl)
            {
                targetControl.GetComponent<ObjectControl>().frozen = false;
            }
        }
    }

    public override void EndInteraction()
    {
        SwitchBack();

        // potential bug
        if (changeInteractionControl)
        {
            Camera.main.GetComponent<CameraControl>().frozen = false;
            if (targetControl)
            {
                targetControl.GetComponent<ObjectControl>().frozen = true;
            }
        }
    }
}
