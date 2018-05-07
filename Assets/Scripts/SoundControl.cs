using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using System;


public enum ClipType
{
    NONE,
    BGM,
    AMBIENCE,
    SFX
}

// all the enums in one list
public enum SoundEnum
{
    NONE,
    // BGM
    BGM_INROOM,
    BGM_INVALLEY,
    BGM_AFTERFOG,
    BGM_EMPTYROOM,
    BGM_ROOMAPART,
    // Ambience
    AMB_AFTERTABLE,
    AMB_BEFORELEAVE,
    AMB_AFTERLEAVE,
    AMB_WATER,
    AMB_STREETLIGHTBUZZ,
    AMB_LAUGHAT,
    AMB_LIGHTBALLNORMAL,
    AMB_LIGHtBALLRUNAWAY,
    //SFX
    SFX_MAKEUP,
    SFX_PICNICNIGHT,
    SFX_SPOTLIGHT,
    SFX_FIREFLYSKILL1,
    SFX_FIREFLYSKILL2,
    SFX_FOGCLEAR
}

[Serializable]
public class ClipSetting
{
    public AudioClip clip = null;
    public SoundEnum id = SoundEnum.NONE;
    public ClipType type = ClipType.NONE;
}

public class SoundControl : MonoBehaviour
{
    public List<ClipSetting> clipList;

    Dictionary<SoundEnum, Sounds> soundsList;

    public static SoundControl Instance;

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
    void Start()
    {
        foreach (ClipSetting c in clipList)
        {
            Sounds newSound;
            switch (c.type)
            {
                case ClipType.NONE:
                    continue;
                default:
                    break;
                case ClipType.BGM:
                    newSound = new BGM(c.clip);
                    soundsList.Add(c.id, newSound);
                    break;
                case ClipType.AMBIENCE:
                    newSound = new Ambience(c.clip);
                    soundsList.Add(c.id, newSound);
                    break;
                case ClipType.SFX:
                    newSound = new SFX(c.clip);
                    soundsList.Add(c.id, newSound);
                    break;
            }            
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void Play(SoundSettings settings)
    {
        soundsList[settings.id].Play(settings);
    }

    /*
    public enum BGM
    {
        NONE = 0,
        INROOM,
        INVALLEY,
        AFTERFOG,
        EMPTYROOM,
        ROOMAPART
    };
    public enum Ambience
    {
        NONE = 0,
        AFTERTABLE,
        BEFORELEAVE,
        AFTERLEAVE,
        WATER,
        STREETLIGHTBUZZ,
        LAUGHAT,
        LIGHTBALLNORMAL,
        LIGHtBALLRUNAWAY

    }
    public enum SFX
    {
        NONE = 0,
        MAKEUP,
        PICNICNIGHT,
        SPOTLIGHT,
        FIREFLYSKILL1,
        FIREFLYSKILL2,
        FOGCLEAR,
    };

    public Dictionary<BGM,AudioClip> musics = new Dictionary<BGM, AudioClip>();
    public Dictionary<Ambience, AudioClip> ambiences = new Dictionary<Ambience, AudioClip>();
    public Dictionary<SFX, AudioClip> sfxs = new Dictionary<SFX, AudioClip>();

    public BGM startBGM = BGM.NONE;
    public float fade_duration = 10.0f;
    public float fade_volume = 0.5f;

    //could be replaced by pooling
    public void PlayEffect(SFX s,Vector3 position,float delay = 0f)
    {
        if (s == SFX.NONE)
        {
            return;
        }

        AudioClip value;
        GameObject eff = NewPooledObject.current.GetSoundEffect();

        eff.transform.position = position;
        AudioSource source = eff.GetComponent<AudioSource>();
        if (sfxs.TryGetValue(s, out value))
        {
            source.clip = value;
            source.loop = false;
            
            eff.SetActive(true);
            source.PlayDelayed(delay);
        }

    }
    public void PlayMusic(BGM b, float delay = 0f, float fade_duration = 5f)
    {
        if (b == BGM.NONE)
        {
            return;
        }

        AudioClip value;
        if (musics.TryGetValue(b, out value))
        {
            music_player.gameObject.transform.position = new Vector3(0, 0, 0);
            music_player.clip = value;
            music_player.loop = true;
            music_player.volume = 0;
        }
        music_player.Play();
        music_player.DOFade(fade_volume, fade_duration);
    }

    public void PlayAmbience(Ambience a, Vector3 position, bool looping = true, bool spread = true,float delay = 0f, float fade_duration = 5f)
    {
        if (a == Ambience.NONE)
        {
            return;
        }

        AudioClip value;
        GameObject eff = NewPooledObject.current.GetSoundEffect();
        int i = spread ? 1 : 0;
        eff.transform.position = position;
        AudioSource source = eff.GetComponent<AudioSource>();
        if (ambiences.TryGetValue(a, out value))
        {
            source.clip = value;
            source.loop = looping;
            source.spread = 360 * i;
            eff.SetActive(true);
            source.volume = 0;
            source.PlayDelayed(delay);
            source.DOFade(1, fade_duration);
        }

    }

    public void StopMusic(float fade_duration = 1f)
    {
        if (music_player.isPlaying)
        {
            music_player.DOFade(0, fade_duration);
        }
    }

    public void ChangeMusic(BGM b, float fade_duration = 1f)
    {
        StartCoroutine(ChangeMusicRoutine(b, fade_duration));
    }

    public IEnumerator ChangeMusicRoutine(BGM b, float fade_duration = 3f)         // This will fade out whatever is currently playing, and fade in whatever string you pass it, if there's a music file with that file name in music_sources
    {
        music_player.DOFade(0, fade_duration);
        yield return new WaitForSeconds(fade_duration);
        foreach (AudioClip clip in music_sources)
        {
            AudioClip value;
            if (musics.TryGetValue(b,out value))
            {
                music_player.clip = musics[b];
                music_player.loop = true;
                music_player.Play();
            }
        }
        music_player.DOFade(1, fade_duration);
        yield return new WaitForSeconds(fade_duration);
    }
*/
}