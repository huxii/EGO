﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class TutorialControl : MonoBehaviour {

    void Start () {
        
	}
	
	// Update is called once per frame
	void Update () {
        
    }

    public void ChangeIcon(GameControl.State s) {
        StartCoroutine(ChangeIconRoutine(s));
    }

    public IEnumerator ChangeIconRoutine(GameControl.State s, float fade_duration = 1f, float pause_time = 1f) {
        foreach (SpriteRenderer i in GameControl.tutorialImages)
        { i.DOFade(0, fade_duration); }
        yield return new WaitForSeconds(fade_duration);
        yield return new WaitForSeconds(pause_time);
        GameControl.tutorialImages[(int)s].DOFade(1, fade_duration);
        yield return new WaitForSeconds(fade_duration);
    }

    public IEnumerator Pause() {
        yield return new WaitForSeconds(1);
    }
    public void PauseCor() {
        StartCoroutine(Pause());
    }
}
