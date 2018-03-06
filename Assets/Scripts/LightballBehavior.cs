using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightballBehavior : InteractableControl
{

	// Use this for initialization
	void Start ()
    {
		
	}
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            BeginInteraction();
        }
    }

    public override void BeginInteraction()
    {
        gameObject.SetActive(false);
    }
}
