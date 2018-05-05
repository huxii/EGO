using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class TutorialController : MonoBehaviour {
    public Image tutorialImage;
    public Sprite[] icons;
    public Transform[] targetPos;
    public static TutorialController Instance;
    public enum State {
        NONE = 0,
        WAITFLYUP,
        WAITINTERACT,
        WAITMOVECAMERA,
    };

    State currentState;
    // Use this for initialization
    private void Awake()
    {
        if (Instance)
        {
            DestroyImmediate(gameObject);
        }
        else
        {
            DontDestroyOnLoad(transform.gameObject);
            Instance = this;
        }
    }
    void Start () {
        currentState = State.NONE;
        tutorialImage.sprite = icons[(int)currentState];
	}
	
	// Update is called once per frame
	void Update () {
        if (Time.timeSinceLevelLoad > 5 && Time.timeSinceLevelLoad<5.1f) {
            ChangeState(State.WAITFLYUP);
        }
	}

    public void ChangeState(State s) {
        currentState = s;
        switch (currentState) {
            case State.NONE:
                ChangeIcon(currentState);
                break;
            case State.WAITFLYUP:
                ChangeIcon(currentState);
                break;
            case State.WAITINTERACT:
                ChangeIcon(currentState);
                break;
            case State.WAITMOVECAMERA:
                ChangeIcon(currentState);
                break;

        }
    }
    public void ChangeIcon(State s) {
        StartCoroutine(ChangeIconRoutine(s));
    }

    public IEnumerator ChangeIconRoutine(State s, float fade_duration = 1f) {
        tutorialImage.DOFade(0, fade_duration);
        yield return new WaitForSeconds(fade_duration*3);
        tutorialImage.sprite = icons[(int)s];
        tutorialImage.transform.position = targetPos[(int)s].position;
        tutorialImage.DOFade(1, fade_duration);
        Debug.Log(tutorialImage.color);
        yield return new WaitForSeconds(fade_duration);
    }
}
