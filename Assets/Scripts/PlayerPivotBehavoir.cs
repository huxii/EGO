using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPivotBehavoir : MonoBehaviour
{
    public Vector2 screenLimit = new Vector2(2f, 1f);

    GameObject player;
    Vector3 targetPos;

    // Use this for initialization
    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        targetPos = player.transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 playerScreenPos = Camera.main.WorldToScreenPoint(player.transform.position);
        Vector3 pivotScreenPos = Camera.main.WorldToScreenPoint(transform.position);
        if (Mathf.Abs(playerScreenPos.x - pivotScreenPos.x) > screenLimit.x
            || Mathf.Abs(playerScreenPos.y - pivotScreenPos.y) > screenLimit.y)
        {
            targetPos = player.transform.position;
        }

        Vector3 dir = targetPos - transform.position;
        if (dir.magnitude < 0.01f)
        {
            transform.position = targetPos;
        }
        else
        {
            transform.Translate(dir.normalized * Time.deltaTime * 5f);
        }
    }
}
