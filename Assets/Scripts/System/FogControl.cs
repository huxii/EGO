using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FogControl : TransitionEffectControl
{
    VolumetricFogAndMist.VolumetricFog fog;
    // Use this for initialization
    void Start ()
    {
        fog = GetComponent<VolumetricFogAndMist.VolumetricFog>();
    }

    // Update is called once per frame
    void Update()
    {
        if (isPlaying)
        {
            fog.alpha -= Time.deltaTime * speed;
            fog.fogAreaFallOff -= Time.deltaTime * speed;

            if (fog.alpha <= 0 && fog.fogAreaFallOff <= 0)
            {
                Done();
            }
        }
    }
}
