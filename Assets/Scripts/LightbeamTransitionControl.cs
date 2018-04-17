using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightbeamTransitionControl : TransitionEffectControl
{
	// Use this for initialization
	void Start ()
    {
        CollecteMats();
        timer = 4.0f;
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (start)
        {
            timer -= Time.deltaTime * speed;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_Tweak", timer);
            }

            if (timer <= -5f)
            {
                Destroy(gameObject);
            }
        }
    }

    public override void Disappear()
    {
        start = true;
    }
}
