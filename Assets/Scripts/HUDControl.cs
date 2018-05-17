using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class HUDControl : MonoBehaviour
{
    public GameObject tutorialManager;
    public GameObject blank;

    // Use this for initialization
    void Start ()
    {
        FadeOut();
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public void FadeIn(float time = 2f)
    {
        Color col = blank.GetComponent<Image>().color;
        blank.GetComponent<Image>().color = new Color(col.r, col.g, col.b, 0);
        blank.GetComponent<Image>().DOFade(1f, time);
    }

    public void FadeOut(float time = 2f)
    {
        Color col = blank.GetComponent<Image>().color;
        blank.GetComponent<Image>().color = new Color(col.r, col.g, col.b, 1);
        blank.GetComponent<Image>().DOFade(0f, time);
    }
}
