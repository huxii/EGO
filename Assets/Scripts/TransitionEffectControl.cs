using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class TransitionEffectControl : MonoBehaviour
{
    public float speed = 1;

    protected List<Material> mats;
    protected float timer = 0;
    protected bool start = false;

    // Use this for initialization
    void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    protected void CollecteMats()
    {
        MeshRenderer[] renderers = GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
                tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();
    }

    public virtual void Appear()
    {
    }

    public virtual void Disappear()
    {
    }
}
