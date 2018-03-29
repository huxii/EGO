﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour
{
    public bool frozen = false;

    [Header("Attributes")]
    public float moveSpeed = 1f;
    public float jumpSpeed = 20f;
    public float rotationSpeed = 1f;
    public float heightStandard = 4f;
    public float heightRange = 2f;
    public float heightLerpTime = 0.05f;
    private float heightTime = 0;
    private int heightState = 0;

    [Header("Debug")]
    //MainControl gameController;
    Camera cam;
    Rigidbody rb;
    [SerializeField]
    float heightAxis;

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
        if (!frozen)
        {
            //MovementUpdate();
            NewMovementUpdate();
        }
        else
        {
            rb.velocity = new Vector3(0, 0, 0);
        }
    }

    void MovementUpdate()
    {
        Vector3 height = new Vector3(0f, 0f, 0f);
        heightAxis = heightStandard + GetHeightOnGround();

        float jump = Input.GetAxis("Jump");
        if (jump > 0)
        {
            if (transform.position.y < heightAxis + heightRange)
            {
                height.y = jumpSpeed;
            }
        }
        else
        if (jump == 0)
        {
            if (Mathf.Abs(transform.position.y - heightAxis) <= 0.01f)
            {
                height.y = 0;
            }
            else
            if (transform.position.y > heightAxis)
            {
                height.y = -jumpSpeed;
            }
            else
            {
                height.y = jumpSpeed;
            }
        }
        else
        {
            if (transform.position.y > heightAxis - heightRange)
            {
                height.y = -jumpSpeed;
            }
        }

        if (jump != 0 && 
            (transform.position.y > heightAxis + heightRange || transform.position.y < heightAxis - heightRange)
            )
        {
            height.y = 0;
        }

        Vector3 vertical = CameraForwardDirection() * Input.GetAxis("Vertical") * moveSpeed;
        Vector3 horizontal = CameraRightDirection() * Input.GetAxis("Horizontal") * moveSpeed;

        Vector3 dir = (vertical + horizontal + height) * Time.deltaTime;
        //Debug.Log(dir + " " + rb.velocity);
        rb.MovePosition(transform.position + dir);
        //if(height.y == 0 && )
    }

    void NewMovementUpdate(){
        Vector3 height = Vector3.zero;
        Vector3 targetHeight = Vector3.zero;
        heightTime += Time.deltaTime;
        heightAxis = heightStandard + GetHeightOnGround();
        if (Input.GetButton("raise") && heightState != 1 && heightTime > 0.5f)
        {
            heightState = Mathf.Min(++heightState, 1);
            heightTime = 0f;
        }
        else if (Input.GetButton("low") && heightState != -1 && heightTime > 0.5f)
        {
            heightState = Mathf.Max(--heightState, -1);
            heightTime = 0f;
        }
        else {
            
        }
        targetHeight = new Vector3(transform.position.x, heightStandard + heightState * heightRange, transform.position.z);
        Vector3 vertical = CameraForwardDirection() * Input.GetAxis("Vertical") * moveSpeed;
        Vector3 horizontal = CameraRightDirection() * Input.GetAxis("Horizontal") * moveSpeed;
        
        Vector3 dir = (vertical + horizontal) * Time.deltaTime;
        rb.MovePosition(Vector3.Lerp(transform.position, targetHeight, heightLerpTime) + dir);
        //Vector3.Lerp(transform.position, targetHeight, 0.05f);
    }
    float GetHeightOnGround()
    {
        float y = heightAxis - heightStandard;
        float distance = 50f;
        RaycastHit[] hits;
        hits = Physics.RaycastAll(transform.position, -transform.up, 50f);

        foreach (RaycastHit hit in hits)
        {
            if (hit.collider.gameObject.CompareTag("Terrain"))
            {
                if (hit.distance < distance)
                {
                    distance = hit.distance;
                    y = hit.point.y;
                }
            }
        }
        //Debug.Log(y);
        return y;
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

    void OnTriggerStay(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            if (other.gameObject.GetComponent<InteractableControl>().beginInteractionByButton)
            {
                if (Input.GetButtonDown("Interact"))
                {
                    other.gameObject.GetComponent<InteractableControl>().BeginInteraction();
                }
                else
                if (Input.GetButtonDown("Exit"))
                {
                    other.gameObject.GetComponent<InteractableControl>().EndInteraction();
                }
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            if (!other.gameObject.GetComponent<InteractableControl>().beginInteractionByButton)
            {
                other.gameObject.GetComponent<InteractableControl>().BeginInteraction();
            }
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            if (!other.gameObject.GetComponent<InteractableControl>().endInteractionByButton)
            {
                other.gameObject.GetComponent<InteractableControl>().EndInteraction();
            }
        }
    }

    void OnCollisionExit(Collision other)
    {
        rb.velocity = Vector3.zero;
    }
}

