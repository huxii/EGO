using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class PhotoControl : MonoBehaviour
{
    // Use this for initialization
    void Start()
    {
        Services.playerController.frozen = true;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("Interact"))
        {
            Services.playerController.frozen = false;
            Services.HUDController.ClosePhoto(gameObject);
        }
    }
}
