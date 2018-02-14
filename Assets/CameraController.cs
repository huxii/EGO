using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour {
    public Transform startLoc;
    public Transform zoomLoc;
    public Transform newSceneLoc;
    Transform target;

	// Use this for initialization
	void Start () {
        target = transform;
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = Vector3.Lerp(transform.position, target.position, Time.deltaTime*10);
        transform.rotation = Quaternion.Lerp(transform.rotation, target.rotation, Time.deltaTime * 10);
	}

    public  IEnumerator  ZoomDelay(){
        yield return new WaitForSeconds(1.5f);
        target = zoomLoc;
    }

    public IEnumerator NewSceneDelay(){
        yield return new WaitForSeconds(1.5f);
        target = newSceneLoc;
    }

    public IEnumerator BackToOriginDelay(){
        yield return new WaitForSeconds(1.5f);
        target = startLoc;
    }

    public void Zoom() {

        target = zoomLoc;
    }

    public void NewScene() {

        target = newSceneLoc;
    }

    public void BackToOrigin() {

        target = startLoc;
    }
}
