using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : ViewportControl
{
    [Header("Environment Change")]
    public List<GameObject> hideObjects;
    public List<GameObject> showObjects;

    [Header("Trigger Sound")]
    public SoundControl.BGMSettings triggerBGM;
    public List<SoundControl.AmbienceSettings> triggerAmbience;

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
        if (hideObjects != null)
        {
            foreach (GameObject hide in hideObjects)
            {
                if (hide.GetComponent<TransitionEffectControl>())
                {
                    hide.GetComponent<TransitionEffectControl>().Play();
                }
            }
        }
        if (showObjects != null)
        {
            foreach (GameObject show in showObjects)
            {
                show.SetActive(true);
                if (show.GetComponent<TransitionEffectControl>())
                {
                    show.GetComponent<TransitionEffectControl>().Reverse();
                }
            }
        }

        GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerControl>().ResetHeight();

        GameControl.soundController.PlayMusic(triggerBGM.id);
        foreach (SoundControl.AmbienceSettings am in triggerAmbience)
        {
            GameControl.soundController.PlayAmbience(am.id, transform.position);
        }
    }

    public override void SwitchBackViewport()
    {
    }
}
