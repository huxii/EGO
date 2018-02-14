using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CameraControl : MonoBehaviour
{
    const float PI = 3.1415926f;

    public Transform targetTransform;
    public float distance = 3f;
    public float angleX = 45;
    public float angleRangeX = 30f;
    public float angleSensitivityX = 1000f;
    public float angleY = 45f;
    public float angleRangeY = 30f;
    public float angleSensitivityY = 100f;

    public bool movable = true;
    public bool rotatable = true;
    public bool zoomable = true;

    float dAngleX;
    float dAngleY;

	// Use this for initialization
	void Start ()
    {
        transform.eulerAngles = new Vector3(angleY, 0, 0);
        dAngleX = 0;
        dAngleY = 0;
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
        float curAngleX = angleX + dAngleX;
        float curAngleY = angleY + dAngleY;
        float height = distance * Mathf.Sin(curAngleY / 180f * PI);
        float radius = distance * Mathf.Cos(curAngleY / 180f * PI);
        float dx = radius * Mathf.Cos(curAngleX / 180f * PI);
        float dz = radius * Mathf.Sin(curAngleX / 180f * PI);

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
            dAngleX -= Input.GetAxis("Mouse X") * Time.deltaTime * angleSensitivityX;
            dAngleY -= Input.GetAxis("Mouse Y") * Time.deltaTime * angleSensitivityY;
        }
        dAngleX -= Input.GetAxis("RightJoystick X") * Time.deltaTime * angleSensitivityX;
        dAngleY -= Input.GetAxis("RightJoystick Y") * Time.deltaTime * angleSensitivityY;

        dAngleX = Clamp(dAngleX, -angleRangeX, angleRangeX);
        dAngleY = Clamp(dAngleY, -angleRangeY, angleRangeY);

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

    float Clamp(float value, float minValue, float maxValue)
    {
        if (value > maxValue)
        {
            value = maxValue;
        }

        if (value < minValue)
        {
            value = minValue;
        }

        return value;
    }
}
