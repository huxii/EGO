using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveTransitionControl : TransitionEffectControl
{
    public bool reverse = false;

    // Use this for initialization
    void Start ()
    {
        Init();
        ResetMaterials();
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (start)
        {
            timer += Time.deltaTime * speed;
            if (reverse)
            {
                foreach (Material mat in mats)
                {
                    mat.SetFloat("_DissolveTimer", 1 - timer);
                }
            }
            else
            {
                foreach (Material mat in mats)
                {
                    mat.SetFloat("_DissolveTimer", timer);
                }
            }

            if (timer > 1.0f || timer < 0.0f)
            {
                if (destroyWhenFinish)
                {
                    ResetMaterials();
                }
                End();
            }
        }
	}

    void ResetMaterials()
    {
        timer = 0;
        if (reverse)
        {
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", 1 - timer);
            }
        }
        else
        {
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", 0);
            }
        }
    }

    public override void Play(TransitionData data = null)
    {
        start = true;
    }
}
