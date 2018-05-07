using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundEffectController : MonoBehaviour {
    bool played = false;
    public bool needTurnOff = false;
    public ClipType c = ClipType.NONE;
    public AudioSource source;
    // Use this for initialization
    void Start () {
        source = GetComponent<AudioSource>();
	}
	
	// Update is called once per frame
	void Update () {
        if (needTurnOff) {
            if (played && !source.isPlaying)
            {
                gameObject.SetActive(false);
            }
            else if (source.isPlaying) {
                played = true;
            }
        }
	}
    public void TurnOff() {
        gameObject.SetActive(false);
    }
}
