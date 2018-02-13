using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class ViewportSwitchBehavior : MonoBehaviour
{
    public Camera cam;

    void Start()
    {
        cam.enabled = false;
    }

    void Update()
    {
    }

    void OnTriggerStay(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            if (Input.GetKeyDown(KeyCode.E))
            {
                GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerControl>().frozen = true;
                //GameObject.FindGameObjectWithTag("Player").SetActive(false);
                cam.enabled = true;
            }
            if (Input.GetKeyDown(KeyCode.R))
            {
                GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerControl>().frozen = false;
                GameObject.FindGameObjectWithTag("Player").SetActive(true);
                cam.enabled = false;
            }
        }
    }
}
