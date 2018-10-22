using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class TutorialControl : MonoBehaviour {
    public SpriteRenderer[] tutorialImages;
    public Animator mouseMove;

    private Vector3 initialCameraPos;
    private GameObject floorlamp;

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
    // Update is called once per frame

    void Start()
    {
            currentState = State.WAITMOVE;
            foreach (SpriteRenderer i in tutorialImages)
            {
                i.color = new Color(1, 1, 1, 0);
            }
            ChangeIcon(currentState);
        floorlamp = GameObject.Find("FloorLampScannerTrigger");
        floorlamp.GetComponent<BoxCollider>().enabled = false;
        floorlamp.GetComponent<ScannerControl>().enabled = false;
      
    }
    void Update () {
        ChangeState();
    }
    public void ChangeState()
    {
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
                        floorlamp.GetComponent<BoxCollider>().enabled = true;
                        floorlamp.GetComponent<ScannerControl>().enabled = true;
                        ChangeIcon(currentState);
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
                        ChangeIcon(currentState);
                    }
                }
                break;
            case State.WAITINTERACT:
                if (tutorialImages[9].color == Color.white)
                {
                    if (GameObject.Find("Room_BeApart").activeInHierarchy)

                    {
                        tutorialImages[10].DOFade(1, 0.5f);
                    }
                    if (tutorialImages[10].color != new Color(1, 1, 1, 0))
                    {
                        currentState = State.WAITMOVECAMERA;
                        ChangeIcon(currentState);
                        initialCameraPos = Services.cameraController.gameObject.transform.position;
                        
                    }
                }
                break;
            case State.WAITMOVECAMERA:
                if (tutorialImages[11].color == Color.white)
                {
                    if ((Services.cameraController.gameObject.transform.position - initialCameraPos).magnitude > 1f)
                    {//if players move around mouse
                        currentState = State.FINISHED;
                        ChangeIcon(currentState);
                        mouseMove.SetBool("HaveMoved", true);
                    }
                }
                break;
            case State.FINISHED:
                foreach (SpriteRenderer i in tutorialImages)
                {

                    i.DOFade(0, 0.5f);
                }
                if (tutorialImages[11].color == new Color(1, 1, 1, 0))
                {
                    foreach (SpriteRenderer i in tutorialImages)
                    {

                        i.gameObject.SetActive(false);
                    }
                }
                break;
        }
    }
    public void ChangeIcon(State s) {
        StartCoroutine(ChangeIconRoutine(s));
    }

    public IEnumerator ChangeIconRoutine(State s, float fade_duration = 1f, float pause_time = 1f) {
        foreach (SpriteRenderer i in tutorialImages)
        { i.DOFade(0, fade_duration); }
        yield return new WaitForSeconds(fade_duration);
        if (s != State.FINISHED)
        {
            tutorialImages[(int)s].DOFade(1, fade_duration);
            yield return new WaitForSeconds(fade_duration);
        }
    }

}
