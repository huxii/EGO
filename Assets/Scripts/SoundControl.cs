﻿using System.Collections;
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
}