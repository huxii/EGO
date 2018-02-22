using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour
{
    public bool frozen = false;

    [Header("Attributes")]
    public float moveSpeed = 1f;
    public float jumpSpeed = 1f;
    public float rotationSpeed = 1f;
    public float heightAxis = 4f;
    public float heightRange = 2f;

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
        transform.position = new Vector3(pos.x, heightAxis, pos.z);
    }

    // Update is called once per frame
    void Update()
    {
        /*
        if (transform.position.y > heightAxis)
        {
            rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y - 0.2f, rb.velocity.z);
        }
        else
        if (transform.position.y < heightAxis)
        {
            rb.velocity = new Vector3(rb.velocity.x, rb.velocity.y + 0.2f, rb.velocity.z);
        }
        */
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
        float jump = Input.GetAxis("Jump");
        if (jump > 0)
        {
            if (transform.position.y < heightAxis + heightRange)
            {
                rb.velocity = new Vector3(rb.velocity.x, jumpSpeed, rb.velocity.z);
            }
        }
        else
        if (jump == 0)
        {
            if (Mathf.Abs(transform.position.y - heightAxis) <= 0.01f)
            {
                rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
            }
            else
            if (transform.position.y > heightAxis)
            {
                rb.velocity = new Vector3(rb.velocity.x, -jumpSpeed, rb.velocity.z);
            }
            else
            {
                rb.velocity = new Vector3(rb.velocity.x, jumpSpeed, rb.velocity.z);
            }
        }
        else
        {
            if (transform.position.y > heightAxis - heightRange)
            {
                rb.velocity = new Vector3(rb.velocity.x, -jumpSpeed, rb.velocity.z);
            }
        }

        if (jump != 0 && 
            (transform.position.y > heightAxis + heightRange || transform.position.y < heightAxis - heightRange)
            )
        {
            rb.velocity = new Vector3(rb.velocity.x, 0, rb.velocity.z);
        }

        Vector3 vertical = CameraForwardDirection() * Input.GetAxis("Vertical") * moveSpeed;
        Vector3 horizontal = CameraRightDirection() * Input.GetAxis("Horizontal") * moveSpeed;
        Vector3 height = new Vector3(0, rb.velocity.y, 0);

        Vector3 dir = (vertical + horizontal + height) * Time.deltaTime;
        transform.Translate(dir);
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

