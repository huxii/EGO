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
        float translation = Input.GetAxis("Vertical") * moveSpeed;
        float rotation = Input.GetAxis("Horizontal") * moveSpeed;
        translation *= Time.deltaTime;
        rotation *= Time.deltaTime;
        transform.Translate(rotation, 0, translation);
        //transform.Rotate(0, rotation, 0);

        /*
        Vector3 dir = new Vector3(0, rb.velocity.y, 0);

        if (Input.GetKey(KeyCode.A))
        {
            dir += -CameraRightDirection();
        }

        if (Input.GetKey(KeyCode.D))
        {
            dir += CameraRightDirection();
        }

        if (Input.GetKey(KeyCode.S))
        {
            dir += -CameraForwardDirection();
        }

        if (Input.GetKey(KeyCode.W))
        {
            dir += CameraForwardDirection();
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (dir.y <= 0)
            {
                dir.y = 1;
            }
        }

        if (dir.y > 0 && transform.position.y >= maxHeight)
        {
            dir.y = -1;
        }

        if (dir.y < 0 && transform.position.y <= minHeight)
        {
            dir.y = 0;
        }

        rb.velocity = moveSpeed * dir.normalized;
        */
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

