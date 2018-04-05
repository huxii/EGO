using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPivotBehavoir : MonoBehaviour
{
    public float distance = 4f;
    public Vector3 distanceRate = new Vector3(1f, 0.5f, 1f);

    GameObject player;

    // Use this for initialization
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player");
    }

    // Update is called once per frame
    void Update()
    {
        if (CustomDistance(transform.position, player.transform.position) > distance)
        {
            transform.Translate(Time.deltaTime * 5f * (player.transform.position - transform.position));
        }
    }

    float CustomDistance(Vector3 o, Vector3 p)
    {
        Vector3 dir = p - o;
        dir = new Vector3(dir.x * distanceRate.x, dir.y * distanceRate.y, dir.z * distanceRate.z);
        return dir.magnitude;
    }
}
