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

    [Header("Fog Puzzle")]
    public Vector2 solvedAngelRange = new Vector2(90f, 100f);
    public GameObject fogCam;
    public GameObject beam;

    Vector2 angleZero;

    // Use this for initialization
    void Start ()
    {
        angleZero = new Vector2(transform.localEulerAngles.x, transform.localEulerAngles.y);
    }
	
	// Update is called once per frame
	void Update ()
    {
        RotationUpdate();
        SolvingPuzzle();
    }

    void RotationUpdate()
    {
        float dAngleX = dAngle.x;
        float dAngleY = dAngle.y;

        if (!frozen)
        {
            dAngleX += Input.GetAxis("Mouse X") * Time.deltaTime * angleSensitivity.x;
            //dAngleY -= Input.GetAxis("Mouse Y") * Time.deltaTime * angleSensitivity.y;
            dAngleX += Input.GetAxis("RightJoystick X") * Time.deltaTime * angleSensitivity.x;
            //dAngleY -= Input.GetAxis("RightJoystick Y") * Time.deltaTime * angleSensitivity.y;

            beam.GetComponent<MeshRenderer>().material.SetFloat("_MaxBlinkFactor", 1.0f);
            beam.GetComponent<MeshRenderer>().material.SetFloat("_MinBlinkFactor", 1.0f);
            beam.GetComponent<MeshRenderer>().material.SetFloat("_MaxGrowSize", 0.5f);
        }
        else
        {
            beam.GetComponent<MeshRenderer>().material.SetFloat("_MaxBlinkFactor", 0.4f);
            beam.GetComponent<MeshRenderer>().material.SetFloat("_MinBlinkFactor", 0.25f);
            beam.GetComponent<MeshRenderer>().material.SetFloat("_MaxGrowSize", 0.00f);
        }

        dAngleX = Clamp(dAngleX, 0, angleRange.x);
        dAngleY = Clamp(dAngleX, 0, angleRange.x);

        dAngle = new Vector2(dAngleX, dAngleY);

        float targetAngleX = angleZero.x;
        float targetAngleY = angleZero.y + dAngle.y;
        Vector3 curAngle = transform.localEulerAngles;
        curAngle = new Vector3(
            Mathf.Lerp(curAngle.x, targetAngleX, Time.deltaTime * angleSmooth.x),
            Mathf.Lerp(curAngle.y, targetAngleY, Time.deltaTime * angleSmooth.y),
            curAngle.z
            );
        transform.localEulerAngles = curAngle;
    }

    void SolvingPuzzle()
    {
        float y = transform.localEulerAngles.y;
        if (fogCam)
        {
            if (y >= 90f && y <= 100f)
            {
                fogCam.GetComponent<FogControl>().fogGoingAway = true;
                if (fogCam.GetComponent<FogControl>().fogGone)
                {
                    Destroy(fogCam);
                }
            }
            else
            {
                fogCam.GetComponent<FogControl>().fogGoingAway = false;
            }
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
