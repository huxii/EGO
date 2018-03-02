using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportTransitionBehavior : ViewportControl
{
    public GameObject hideObjects;
    public GameObject showObjects;

    bool dissolveStart = false;
    float dissolveTimer = 0;
    float dissolveSpeed = 0.5f;

    // Use this for initialization
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        DissolveTransitionUpdate();
    }

    void DissolveTransitionUpdate()
    {
        if (dissolveStart)
        {
            dissolveTimer += Time.deltaTime * dissolveSpeed;

            MeshRenderer[] meshes = hideObjects.GetComponentsInChildren<MeshRenderer>();
            foreach (MeshRenderer mesh in meshes)
            {
                Material mat = mesh.material;
                mat.SetFloat("_DissolveTimer", dissolveTimer);
            }

            if (dissolveTimer >= 1)
            {
                dissolveStart = false;
                hideObjects.SetActive(false);
            }
        }
    }

    public override void SwitchViewport()
    {
        SwitchCamera();

        if (hideObjects)
        {
            dissolveStart = true;
        }
    }
}
