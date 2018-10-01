using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class FeedbackTransitionControl : TransitionEffectControl
{
    float width;

	// Use this for initialization
	void Start ()
    {
        Init();
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    //public override void Play(TransitionData data = null)
    //{
    //    foreach (Material mat in mats)
    //    {
    //        mat.DOFloat(data.width, "_OutlineThickness", 0.5f);
    //    }
    //}

    //public override void Reverse(TransitionData data = null)
    //{
    //    foreach (Material mat in mats)
    //    {
    //        mat.DOFloat(0, "_OutlineThickness", 0.5f);
    //    }
    //}
}
