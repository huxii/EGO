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

    public static SpriteRenderer[] tutorialImages;
    public enum State
    {
        WAITMOVE = 0,
        WAITFLY = 5,
        WAITINTERACT = 9,
        WAITMOVECAMERA = 11,
        NONE = 100
    };

    State currentState;

    // Use this for initialization
    void Awake()
    {
        if (player == null)
        {
            player = GameObject.FindGameObjectWithTag("Player");
        }
        cameraController = mainCam.GetComponent<CameraControl>();
        playerController = player.GetComponent<PlayerControl>();
        soundController = soundManager.GetComponent<SoundControl>();
        videoController = videoManager.GetComponent<VideoControl>();
        TutorialController = tutorialManager.GetComponent<TutorialControl>();
    }
    void Start()
    {
        currentState = State.WAITMOVE;
        foreach (SpriteRenderer i in tutorialImages)
        {
            i.color = new Color(1, 1, 1, 0);
        }

        //TutorialController.ChangeIcon(currentState);

    }
	// Update is called once per frame
	void Update ()
    {
        ChangeState();
	}
    public void ChangeState() {
        switch (currentState)
        {
            case State.NONE:
                break;
            case State.WAITFLY:
                if (tutorialImages[5].color == Color.white)
                {
                    if (Input.GetButton("raise"))
                    {
                        tutorialImages[6].DOFade(1, 0.5f);
                    }
                    if (Input.GetButton("low"))
                    {
                        tutorialImages[7].DOFade(1, 0.5f);
                    }
                    if (tutorialImages[6].color == Color.white &&
                       tutorialImages[7].color == Color.white)
                    {
                        currentState = State.WAITINTERACT;
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                break;
            case State.WAITMOVE:
                if (tutorialImages[0].color == Color.white)
                {
                    if (Input.GetAxis("Vertical") > 0)
                    {
                        tutorialImages[1].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Vertical") < 0)
                    {
                        tutorialImages[2].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Horizontal") < 0)
                    {
                        tutorialImages[3].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Horizontal") > 0)
                    {
                        tutorialImages[4].DOFade(1, 0.5f);
                    }
                    if (tutorialImages[1].color == Color.white &&
                        tutorialImages[2].color == Color.white &&
                        tutorialImages[3].color == Color.white &&
                        tutorialImages[4].color == Color.white)
                    {
                        currentState = State.WAITFLY;
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                break;
            case State.WAITINTERACT:
                if (tutorialImages[9].color == Color.white)
                {
                    if (true)
                    {
                        tutorialImages[10].DOFade(1, 0.5f);
                    }
                    if (tutorialImages[10].color != new Color (1,1,1,0))
                    {
                        currentState = State.WAITMOVECAMERA;
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                    break;
            case State.WAITMOVECAMERA:
                break;
        }
    }

}
