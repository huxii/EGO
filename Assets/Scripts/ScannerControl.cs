using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ScannerControl : MonoBehaviour
{
    [Header("Scanner Target")]
    public GameObject scannerCamera;
    public GameObject scannerTarget;
    public GameObject nextScanner;

    [Header("Scanner Settings")]
    public float scanRange = 1f;
    public float scanEdgeWidth = 1f;
    public float scanSpeed = 0.2f;
    public float scanInnerBlur = 1f;
    public float scanOutterBlur = 1f;

    protected Material scannerMat;
    [SerializeField]
    protected List<GameObject> ppObjs;

    bool startScanner;
    float scanTimer;

    // Use this for initialization
    void Start()
    {
        startScanner = false;
        scanTimer = 0f;
        Init();
    }

    // Update is called once per frame
    void Update()
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
                            foreach (Material mat in mesh.materials)
                            {
                                mat.SetFloat("_ReplacementTimer", scanTimer * scanRange);
                            }
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
                scannerMat.SetVector("_Center", transform.position);

                foreach (GameObject o in ppObjs)
                {
                    if (Vector3.Distance(transform.position, o.transform.position) < scanRange)
                    {
                        MeshRenderer[] meshes = o.GetComponentsInChildren<MeshRenderer>();
                        foreach (MeshRenderer mesh in meshes)
                        {
                            foreach (Material mat in mesh.materials)
                            {
                                mat.SetVector("_Center", transform.position);
                            }
                        }
                    }
                }
            }
        }
    }

    void OnDestroy()
    {
        if (nextScanner)
        {
            nextScanner.SetActive(true);
            nextScanner.GetComponent<ScannerControl>().scannerTarget.SetActive(true);
            scannerTarget.SetActive(false);
        }
        scannerMat.SetFloat("_Timer", 0);
    }

    protected void Init()
    {
        CameraRenderImage camRender = scannerCamera.GetComponent<CameraRenderImage>();
        scannerMat = camRender.mat;
        scannerMat.SetFloat("_Timer", 0);
        scannerMat.SetFloat("_Range", scanRange);
        scannerMat.SetFloat("_EdgeWidth", scanEdgeWidth);
        scannerMat.SetFloat("_EdgeInnerBlur", scanInnerBlur);
        scannerMat.SetFloat("_EdgeOutterBlur", scanOutterBlur);

        ppObjs = new List<GameObject>();
        foreach (Transform child in scannerTarget.transform)
        {
            Debug.Log(child.gameObject);
            if (child.gameObject.layer == 8)
            {
                ppObjs.Add(child.gameObject);
                MeshRenderer[] meshes = child.gameObject.GetComponentsInChildren<MeshRenderer>();
                foreach (MeshRenderer mesh in meshes)
                {
                    foreach (Material mat in mesh.materials)
                    {
                        mat.SetFloat("_ReplacementTimer", 0);
                    }
                }
            }
        }
    }
}
