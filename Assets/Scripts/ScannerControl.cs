using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerControl : MonoBehaviour
{
    public GameObject scannerCamera;
    public float scanRange = 1f;
    public float scanSpeed = 0.2f;

    Material scannerMat;
    List<GameObject> ppObjs;
    [SerializeField]
    bool startScanner;
    [SerializeField]
    float scanTimer;

    // Use this for initialization
    void Start ()
    {
        startScanner = false;
        scanTimer = 0f;
        
        CameraRenderImage camRender = scannerCamera.GetComponent<CameraRenderImage>();
        scannerMat = camRender.mat;
        scannerMat.SetFloat("_Timer", 0);

        ppObjs = new List<GameObject>();
        var allGameObjects = FindObjectsOfType(typeof(GameObject));
        foreach (GameObject o in allGameObjects)
        {
            if (o.layer == 8)
            {
                ppObjs.Add(o);
            }
        }
    }
	
	// Update is called once per frame
	void Update ()
    {
        if (startScanner)
        {
            if (scanTimer < 1.0f)
            {
                scanTimer += Time.deltaTime * scanSpeed;
                scannerMat.SetFloat("_Timer", scanTimer);
              
                foreach (GameObject o in ppObjs)
                {
                    if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
                    {
                        MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                        foreach (MeshRenderer mesh in meshes)
                        {
                            Material mat = mesh.material;
                            mat.SetFloat("_ReplacementTimer", scanTimer * scanRange);
                        }
                    }
                }
            }
            else
            {
                Destroy(gameObject);
            }
        }
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (!startScanner)
            {
                scannerCamera.SetActive(true);
                startScanner = true;
                scanTimer = 0;
                scannerMat.SetFloat("_Timer", 0);
                scannerMat.SetFloat("_Range", scanRange);
                scannerMat.SetVector("_Center", transform.position);

                foreach (GameObject o in ppObjs)
                {
                    if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
                    {
                        MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                        foreach (MeshRenderer mesh in meshes)
                        {
                            Material mat = mesh.material;
                            mat.SetVector("_Center", transform.position);
                        }
                    }
                }
            }
        }
    }

    void OnDestroy()
    {
        scannerMat.SetFloat("_Timer", 0);
    }
}
