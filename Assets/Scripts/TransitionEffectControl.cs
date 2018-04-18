﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class TransitionData
{
    public Vector3 pos;
    public float width;

    public TransitionData(float outlineWidth = 0)
    {
        pos = new Vector3(0, 0, 0);
        width = outlineWidth;
    }

    public TransitionData(Vector3 position, float outlineWidth = 0)
    {
        pos = position;
        width = outlineWidth;
    }
}

public class TransitionEffectControl : MonoBehaviour
{
    public float timer = 0;
    public float speed = 1;
    public bool destroyWhenFinish = true;
    public List<GameObject> nextPlays;
    public List<GameObject> hideTargets;
    public List<GameObject> showTargets;

    protected List<Material> mats;
    protected bool start = false;

    // Use this for initialization
    void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    protected void Init()
    {
        MeshRenderer[] renderers = GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
                tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();

        if (showTargets != null)
        {
            foreach (GameObject nextTarget in showTargets)
            {
                if (nextTarget)
                {
                    nextTarget.SetActive(false);
                }
            }
        }

        if (nextPlays != null)
        {
            foreach (GameObject transition in nextPlays)
            {
                transition.SetActive(false);
            }
        }
    }

    protected void BeforeEnd()
    {
        if (destroyWhenFinish)
        {
            Destroy(gameObject);
        }

        if (nextPlays != null)
        {
            foreach (GameObject transition in nextPlays)
            {
                transition.GetComponent<TransitionEffectControl>().Play();
            }
        }

        if (hideTargets != null)
        {
            foreach (GameObject target in hideTargets)
            {
                DestroyObject(target);
            }
        }

        if (showTargets != null)
        {
            foreach (GameObject target in showTargets)
            {
                target.SetActive(true);
            }
        }

        if (nextPlays != null)
        {
            foreach (GameObject transition in nextPlays)
            {
                transition.SetActive(true);
            }
        }
    }

    public virtual void Play(TransitionData data = null)
    {
    }

    public virtual void Reverse(TransitionData data = null)
    {
    }
}