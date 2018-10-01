using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraCloneBehavior : MonoBehaviour
{
	// Use this for initialization
	void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
        transform.position = Camera.main.transform.position;
        transform.rotation = Camera.main.transform.rotation;
	}
}
