using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PartnerBehavior : MonoBehaviour
{
    public float speed = 2f;

    GameObject player;
    Rigidbody rb;
    bool following = false;

	// Use this for initialization
	void Start ()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        rb = GetComponent<Rigidbody>();
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (following)
        {
            Vector3 dir = player.transform.position - transform.position;
            dir.y = 0;
            dir = dir.normalized;
            rb.velocity = dir * speed;
        }
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            following = true;
        }
    }
}
