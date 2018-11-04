using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : ViewportControl
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

    public override void EnterCollider()
    {
        base.EnterCollider();

        SwitchCamera();

        if (Services.playerController)
        {
            Services.playerController.ResetHeight();
        }
    }

    public override void ExitCollider()
    {
        base.ExitCollider();
    }
}
