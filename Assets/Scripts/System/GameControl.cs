using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class GameControl : MonoBehaviour
{
    //public GameObject mainCam;
    //public GameObject player;
    //public GameObject soundManager;
    //public GameObject videoManager;
    //public GameObject HUDManager;

    //public static CameraControl cameraController;
    //public static PlayerControl playerController;
    //public static SoundControl soundController;
    //public static VideoControl videoController;
    //public static HUDControl HUDController;

    bool started = false;

    // Use this for initialization
    void Awake()
    {
        Services.Init();
    }
    void Start()
    {

    }

    void OnDestroy()
    {
        Services.Destroy();
    }

    // Update is called once per frame
    void Update()
    {
        Services.Update();

        if (Input.GetButton("Exit"))
        {
            RestartGame();
        }
    }

    IEnumerator SwitchLevel(float time)
    {
        yield return new WaitForSeconds(time);
        SceneManager.LoadScene("Title");
    }

    public void RestartGame()
    {
        if (!started)
        {
            started = true;
            Services.HUDController.FadeIn();
            StartCoroutine(SwitchLevel(2f));
        }
    }
}
