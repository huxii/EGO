using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DissolveControl : TransitionEffectControl
{
    public bool reverse = false;
    public bool resetMaterialOnStart = false;

    // Use this for initialization
    void Start()
    {
        Init();

        if (resetMaterialOnStart)
        {
            ResetMaterials();
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (isPlaying)
        { 
            if (!reverse)
            {
                timer += Time.deltaTime * speed;
                foreach (Material mat in mats)
                {
                    mat.SetFloat("_DissolveTimer", timer);
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
                    mat.SetFloat("_DissolveTimer", timer);
                }

                if (timer <= 0f)
                {
                    Done();
                }
            }
        }
    }

    void ResetMaterials()
    {
        if (!reverse)
        {
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", 0);
            }
            timer = 0;
        }
        else
        {
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", 1);
            }
            timer = 1.0f;
        }
    }

    public void Play()
    {
        ResetMaterials();
        isPlaying = true;

        gameObject.SetActive(true);
    }
}
