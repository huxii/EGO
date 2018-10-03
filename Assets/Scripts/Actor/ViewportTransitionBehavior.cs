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
        //if (hideObjects != null)
        //{
        //    foreach (GameObject hide in hideObjects)
        //    {
        //        if (hide.GetComponent<TransitionEffectControl>())
        //        {
        //            //hide.GetComponent<TransitionEffectControl>().Play();
        //        }
        //        else
        //        {
        //            hide.SetActive(false);
        //        }
        //    }
        //}
        //if (showObjects != null)
        //{
        //    foreach (GameObject show in showObjects)
        //    {
        //        show.SetActive(true);
        //        //if (show.GetComponent<TransitionEffectControl>())
        //        //{
        //        //    show.GetComponent<TransitionEffectControl>().Reverse();
        //        //}
        //    }
        //}

        if (GameControl.playerController)
        {
            GameControl.playerController.ResetHeight();
        }
    }

    public override void ExitCollider()
    {
        base.ExitCollider();
    }
}
