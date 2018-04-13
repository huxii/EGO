using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class DissolveControl : MonoBehaviour
{
    public bool startDissolve = false;
    public float dissolveSpeed = 1f;

    List<Material> mats;
    float dissolveTimer = 0.0f;

	// Use this for initialization
	void Start ()
    {
        MeshRenderer[] renderers = GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
            tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();
        foreach (Material mat in mats)
        {
            mat.SetFloat("_DissolveTimer", dissolveTimer);
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (startDissolve)
        {
            dissolveTimer += Time.deltaTime * dissolveSpeed;
            foreach (Material mat in mats)
            {
                mat.SetFloat("_DissolveTimer", dissolveTimer);
            }

            if (dissolveTimer >= 1.0f)
            {
                startDissolve = false;
            }
        }
	}
}
