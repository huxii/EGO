using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour
{
    public bool frozen = false;

    [Header("Attributes")]
    public float moveSpeed = 1f;
    public float rotationSpeed = 1f;
    public float minHeight = 1f;
    public float maxHeight = 2f;

    [Header("Debug")]
    //MainControl gameController;
    Camera cam;
    Rigidbody rb;

    // Use this for initialization
    void Start()
    {
        //gameController = GameObject.FindGameObjectWithTag("GameController").GetComponent<MainControl>();
        cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
        rb = GetComponent<Rigidbody>();
        Vector3 pos = transform.position;
        transform.position = new Vector3(pos.x, minHeight, pos.z);
    }

    // Update is called once per frame
    void Update()
    {
        if (!frozen)
        {
            MovementUpdate();
        }
        else
        {
            rb.velocity = new Vector3(0, 0, 0);
        }
    }

    void MovementUpdate()
    {
        Vector3 vertical = CameraForwardDirection() * Input.GetAxis("Vertical") * moveSpeed;
        Vector3 horizontal = CameraRightDirection() * Input.GetAxis("Horizontal") * moveSpeed;
        Vector3 dir = (vertical + horizontal) * Time.deltaTime;
        transform.Translate(dir.x, 0, dir.z);
    }

    Vector3 CameraForwardDirection()
    {
        Vector3 v = cam.transform.forward;
        v.y = 0;
        return v;
    }

    Vector3 CameraRightDirection()
    {
        Vector3 v = cam.transform.right;
        v.y = 0;
        return v;
    }
}

