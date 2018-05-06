using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameControl : MonoBehaviour
{
    public GameObject player;
    public GameObject soundManager;
    public GameObject videoManager;
    public GameObject tutorialManager;

    public static PlayerControl playerController;
    public static SoundControl soundController;
    public static VideoControl videoController;
    public static TutorialControl TutorialController;

    // Use this for initialization
    void Awake()
    {
        if (player == null)
        {
            player = GameObject.FindGameObjectWithTag("Player");
        }

        playerController = player.GetComponent<PlayerControl>();
        soundController = soundManager.GetComponent<SoundControl>();
        videoController = videoManager.GetComponent<VideoControl>();
        TutorialController = tutorialManager.GetComponent<TutorialControl>();
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}
}
