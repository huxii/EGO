using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CameraControl : MonoBehaviour
{
    const float PI = 3.1415926f;

    public GameObject targetObject;
    public float distance = 3f;
    public Vector2 angleZero = new Vector2(45f, 45f);
    public Vector2 angleRange = new Vector2(15f, 15f);
    public Vector2 angleSensitivity = new Vector2(1000f, 100f);
    public Vector2 angleSmooth = new Vector2(1f, 1f);
    public Vector2 dAngle = new Vector2(0, 0);

    public bool freeze = false;

    Vector3 curTargetPos;
    Vector2 curAngle;
    float curDistance;

    // Use this for initialization
    void Start ()
    {
        transform.eulerAngles = new Vector3(angleZero.y, 0, 0);
        curTargetPos = targetObject.transform.position;
        curAngle = angleZero;
        curDistance = distance;

        PositionUpdate();
        RotationUpdate(); 
    }

    // Update is called once per frame
    void Update()
    {
        if (targetObject && !freeze)
        {
            PositionUpdate();
            RotationUpdate();
            //ZoomUpdate();
        }
    }

    void PositionUpdate()
    {
        curTargetPos = Vector3.Lerp(curTargetPos, targetObject.transform.position, Time.deltaTime * 5f);
        curDistance = Mathf.Lerp(curDistance, distance, Time.deltaTime);

        float targetAngleX = angleZero.x + dAngle.x;
        float targetAngleY = angleZero.y + dAngle.y;
        curAngle = new Vector2(
            Mathf.Lerp(curAngle.x, targetAngleX, Time.deltaTime * angleSmooth.x),
            Mathf.Lerp(curAngle.y, targetAngleY, Time.deltaTime * angleSmooth.y)
            );
        float height = curDistance * Mathf.Sin(curAngle.y / 180f * PI);
        float radius = curDistance * Mathf.Cos(curAngle.y / 180f * PI);
        float dx = radius * Mathf.Cos(curAngle.x / 180f * PI);
        float dz = radius * Mathf.Sin(curAngle.x / 180f * PI);

        float x = curTargetPos.x + dx;
        float z = curTargetPos.z + dz;
        float y = curTargetPos.y + height;

        transform.position = new Vector3(x, y, z);
    }

    void RotationUpdate()
    {
        float dAngleX = dAngle.x;
        float dAngleY = dAngle.y;
        //if (Input.GetMouseButton(1))
        {
            dAngleX -= Input.GetAxis("Mouse X") * Time.deltaTime * angleSensitivity.x;
            dAngleY -= Input.GetAxis("Mouse Y") * Time.deltaTime * angleSensitivity.y;
        }
        dAngleX -= Input.GetAxis("RightJoystick X") * Time.deltaTime * angleSensitivity.x;
        dAngleY -= Input.GetAxis("RightJoystick Y") * Time.deltaTime * angleSensitivity.y;

        dAngleX = Clamp(dAngleX, -angleRange.x, angleRange.x);
        dAngleY = Clamp(dAngleY, -angleRange.y, angleRange.y);

        dAngle = new Vector2(dAngleX, dAngleY);

        transform.LookAt(curTargetPos);
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
