using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostViewportSwitchTransitionBehavior : ViewportSwitchBehavior
{
    public List<GameObject> nextPlays;
    public GameObject triggerTarget;
    public float delay = 3f;

    float delayTimer = 0;
    bool start = false;

    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        if (start)
        {
            if (delayTimer < delay)
            {
                delayTimer += Time.deltaTime;
                if (delayTimer >= delay)
                {
                    if (nextPlays != null)
                    {
                        //foreach (GameObject transition in nextPlays)
                        //{
                        //    transition.SetActive(true);
                        //    transition.GetComponent<TransitionEffectControl>().Play();
                        //}
                    }
                }
            }
        }
        else
        if (triggerTarget == null && !switched)
        {
            start = true;
        }
    }

    //public override void SwitchViewport()
    //{
    //    switched = true;
    //    SwitchCamera();
    //}

    //public override void SwitchBackViewport()
    //{
    //    switched = false;
    //    SwitchBack();
    //}
}
