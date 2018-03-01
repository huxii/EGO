using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectControl : MonoBehaviour
{
    public bool frozen = true;
    public Vector2 angleRange = new Vector2(15f, 15f);
    public Vector2 angleSensitivity = new Vector2(1000f, 100f);
    public Vector2 angleSmooth = new Vector2(1f, 1f);
    public Vector2 dAngle = new Vector2(0, 0);

    [SerializeField]
    Vector2 angleZero;

    // Use this for initialization
    void Start ()
    {
        angleZero = new Vector2(transform.eulerAngles.x, transform.eulerAngles.y);
    }
	
	// Update is called once per frame
	void Update ()
    {
        RotationUpdate();
    }

    void RotationUpdate()
    {
        float dAngleX = dAngle.x;
        float dAngleY = dAngle.y;

        if (!frozen)
        {
            dAngleX -= Input.GetAxis("Mouse X") * Time.deltaTime * angleSensitivity.x;
            //dAngleY -= Input.GetAxis("Mouse Y") * Time.deltaTime * angleSensitivity.y;
            dAngleX -= Input.GetAxis("RightJoystick X") * Time.deltaTime * angleSensitivity.x;
            //dAngleY -= Input.GetAxis("RightJoystick Y") * Time.deltaTime * angleSensitivity.y;
        }

        dAngleX = Clamp(dAngleX, -angleRange.x, angleRange.x);
        dAngleY = Clamp(dAngleY, -angleRange.y, angleRange.y);

        dAngle = new Vector2(dAngleX, dAngleY);

        float targetAngleX = angleZero.x + dAngle.y;
        float targetAngleY = angleZero.y - dAngle.x;
        Vector3 curAngle = transform.eulerAngles;
        curAngle = new Vector3(
            Mathf.Lerp(curAngle.x, targetAngleX, Time.deltaTime * angleSmooth.x),
            Mathf.Lerp(curAngle.y, targetAngleY, Time.deltaTime * angleSmooth.y),
            curAngle.z
            );
        transform.eulerAngles = curAngle;
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
