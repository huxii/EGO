using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : ViewportControl
{
    [Header("Interactable Trigger")]
    public List<GameObject> interactableTriggers;

    [Header("Trigger Sound")]
    public List<SoundSettings> triggerSoundList;

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

        if (interactableTriggers != null)
        {
            foreach (GameObject trigger in interactableTriggers)
            {
                trigger.GetComponent<InteractableControl>().BeginInteraction();
            }
        }

        if (GameControl.playerController)
        {
            GameControl.playerController.ResetHeight();
        }

        foreach (SoundSettings sound in triggerSoundList)
        {
            GameControl.soundController.Play(sound);
        }
    }

    public override void SwitchBackViewport()
    {
    }
}
