using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Services
{
    public static CameraControl cameraController = null;
    public static PlayerControl playerController = null;
    public static SoundControl soundController = null;
    public static VideoControl videoController = null;
    public static HUDControl HUDController = null;

    public static void Init()
    {
        if (GameObject.FindGameObjectWithTag("Player") != null)
        {
            playerController = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerControl>();
        }
        if (GameObject.FindGameObjectWithTag("MainCamera") != null)
        {
            cameraController = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<CameraControl>();
        }
        
        if (GameObject.Find("SoundManager"))
        {
            soundController = GameObject.Find("SoundManager").GetComponent<SoundControl>();
        }

        if (GameObject.Find("VideoManager"))
        {
            videoController = GameObject.Find("VideoManager").GetComponent<VideoControl>();
        }

        if (GameObject.Find("HUD"))
        {
            HUDController = GameObject.Find("HUD").GetComponent<HUDControl>();
        }
    }

    public static void Update()
    {
        //eventManager.ProcessQueuedEvents();
        //taskManager.Update();
    }

    public static void Destroy()
    {
        cameraController = null;
        playerController = null;
        soundController = null;
        videoController = null;
        HUDController = null;
    }
}
