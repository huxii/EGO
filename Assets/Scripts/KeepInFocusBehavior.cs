using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.PostProcessing;

public class KeepInFocusBehavior : MonoBehaviour
{    
    // Adjustable aperture - used in animations within Timeline
    [Range(0.1f, 20f)] public float aperture;

    GameObject targetCam;
    PostProcessingProfile postProfile;

    void Start()
    {
        targetCam = GameObject.FindGameObjectWithTag("ScannerBgCamera");
        // Load the post processing profile
        postProfile = targetCam.GetComponent<PostProcessingBehaviour>().profile;
    }

    void Update()
    {
        // Get distance from camera and target
        float dist = Vector3.Distance(targetCam.transform.position, transform.position);

        // Get reference to the DoF settings
        var dof = postProfile.depthOfField.settings;

        // Set variables
        dof.focusDistance = dist;
        dof.aperture = aperture;

        // Apply settings
        postProfile.depthOfField.settings = dof;
    }
}