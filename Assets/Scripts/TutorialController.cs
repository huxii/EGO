using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

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
		
	}

    public void ChangeState(State s) {
        currentState = s;
        switch (currentState) {
            case State.NONE:
                tutorialImage.sprite = icons[(int)currentState];
                tutorialImage.transform.position = targetPos[(int)currentState].position;
                break;
            case State.WAITFLYUP:
                tutorialImage.sprite = icons[(int)currentState];
                tutorialImage.transform.position = targetPos[(int)currentState].position;
                break;
            case State.WAITINTERACT:
                tutorialImage.sprite = icons[(int)currentState];
                tutorialImage.transform.position = targetPos[(int)currentState].position;
                break;
            case State.WAITMOVECAMERA:
                tutorialImage.sprite = icons[(int)currentState];
                tutorialImage.transform.position = targetPos[(int)currentState].position;
                break;

        }
    }
}
