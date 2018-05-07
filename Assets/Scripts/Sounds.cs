using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[System.Serializable]
public class SoundSettings
{
    public SoundEnum id;
    public Vector3 pos = new Vector3(0f, 0f, 0f);
    public float delay = 0f;
    public bool isLooping = false;
    public bool isFalloff = false;
    public bool isDestroiedAfterFinish = false;
}


// Sounds doesnt inherent monobehavior, which means its more like a C++ class instead of the class we usually use in Unity
public class Sounds
{
    public virtual void Play(SoundSettings settings)
    {

    }

    AudioClip audio;
    AudioSource musicPlayer;
}

public class BGM : Sounds
{
    public BGM(AudioClip clip) { }

    public override void Play(SoundSettings settings)
    {

    }
}

public class Ambience : Sounds
{
    public Ambience(AudioClip clip) { }
}

public class SFX : Sounds
{
    public SFX(AudioClip clip) { }
}