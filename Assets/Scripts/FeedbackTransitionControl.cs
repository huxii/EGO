using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FeedbackTransitionControl : TransitionEffectControl
{
    

	// Use this for initialization
	void Start ()
    {
        Init();
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public override void Play(TransitionData data = null)
    {
        foreach (Material mat in mats)
        {
            mat.SetFloat("_OutlineThickness", data.width);
        }
    }

    public override void Reverse(TransitionData data = null)
    {
        foreach (Material mat in mats)
        {
            mat.SetFloat("_OutlineThickness", 0);
        }
    }
}
