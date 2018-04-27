using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class SoundControl : MonoBehaviour
{
    public AudioSource music_player;
    public AudioSource ambience_player;
    public AudioClip[] music_sources;
    public AudioClip[] effect_sources;
    public AudioClip[] ambience_sources;

    public enum BGM { InRoom = 0, InValley, AfterFog };
    public enum Ambience { AfterTable = 0, BeforeLeave, AfterLeave }
    public enum SFX { LightBallNormal, LightBallRunAway, Makeup, Picnic, PicnicLight, CameraLight, Water };

    public Dictionary<BGM,AudioClip> musics = new Dictionary<BGM, AudioClip>();
    public Dictionary<Ambience, AudioClip> ambiences = new Dictionary<Ambience, AudioClip>();
    public Dictionary<SFX, AudioClip> sfxs = new Dictionary<SFX, AudioClip>();


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
        musics.Add(BGM.InRoom, music_sources[0]);
        musics.Add(BGM.InValley, music_sources[1]);
        musics.Add(BGM.AfterFog, music_sources[2]);
        ambiences.Add(Ambience.AfterTable, ambience_sources[0]);
        ambiences.Add(Ambience.BeforeLeave, ambience_sources[1]);
        ambiences.Add(Ambience.AfterLeave, ambience_sources[2]);
        sfxs.Add(SFX.LightBallNormal, effect_sources[0]);
        sfxs.Add(SFX.LightBallRunAway, effect_sources[1]);
        sfxs.Add(SFX.Makeup, effect_sources[2]);
        sfxs.Add(SFX.Picnic, effect_sources[3]);
        sfxs.Add(SFX.PicnicLight, effect_sources[4]);
        sfxs.Add(SFX.CameraLight, effect_sources[5]);
        sfxs.Add(SFX.Water, effect_sources[6]);
        transform.position = GameObject.Find("Player").transform.position;
        music_player.clip = musics[BGM.InRoom];
        music_player.loop = true;
        music_player.Play();
        music_player.DOFade(fade_volume, fade_duration);

    }

    // Update is called once per frame
    void Update()
    {

    }
    //could be replaced by pooling
    public void PlayEffect(SFX s,Vector3 position,float delay){
        AudioClip value;
        GameObject eff = NewPooledObject.current.GetSoundEffect();
        if (eff == null) return;

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
    public void PlayMusic(BGM b, Vector3 position, float fade_duration)
    {
            AudioClip value;
            if (musics.TryGetValue(b,out value))
            {
                music_player.gameObject.transform.position = position;
                music_player.clip = value;
                music_player.loop = true;
                music_player.volume = 0;
            }
            music_player.Play();
            music_player.DOFade(fade_volume, fade_duration);
    }

    public void PlayAmbience(Ambience a, Vector3 position, float fade_duration)
    {
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
    }

    public void StopAmbience(float fade_duration)
    {
        if (ambience_player.isPlaying)
        {
            ambience_player.DOFade(0, fade_duration);
        }
    }

    public void StopMusic(float fade_duration)
    {
        if (music_player.isPlaying)
        {
            music_player.DOFade(0, fade_duration);
        }
    }

    public void ChangeMusic(BGM b, Vector3 position, float fade_duration = 1)
    {
        StartCoroutine(ChangeMusicRoutine(b, position, fade_duration));
    }

    public IEnumerator ChangeMusicRoutine(BGM b, Vector3 position, float fade_duration = 2)         // This will fade out whatever is currently playing, and fade in whatever string you pass it, if there's a music file with that file name in music_sources
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

    public void ChangeAmbience(Ambience a, Vector3 position, float fade_duration = 2)
    {
        StartCoroutine(ChangeAmbienceRoutine(a, position, fade_duration));
    }

    public IEnumerator ChangeAmbienceRoutine(Ambience a, Vector3 position, float fade_duration = 2)         // This will fade out whatever is currently playing, and fade in whatever string you pass it, if there's a music file with that file name in music_sources
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
    }
}