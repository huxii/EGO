using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveTransitionControl : TransitionEffectControl
{
	// Use this for initialization
	void Start ()
    {
        Init();

        foreach (Material mat in mats)
        {
            mat.SetFloat("_DissolveTimer", 1 - timer);
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (start)
        {
            timer += Time.deltaTime * speed;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", 1 - timer);
            }

            if (timer > 1.0f || timer < 0.0f)
            {
                BeforeEnd();
                start = false;
            }
        }
	}

    public override void Play(TransitionData data = null)
    {
        start = true;
    }
}
