using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTwoWayTransitionBehavior : ViewportControl
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

        float deltaZ = Services.playerController.transform.position.z - transform.position.z;
        Debug.Log("Switch camera");
        Debug.Log(deltaZ);
        if (deltaZ < 0)
        {
            if (!switched)
            {
                SwitchCamera();
            }
        }
    }

    public override void ExitCollider()
    {
        base.ExitCollider();

        float deltaZ = Services.playerController.transform.position.z - transform.position.z;
        Debug.Log("Switch back");
        Debug.Log(deltaZ);
        if (deltaZ < 0)
        {
            if (switched)
            {
                SwitchBack();
            }
        }
    }
}
