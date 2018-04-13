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
        SwitchCamera();
    }

    public override void SwitchBackViewport()
    {
        SwitchBack();
    }

}
