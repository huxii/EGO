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

    public override void SwitchViewport()
    {
        if (switched)
        {
            return;
        }
        switched = true;
        SwitchCamera();
    }

    public override void SwitchBackViewport()
    {
        if (!switched)
        {
            return;
        }
        switched = false;
        SwitchBack();
    }

}
