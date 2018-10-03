using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterfallControl : TransitionEffectControl
{
    public bool reverse = false;

    // Use this for initialization
    void Start()
    {
        Init();
    }

    void Update()
    {
        if (isPlaying)
        {
            if (!reverse)
            {
                timer += Time.deltaTime * speed;
                foreach (Material mat in mats)
                {
                    mat.SetFloat("_CutOff", timer);
                }

                if (timer >= 1f)
                {
                    Done();
                }
            }
            else
            {
                timer -= Time.deltaTime * speed;
                foreach (Material mat in mats)
                {
                    mat.SetFloat("_Cutoff", timer);
                }

                if (timer <= 0f)
                {
                    Done();
                }
            }
        }
    }

    public override void Play()
    {
        base.Play();

        if (!reverse)
        {
            timer = 0;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_Cutoff", timer);
            }
        }
        else
        {
            timer = 1.0f;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_Cutoff", timer);
            }
        }
    }
}
