using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class OutlineControl : MonoBehaviour
{
    public GameObject targetObj;
    public float speed = 1f;

    private float targetWidth = 0f;
    List<Material> mats;

    // Use this for initialization
    void Start ()
    {
        if (targetObj == null)
        {
            Destroy(this);
        }

        MeshRenderer[] renderers = targetObj.GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
                tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();
    }

    // Update is called once per frame
    void Update()
    {
        float currWidth = mats[0].GetFloat("_OutlineThickness");
        if (currWidth != targetWidth)
        {
            foreach (Material mat in mats)
            {
                mat.SetFloat("_OutlineThickness", currWidth + (targetWidth - currWidth) * Time.deltaTime * speed);
            }
        }
    }

    public void SetWidth(float width)
    {
        targetWidth = width;
    }
}
