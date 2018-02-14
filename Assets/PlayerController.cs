using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour {
    CameraController cam;
    public Transform startLoc;
    public Transform zoomLoc;
    public Transform newSceneLoc;
    Transform target;

	// Use this for initialization
	void Start () {
        cam = Camera.main.GetComponent<CameraController>();
        target = transform;

	}
	
	// Update is called once per frame
	void Update () {


        if (Input.GetMouseButtonDown(0)) {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit)) {
                if (hit.transform != null && hit.collider.CompareTag("ZoomTarget")) {
                    StartCoroutine(cam.ZoomDelay());
                    target = zoomLoc;
                } else if (hit.transform != null && hit.collider.CompareTag("NextTarget")) {
                    StartCoroutine(cam.NewSceneDelay());
                    target = newSceneLoc;
                }
            }
        }

        transform.position = Vector3.Lerp(transform.position, target.position, Time.deltaTime * 3);
        transform.rotation = Quaternion.Lerp(transform.rotation, target.rotation, Time.deltaTime * 3);
	}

    public void BackToOrigin(){
        target = startLoc;
    }
}
