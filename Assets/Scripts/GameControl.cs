using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameControl : MonoBehaviour
{
    public GameObject player;
    public GameObject soundManager;
    public GameObject videoManager;

    public static PlayerControl playerController;
    public static SoundControl soundController;
    public static VideoControl videoController;

    // Use this for initialization
    void Awake()
    {
        playerController = player.GetComponent<PlayerControl>();
        soundController = soundManager.GetComponent<SoundControl>();
        videoController = videoManager.GetComponent<VideoControl>();
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}
}
