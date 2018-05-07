using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;


[System.Serializable]
public class SoundSettings
{
    public SoundEnum id;
    public ClipType type = ClipType.NONE;
    public Transform pos;
    public float delay = 0f;
    public float fadeDuration = 3f;
    public bool isLooping = false;
    public bool isFalloff = false;
    public bool isDestroiedAfterFinish = false;
    public bool isStandOut = false;
    public float spatialBlend = 0;
}


// Sounds doesnt inherent monobehavior, which means its more like a C++ class instead of the class we usually use in Unity
public class Sounds
{
    public virtual void Play(SoundSettings settings)
    {
        if (settings.id == SoundEnum.NONE)
        {
            return;
        }
        int i = settings.isFalloff ? 1 : 0;
        GameObject eff = NewPooledObject.current.GetSoundEffect();
        AudioSource source = eff.GetComponent<AudioSource>();
        SoundEffectController sec = eff.GetComponent<SoundEffectController>();
        source.clip = audio;
        Debug.Log(audio.name);
        Debug.Log(source.clip.name);
        source.loop = settings.isLooping;
        source.volume = 0;
        source.spread = i * 360;
        source.spatialBlend = settings.spatialBlend;
        eff.transform.position = settings.pos.position;
        sec.c = settings.type;
        sec.needTurnOff = settings.isDestroiedAfterFinish;
        if (settings.isStandOut) {
            //fade other sounds
        }
        eff.SetActive(true);
        source.PlayDelayed(settings.delay);
        source.DOFade(1, settings.fadeDuration);
    }

    public AudioClip audio;
}

public class BGM : Sounds
{
    public BGM(AudioClip clip) {
        audio = clip;
    }

    public override void Play(SoundSettings settings)
    {
        foreach (GameObject i in NewPooledObject.current.Effects) {
            if (i.activeInHierarchy && i.GetComponent<SoundEffectController>().c == ClipType.BGM)
            {
                i.GetComponent<AudioSource>().DOFade(0, 3f).OnComplete(() => { i.SetActive(false); });
                //
                i.GetComponent<SoundEffectController>().c = ClipType.NONE;

            }
        }
        base.Play(settings);

    }

}

public class Ambience : Sounds
{
    public Ambience(AudioClip clip) {
        audio = clip;
    }
}

public class SFX : Sounds
{
    public SFX(AudioClip clip) {
        audio = clip;
    }
}