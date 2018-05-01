using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class InteractableControl : MonoBehaviour
{
    [Header("Interactable System")]
    public bool beginInteractionByButton = false;
    public bool endInteractionByButton = false;

    [Header("Trigger Outline")]
    public GameObject triggerObject;
    public float triggerOutlineWidth = 0.5f;

    [Header("Trigger Sound")]
    public SoundControl.SFX triggerSFX = SoundControl.SFX.NONE;
    public SoundControl.BGM triggerBGM = SoundControl.BGM.NONE;
    public SoundControl.Ambience triggerAmbience = SoundControl.Ambience.NONE;

    List<Material> mats;

    // Use this for initialization
    void Start ()
    {
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    protected void SoundUpdate()
    {
        GameControl.soundController.PlayEffect(triggerSFX, transform.position);
        GameControl.soundController.PlayMusic(triggerBGM, transform.position);
        GameControl.soundController.PlayAmbience(triggerAmbience, transform.position);
    }

    public void InteractionReady()
    {
        triggerObject.GetComponent<FeedbackTransitionControl>().Play(new TransitionData(triggerOutlineWidth));
    }

    public void InteractionUnready()
    {
        triggerObject.GetComponent<FeedbackTransitionControl>().Reverse();
    }

    public virtual void BeginInteraction()
    {

    }

    public virtual void EndInteraction()
    {
    }

    public virtual void BeforeDestroyed()
    {      
    }
}
