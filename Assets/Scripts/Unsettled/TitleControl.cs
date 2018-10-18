using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class TitleControl : MonoBehaviour
{
    public GameObject mainCam;
    public GameObject soundManager;
    public GameObject HUDManager;

    public static CameraControl cameraController;
    public static SoundControl soundController;
    public static HUDControl HUDController;

    bool started = false;

    // Use this for initialization
    void Awake()
    {
        if (mainCam == null)
        {
            mainCam = GameObject.FindGameObjectWithTag("MainCamera");
        }
        cameraController = mainCam.GetComponent<CameraControl>();
        if (soundManager)
        {
            soundController = soundManager.GetComponent<SoundControl>();
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
    }

    IEnumerator SwitchLevel(float time)
    {
        yield return new WaitForSeconds(time);
        SceneManager.LoadScene("Level1");
    }

    public void StartGame()
    {
        if (!started)
        {
            started = true;
            HUDController.FadeIn();
            //soundController.FadeOut(2f);  KZ: I don't fucking understand, let me go back to this later
            StartCoroutine(SwitchLevel(2f));
        }
    }
}
