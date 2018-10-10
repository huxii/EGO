using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightbeamControl : TransitionEffectControl
{
    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        if (isPlaying)
        {
            timer -= Time.deltaTime * speed;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_Tweak", timer);
            }

            if (timer <= -5f)
            {
                Done();
            }
        }
    }

    public override void Play()
    {
        base.Play();
        timer = 4.0f;
        foreach (Material mat in mats)
        {
            mat.SetFloat("_Tweak", timer);
        }
    }
}
