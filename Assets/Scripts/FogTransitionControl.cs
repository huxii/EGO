using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FogTransitionControl : TransitionEffectControl
{
    VolumetricFogAndMist.VolumetricFog fog;
    // Use this for initialization
    void Start ()
    {
        fog = GetComponent<VolumetricFogAndMist.VolumetricFog>();
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (!done && start)
        {
            fog.alpha -= Time.deltaTime * speed;
            fog.fogAreaFallOff -= Time.deltaTime * speed;

            if (fog.alpha <= 0 && fog.fogAreaFallOff <= 0)
            {
                SoundControl.Instance.ChangeMusic(SoundControl.BGM.AfterFog, gameObject.transform.position);
                End();
            }
        }
	}

    public override void Play(TransitionData data = null)
    {
        start = true;
    }
}
