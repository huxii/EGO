using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class GameControl : MonoBehaviour
{
    public GameObject mainCam;
    public GameObject player;
    public GameObject soundManager;
    public GameObject videoManager;
    public GameObject tutorialManager;

    public static CameraControl cameraController;
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
        if (mainCam == null)
        {
            mainCam = GameObject.FindGameObjectWithTag("MainCamera");
        }
        cameraController = mainCam.GetComponent<CameraControl>();
        playerController = player.GetComponent<PlayerControl>();
        soundController = soundManager.GetComponent<SoundControl>();
        videoController = videoManager.GetComponent<VideoControl>();
        TutorialController = tutorialManager.GetComponent<TutorialControl>();
    }
    void Start()
    {

    }
    // Update is called once per frame
    void Update()
    {
       
    }
    

}
