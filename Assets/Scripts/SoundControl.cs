using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using System;

public class SoundControl : MonoBehaviour
{
    [System.Serializable]
    public class BGMSettings
    {
        public BGM id = BGM.NONE;
        public float delay = 0f;
    };
    [System.Serializable]
    public class SFXSettings
    {
        public SFX id = SFX.NONE;
        public float delay = 0f;
    };
    [System.Serializable]
    public class AmbienceSettings
    {
        public Ambience id = Ambience.NONE;
        public float delay = 0f;
        public bool isFalloff = false;
        public bool isLooping = false;
        public Transform position;
    };

    public AudioSource music_player;
    public AudioClip[] music_sources;
    public AudioClip[] effect_sources;
    public AudioClip[] ambience_sources;

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
        foreach (BGM bgm in Enum.GetValues(typeof(BGM)))
        {
            musics.Add(bgm, music_sources[(int)bgm]);
        }

        foreach (Ambience amb in Enum.GetValues(typeof(Ambience)))
        {
            ambiences.Add(amb, ambience_sources[(int)amb]);
        }

        foreach (SFX sfx in Enum.GetValues(typeof(SFX)))
        {
            sfxs.Add(sfx, effect_sources[(int)sfx]);
        }

        transform.position = GameObject.Find("Player").transform.position;
        music_player.clip = musics[startBGM];
        music_player.loop = true;
        music_player.Play();
        music_player.DOFade(fade_volume, fade_duration);

    }

    // Update is called once per frame
    void Update()
    {

    }
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

    /*public void PlayAmbience(Ambience a, Vector3 position, float fade_duration = 1f)
    {
        if (a == Ambience.NONE)
        {
            return;
        }

        AudioClip value;
        if (ambiences.TryGetValue(a,out value))
            {
                ambience_player.gameObject.transform.position = position;
                ambience_player.clip = value;
                ambience_player.loop = true;
                ambience_player.volume = 0;
            }
            ambience_player.Play();
            ambience_player.DOFade(fade_volume, fade_duration);
    }*/
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

    /*public void StopAmbience(float fade_duration = 1f)
    {
        if (ambience_player.isPlaying)
        {
            ambience_player.DOFade(0, fade_duration);
        }
    }*/

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

    /*public void ChangeAmbience(Ambience a, Vector3 position, float fade_duration = 2f)
    {
        StartCoroutine(ChangeAmbienceRoutine(a, position, fade_duration));
    }

    public IEnumerator ChangeAmbienceRoutine(Ambience a, Vector3 position, float fade_duration = 2f)         // This will fade out whatever is currently playing, and fade in whatever string you pass it, if there's a music file with that file name in music_sources
    {
        ambience_player.DOFade(0, fade_duration);
        yield return new WaitForSeconds(fade_duration);
        foreach (AudioClip clip in ambience_sources)
        {
            AudioClip value;
            if (ambiences.TryGetValue(a, out value))
            {
                ambience_player.clip = value;
                ambience_player.loop = true;
                ambience_player.Play();
            }
            music_player.DOFade(1, fade_duration);
            yield return new WaitForSeconds(fade_duration);
        }
    }*/
}