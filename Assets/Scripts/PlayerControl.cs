using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerControl : MonoBehaviour
{
    public bool frozen = false;

    [Header("Attributes")]
    public float moveSpeed = 1f;
    public float jumpSpeed = 1f;
    public float rotationSpeed = 1f;
    public float heightStandard = 4f;
    public float heightRange = 2f;

    [Header("Sounds")]
    public SoundControl.SFX skillSFX = SoundControl.SFX.NONE;
    public SoundControl.SFX failSFX = SoundControl.SFX.NONE;

    [Header("Lights")]
    public Light light;
    public float lightFalloffDistance = 10f;

    [Header("Debug")]
    //MainControl gameController;
    Camera cam;
    Rigidbody rb;
    Animator anime;

    [SerializeField]
    Vector3 targetPos;
    Vector3 targetOrien;
    float heightAxis;
    private float heightCD = 0;
    private int heightState = 0;

    GameObject triggerInteractable = null;

    // Use this for initialization
    void Start()
    {
        //gameController = GameObject.FindGameObjectWithTag("GameController").GetComponent<MainControl>();
        cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
        rb = GetComponent<Rigidbody>();
        anime = GetComponentInChildren<Animator>();
        Vector3 pos = transform.position;
        transform.position = new Vector3(pos.x, heightAxis + GetHeightOnGround(), pos.z);
    }

    // Update is called once per frame
    void Update()
    {
        if (!frozen)
        {
            MovementUpdate();
            InteractionUpdate();
        }
        else
        {
            rb.velocity = new Vector3(0, 0, 0);
        }

        anime.SetFloat("speedH", Mathf.Abs(rb.velocity.x + rb.velocity.z) - 0.01f);
        anime.SetFloat("speedV", Mathf.Abs(rb.velocity.y) - 0.1f);
    }

    void FixedUpdate()
    {
        if ((targetPos - transform.position).sqrMagnitude <= 0.01f)
        {
            transform.position = targetPos;
        }

        if (rb.velocity.magnitude > 0.1f)
        {
            Vector3 face = rb.velocity.normalized;
            face.y = 0;
            targetOrien = face;
        }
        transform.forward += Time.deltaTime * 5 * (targetOrien - transform.forward);

        float cameraDis = (Camera.main.transform.position - transform.position).magnitude;
        Debug.Log(cameraDis);
        if (cameraDis < lightFalloffDistance)
        {
            light.intensity = cameraDis / lightFalloffDistance;
        }
        else
        {
            light.intensity = 1f;
        }
    }

    void MovementUpdate()
    {
        Vector3 targetHeight = Vector3.zero;
        heightCD += Time.deltaTime;
        heightAxis = heightStandard + GetHeightOnGround();
        //Debug.Log(heightAxis + "    ");
        if (Input.GetButton("raise") && heightState != 1 && heightCD > 0.5f)
        {
            heightState = Mathf.Min(++heightState, 1);
            heightCD = 0f;
        }
        else if (Input.GetButton("low") && heightState != -1 && heightCD > 0.5f)
        {
            heightState = Mathf.Max(--heightState, -1);
            heightCD = 0f;
        }
        else
        {

        }

        Vector3 vertical = CameraForwardDirection() * Input.GetAxis("Vertical") * moveSpeed;
        Vector3 horizontal = CameraRightDirection() * Input.GetAxis("Horizontal") * moveSpeed;
        Vector3 height = new Vector3(0, (heightAxis + heightState * heightRange - transform.position.y) * jumpSpeed, 0);
        Vector3 dir = (vertical + horizontal + height);
        targetPos += dir * Time.deltaTime;

        rb.velocity = dir;
    }

    float GetHeightOnGround()
    {
        float y = heightAxis - heightStandard;
        float distance = 50f;
        RaycastHit[] hits;
        hits = Physics.RaycastAll(transform.position, -Vector3.up, 300f);
        foreach (RaycastHit hit in hits)
        {
            if (hit.collider.gameObject.CompareTag("Terrain"))
            {
                if (hit.distance < distance)
                {
                    distance = hit.distance;
                    y = hit.point.y;
                }
            }
        }
        return y;
    }

    Vector3 CameraForwardDirection()
    {
        Vector3 v = cam.transform.forward;
        v.y = 0;
        return v;
    }

    Vector3 CameraRightDirection()
    {
        Vector3 v = cam.transform.right;
        v.y = 0;
        return v;
    }

    void InteractionUpdate()
    {
        if (triggerInteractable == null)
        {
            return;
        }
        if (Input.GetButtonDown("Interact"))
        {
            if (triggerInteractable == null)
            {
                GameControl.soundController.PlayEffect(failSFX, transform.position);
            }
            else
            {
                GameControl.soundController.PlayEffect(skillSFX, transform.position);
                triggerInteractable.GetComponent<InteractableControl>().BeginInteraction();
                anime.SetTrigger("skill");

                triggerInteractable.GetComponent<InteractableControl>().EndInteraction();
                triggerInteractable = null;
            }
        }
        else
        if (Input.GetButtonDown("Exit"))
        {
            triggerInteractable.GetComponent<InteractableControl>().EndInteraction();
        }
    }

    /*
    void OnTriggerStay(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            if (other.gameObject.GetComponent<InteractableControl>().beginInteractionByButton)
            {
                if (Input.GetButtonDown("Interact"))
                {
                    other.gameObject.GetComponent<InteractableControl>().BeginInteraction();
                }
                else
                if (Input.GetButtonDown("Exit"))
                {
                    other.gameObject.GetComponent<InteractableControl>().EndInteraction();
                }
            }
        }
    }
    */

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            triggerInteractable = other.gameObject;
            other.gameObject.GetComponent<InteractableControl>().InteractionReady();
            if (!other.gameObject.GetComponent<InteractableControl>().beginInteractionByButton)
            {
                other.gameObject.GetComponent<InteractableControl>().BeginInteraction();
            }
        }
        else
        if (other.gameObject.CompareTag("ViewportSwitcher"))
        {
            other.gameObject.GetComponent<ViewportControl>().SwitchViewport();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.CompareTag("Interactable"))
        {
            //if (triggerInteractable == other.gameObject)
            {
                triggerInteractable = null;
            }

            other.gameObject.GetComponent<InteractableControl>().InteractionUnready();
            //if (!other.gameObject.GetComponent<InteractableControl>().endInteractionByButton)
            {
                other.gameObject.GetComponent<InteractableControl>().EndInteraction();
            }
        }
        else
        if (other.gameObject.CompareTag("ViewportSwitcher"))
        {
            other.gameObject.GetComponent<ViewportControl>().SwitchBackViewport();
        }
    }

    void OnCollisionExit(Collision other)
    {
        rb.velocity = Vector3.zero;
    }

    public void ResetHeight()
    {
        heightState = 0;
    }
}

