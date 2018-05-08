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

    public enum State
    {
        WAITMOVE = 0,
        WAITFLY = 5,
        WAITINTERACT = 9,
        WAITMOVECAMERA = 11,
        FINISHED,
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
        currentState = State.WAITMOVE;
        foreach (SpriteRenderer i in TutorialController.tutorialImages)
        {
            i.color = new Color(1, 1, 1, 0);
        }

        TutorialController.ChangeIcon(currentState);

    }
    // Update is called once per frame
    void Update()
    {
        ChangeState();
    }
    public void ChangeState()
    {
        switch (currentState)
        {
            case State.NONE:
                break;
            case State.WAITFLY:
                if (TutorialController.tutorialImages[5].color == Color.white)
                {
                    if (Input.GetButton("raise"))
                    {
                        TutorialController.tutorialImages[6].DOFade(1, 0.5f);
                    }
                    if (Input.GetButton("low"))
                    {
                        TutorialController.tutorialImages[7].DOFade(1, 0.5f);
                    }
                    if (TutorialController.tutorialImages[6].color == Color.white &&
                        TutorialController.tutorialImages[7].color == Color.white)
                    {
                        currentState = State.WAITINTERACT;
                        GameObject.Find("Floor_Lamp").transform.DOScale(Vector3.one, 0.5f);
                        GameObject.Find("FloorLampPuzzle").transform.DOScale(Vector3.one, 0.5f);
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                break;
            case State.WAITMOVE:
                if (TutorialController.tutorialImages[0].color == Color.white)
                {
                    if (Input.GetAxis("Vertical") > 0)
                    {
                        TutorialController.tutorialImages[1].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Vertical") < 0)
                    {
                        TutorialController.tutorialImages[2].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Horizontal") < 0)
                    {
                        TutorialController.tutorialImages[3].DOFade(1, 0.5f);
                    }
                    if (Input.GetAxis("Horizontal") > 0)
                    {
                        TutorialController.tutorialImages[4].DOFade(1, 0.5f);
                    }
                    if (TutorialController.tutorialImages[1].color == Color.white &&
                        TutorialController.tutorialImages[2].color == Color.white &&
                        TutorialController.tutorialImages[3].color == Color.white &&
                        TutorialController.tutorialImages[4].color == Color.white)
                    {
                        currentState = State.WAITFLY;
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                break;
            case State.WAITINTERACT:
                if (TutorialController.tutorialImages[9].color == Color.white)
                {
                    if (GameObject.Find("Room_BeApart").activeInHierarchy)

                    {
                        TutorialController.tutorialImages[10].DOFade(1, 0.5f);
                    }
                    if (TutorialController.tutorialImages[10].color != new Color(1, 1, 1, 0))
                    {
                        currentState = State.WAITMOVECAMERA;
                        TutorialController.ChangeIcon(currentState);
                        //need to add animation;
                    }
                }
                break;
            case State.WAITMOVECAMERA:
                if (TutorialController.tutorialImages[11].color == Color.white)
                {
                    if (true)
                    {//if players move around mouse
                        currentState = State.FINISHED;
                        TutorialController.ChangeIcon(currentState);
                    }
                }
                break;
            case State.FINISHED:
                foreach(SpriteRenderer i in TutorialController.tutorialImages){

                    i.DOFade(0, 0.5f);
                }
                if(TutorialController.tutorialImages[11].color == new Color(1,1,1,0)){
                    foreach (SpriteRenderer i in TutorialController.tutorialImages)
                    {

                        i.gameObject.SetActive(false);
                    }
                }
                break;
        }
    }

}
