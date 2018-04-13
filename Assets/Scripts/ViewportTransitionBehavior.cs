using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : ViewportControl
{
    [Header("Environment Change")]
    public GameObject hideObjects;
    public GameObject showObjects;

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
        hideObjects.GetComponent<DissolveControl>().startDissolve = true;
    }

    public override void SwitchBackViewport()
    {
    }
}
