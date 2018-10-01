using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterfallTransitionControl : TransitionEffectControl
{
    bool reverse = false;
    Material mat;
    float alphaCutoff;

    // Use this for initialization
    void Start()
    {
    }

    // Update is called once per frame
    //void Update()
    //{
    //    if (start)
    //    {
    //        mat.SetFloat("_Cutoff", timer);
    //        if (reverse)
    //        {
    //            timer -= Time.deltaTime * speed;
    //            if (timer <= alphaCutoff)
    //            {
    //                End();
    //            }
    //        }
    //        else
    //        {
    //            timer += Time.deltaTime * speed;
    //            if (timer >= alphaCutoff)
    //            {
    //                End();
    //            }

    //        }
    //    }
    //}

    //public override void Play(TransitionData data = null)
    //{
    //    mat = GetComponent<MeshRenderer>().material;
    //    start = true;
    //    reverse = false;
    //    timer = mat.GetFloat("_Cutoff");
    //    alphaCutoff = 1.0f;
    //}

    //public override void Reverse(TransitionData data = null)
    //{
    //    mat = GetComponent<MeshRenderer>().material;
    //    start = true;
    //    reverse = true;
    //    alphaCutoff = mat.GetFloat("_Cutoff");
    //    timer = 1.0f;
    //}
}
