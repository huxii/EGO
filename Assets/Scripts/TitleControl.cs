using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TitleControl : MonoBehaviour
{
    public GameObject startViewport;
    public GameObject startScanner;
    public List<GameObject> startTransitions;

	// Use this for initialization
	void Start ()
    {
	}

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButton("Interact"))
        {
            StartGame();
        }
    }

    public void StartGame()
    {
        startScanner.GetComponent<ScannerControl>().BeginInteraction();
        foreach (GameObject trans in startTransitions)
        {
            trans.GetComponent<TransitionEffectControl>().Play();
        }
        startViewport.GetComponent<ViewportControl>().SwitchViewport();
    }
}
