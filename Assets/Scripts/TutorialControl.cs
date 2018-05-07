using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class TutorialControl : MonoBehaviour {
    public SpriteRenderer[] tutorialImages;
    public GameObject obj;
    public enum State {
        WAITMOVE = 0,
        WAITFLY = 5,
        WAITINTERACT = 9,
        WAITMOVECAMERA = 11,
        NONE = 100
    };

    State currentState;
    // Use this for initialization
    private void Awake()
    {
        /*
        if (Instance)
        {
            DestroyImmediate(gameObject);
        }
        else
        {
            DontDestroyOnLoad(transform.gameObject);
            Instance = this;
        }
        */
    }
    void Start () {
        currentState = State.WAITMOVE;
        foreach (SpriteRenderer i in tutorialImages) {
            i.color = new Color(1,1,1,0);
        }

        ChangeIcon(currentState);
        
	}
	
	// Update is called once per frame
	void Update () {
        ChangeState();
        Debug.Log(currentState);
    }

    public void ChangeState() {
        switch (currentState) {
            case State.NONE:
                break;
            case State.WAITFLY:
                if (Input.GetButton("raise"))
                {
                    tutorialImages[6].DOFade(1, 0.5f);
                }
                if (Input.GetButton("low")) {
                    tutorialImages[7].DOFade(1, 0.5f);
                }
                if (tutorialImages[6].color == Color.white &&
                   tutorialImages[7].color == Color.white) {
                    currentState = State.WAITINTERACT;
                    ChangeIcon(currentState);
                }
                break;
            case State.WAITMOVE:
                if (tutorialImages[0].color == Color.white){ 
                if (Input.GetAxis("Vertical") > 0) {
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
                } }
                break;
            case State.WAITINTERACT:
                if (obj.activeInHierarchy) {
                    tutorialImages[10].DOFade(1, 0.5f);
                }
                if (tutorialImages[10].color == Color.white)
                {
                    currentState = State.WAITMOVECAMERA;
                    ChangeIcon(currentState);
                }
                break;
            case State.WAITMOVECAMERA:
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
        yield return new WaitForSeconds(pause_time);
        tutorialImages[(int)s].DOFade(1, fade_duration);
        yield return new WaitForSeconds(fade_duration);
    }

    public IEnumerator Pause() {
        yield return new WaitForSeconds(1);
    }
    public void PauseCor() {
        StartCoroutine(Pause());
    }
}
