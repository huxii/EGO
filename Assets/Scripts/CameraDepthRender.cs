using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class CameraDepthRender : MonoBehaviour
{

	// Use this for initialization
	void Start ()
    {
        //GameObject.FindGameObjectWithTag("MainCamera").GetComponent
        Camera cam = GetComponent<Camera>();
        cam.depthTextureMode = DepthTextureMode.Depth;
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}
}
