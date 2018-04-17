using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveTransitionControl : TransitionEffectControl
{
	// Use this for initialization
	void Start ()
    {
        CollecteMats();

        foreach (Material mat in mats)
        {
            mat.SetFloat("_DissolveTimer", timer);
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
                mat.SetFloat("_DissolveTimer", timer);
            }

            if (timer >= 1.0f)
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
