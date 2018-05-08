using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;


[System.Serializable]
public class SoundSettings
{
    public SoundEnum id;
    public ClipType type = ClipType.NONE;
    public bool isTurnOn = true;
    public Transform trans;
    public float delay = 0f;
    public float fadeDuration = 3f;
    public bool isLooping = false;
    public bool isFalloff = false;
    public bool isStandOut = false;
    public float spatialBlend = 0;
    public Vector3 pos;

    SoundSettings(Vector3 pos) {
        pos = trans.position;
    }
}


// Sounds doesnt inherent monobehavior, which means its more like a C++ class instead of the class we usually use in Unity
public class Sounds
{
    public Sounds(AudioClip clip)
    {
        audio = clip;
        curSound = null;
    }

    public virtual void Play(SoundSettings settings)
    {
        if (settings.id == SoundEnum.NONE)
        {
            return;
        }
        int i = settings.isFalloff ? 1 : 0;
        GameObject newSound = NewPooledObject.current.GetSoundEffect();
        AudioSource newSource = newSound.GetComponent<AudioSource>();
        newSource.clip = audio;
        newSource.loop = settings.isLooping;
        newSource.volume = 0;
        newSource.spread = i * 360;
        newSource.spatialBlend = settings.spatialBlend;
        newSound.transform.position = settings.pos;

        if (settings.isStandOut)
        {
            //fade other sounds
        }
        if(settings.isTurnOn){
            Stop();
        }
        newSound.SetActive(true);
        newSource.PlayDelayed(settings.delay);
        newSource.DOFade(1, settings.fadeDuration);
        curSound = newSound;
    }

    public virtual void Stop()
    {
        if (!curSound)
        {
            return;
        }
        curSound.GetComponent<AudioSource>().DOFade(0, 3f).OnComplete(() => { curSound.SetActive(false); });
        curSound = null;
    }

    public ClipType type = ClipType.NONE;
    public GameObject curSound;
    protected AudioClip audio;
}

public class BGM : Sounds
{
    public BGM(AudioClip clip) : base(clip)
    {
        type = ClipType.BGM;
    }
}

public class Ambience : Sounds
{
    public Ambience(AudioClip clip) : base(clip)
    {
        type = ClipType.AMBIENCE;
    }
}

public class SFX : Sounds
{
    public SFX(AudioClip clip) : base(clip)
    {
        type = ClipType.SFX;
    }
}