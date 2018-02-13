using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CameraControl : MonoBehaviour
{
    const float PI = 3.1415926f;

    public Transform targetTransform;
    public float distance = 3f;
    public float viewAngle = 45f;
    public float rotationSen = 10f;
    public float rotationAngle = 45;

    public bool movable = true;
    public bool rotatable = true;
    public bool zoomable = true;

	// Use this for initialization
	void Start ()
    {
        transform.eulerAngles = new Vector3(viewAngle, 0, 0);
        PositionUpdate();
        RotationUpdate();
    }

    // Update is called once per frame
    void Update()
    {
        if (movable)
        {
            PositionUpdate();
        }
        if (rotatable)
        {
            RotationUpdate();
        }
        if (zoomable)
        {
            ZoomUpdate();
        }
    }

    void PositionUpdate()
    {
        float height = distance * Mathf.Sin(viewAngle / 180f * PI);
        float radius = distance * Mathf.Cos(viewAngle / 180f * PI);
        float dx = radius * Mathf.Cos(rotationAngle / 180f * PI);
        float dz = radius * Mathf.Sin(rotationAngle / 180f * PI);

        float x = targetTransform.position.x + dx;
        float z = targetTransform.position.z + dz;
        float y = height;

        //transform.DOMove(new Vector3(x, y, z), Time.deltaTime);
        transform.position = new Vector3(x, y, z);
    }

    void RotationUpdate()
    {
        if (Input.GetMouseButton(1))
        {
            rotationAngle -= Input.GetAxis("Mouse X") * Time.deltaTime * 50 * rotationSen;
            viewAngle -= Input.GetAxis("Mouse Y") * Time.deltaTime * 200;
        }

        //transform.RotateAround(targetTransform.position, Vector3.up, Time.deltaTime * 50);
        //transform.DOLookAt(targetTransform.position - transform.position, 0.1f);
        transform.LookAt(targetTransform);
        //transform.RotateAround(targetTransform.position, Vector3.up, Time.deltaTime);
    }

    void ZoomUpdate()
    {
        if (Input.GetAxis("Mouse ScrollWheel") > 0)
        {
            --distance;
        }

        if (Input.GetAxis("Mouse ScrollWheel") < 0)
        {
            ++distance;
        }
    }
}
