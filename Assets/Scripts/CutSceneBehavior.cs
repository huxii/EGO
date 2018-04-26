using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CutSceneBehavior : MonoBehaviour
{
    public GameObject videoManager;
    VideoControl videoController;

	// Use this for initialization
	void Start ()
    {
        videoController = videoManager.GetComponent<VideoControl>();

    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            videoController.Play(VideoControl.VideoListID.LEVEL1CUTSCENE);
        }
    }
}
