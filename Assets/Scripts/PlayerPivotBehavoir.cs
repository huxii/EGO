using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPivotBehavoir : MonoBehaviour
{
    public float distance = 3f;

    GameObject player;

	// Use this for initialization
	void Start ()
    {
        player = GameObject.FindGameObjectWithTag("Player");
	}

    // Update is called once per frame
    void Update()
    {
        Vector3 dir = player.transform.position - transform.position;
        if (dir.magnitude > distance)
        {
            transform.Translate(dir.normalized * (dir.magnitude - distance) * Time.deltaTime * 5f);
        }
	}
}
