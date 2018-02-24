using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraRenderImage : MonoBehaviour
{
    public Material mat;

    // Use this for initialization
    void Start ()
    {
        Camera cam = GetComponent<Camera>();
        cam.depthTextureMode = DepthTextureMode.Depth;
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        Graphics.Blit(src, dest, mat);
    }
}
