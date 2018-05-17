﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class GameControl : MonoBehaviour
{
    public GameObject mainCam;
    public GameObject player;
    public GameObject soundManager;
    public GameObject videoManager;
    public GameObject HUDManager;

    public static CameraControl cameraController;
    public static PlayerControl playerController;
    public static SoundControl soundController;
    public static VideoControl videoController;
    public static HUDControl HUDController;

    bool started = false;

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
        if (player)
        {
            playerController = player.GetComponent<PlayerControl>();
        }
        if (soundManager)
        {
            soundController = soundManager.GetComponent<SoundControl>();
        }
        if (videoManager)
        {
            videoController = videoManager.GetComponent<VideoControl>();
        }
        if (HUDManager)
        {
            HUDController = HUDManager.GetComponent<HUDControl>();
        }
    }
    void Start()
    {

    }
    // Update is called once per frame
    void Update()
    {
        if (Input.GetButton("Exit"))
        {
            RestartGame();
        }
    }

    IEnumerator SwitchLevel(float time)
    {
        yield return new WaitForSeconds(time);
        SceneManager.LoadScene("Level1");
    }

    public void RestartGame()
    {
        if (!started)
        {
            started = true;
            HUDController.FadeIn();
            StartCoroutine(SwitchLevel(2f));
        }
    }
}
