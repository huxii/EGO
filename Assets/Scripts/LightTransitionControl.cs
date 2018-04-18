using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightTransitionControl : TransitionEffectControl
{
    Light light;

    // Use this for initialization
    void Start()
    {
        light = GetComponent<Light>();
        timer = light.intensity;
    }

    // Update is called once per frame
    void Update()
    {
        if (start)
        {
            timer -= Time.deltaTime * speed;
            light.intensity = timer;

            if (timer <= 0)
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
