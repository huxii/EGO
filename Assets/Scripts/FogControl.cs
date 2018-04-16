using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FogControl : MonoBehaviour
{
    public bool fogGoingAway = false;
    public bool fogGone = false;
    public float fogFallSpeed = 1f;
    public float fogAlphaSpeed = 1f;

    VolumetricFogAndMist.VolumetricFog fog;

    // Use this for initialization
    void Start ()
    {
        fog = GetComponent<VolumetricFogAndMist.VolumetricFog>();
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (!fogGone && fogGoingAway)
        {
            fog.alpha -= Time.deltaTime * fogAlphaSpeed;
            fog.fogAreaFallOff -= Time.deltaTime * fogFallSpeed;

            if (fog.alpha <= 0 && fog.fogAreaFallOff <= 0)
            {
                fogGone = true;
                fogGoingAway = false;
            }
        }
	}
}
