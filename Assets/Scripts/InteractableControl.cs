using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class InteractableControl : MonoBehaviour
{
    [Header("Interactable System")]
    public bool beginInteractionByButton = false;
    public bool endInteractionByButton = false;
    public GameObject triggerObject;
    public float triggerOutlineWidth = 0.5f;

    List<Material> mats;

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
        MeshRenderer[] renderers = triggerObject.GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
                tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();
    }

    public void InteractionReady()
    {
        foreach (Material mat in mats)
        {
            mat.SetFloat("_OutlineThickness", triggerOutlineWidth);
        }
    }

    public void InteractionUnready()
    {
        foreach (Material mat in mats)
        {
            mat.SetFloat("_OutlineThickness", 0);
        }
    }

    public virtual void BeginInteraction()
    {

    }

    public virtual void EndInteraction()
    {
    }

    public virtual void BeforeDestroyed()
    {      
    }
}
