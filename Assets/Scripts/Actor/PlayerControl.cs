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

    //[Header("Trigger Sound")]
    //public List<SoundSettings> triggerSoundList;
    //SoundSettings skill1SFX;
    //SoundSettings skill2SFX;
    //SoundSettings failSFX;

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
    Vector3 prePos;
    Vector3 targetOrien;
    float heightAxis;
    private float heightCD = 0;
    private int heightState = 0;

    GameObject triggerInteractable = null;

    // Use this for initialization
    void Start()
    {
        cam = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>();
        rb = GetComponent<Rigidbody>();
        anime = GetComponentInChildren<Animator>();

        Vector3 pos = transform.position;
        transform.position = new Vector3(pos.x, heightAxis + GetHeightOnGround(), pos.z);
        prePos = transform.position;


        //skill1SFX = triggerSoundList[1];
        //skill2SFX = triggerSoundList[2];
        //failSFX = triggerSoundList[0];
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

        Vector3 delta = transform.position - prePos;
        prePos = transform.position;

        //Debug.Log(delta);
        anime.SetFloat("speedH", Mathf.Abs(delta.x + delta.z) - 0.001f);
        anime.SetFloat("speedV", Mathf.Max(Mathf.Abs(delta.y) - 0.001f, 0) * Mathf.Sign(delta.y));
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

        float cameraDis = (GameControl.cameraController.gameObject.transform.position - transform.position).magnitude;
        if (cameraDis < lightFalloffDistance)
        {
            light.intensity = 0.7f * cameraDis / lightFalloffDistance;
        }
        else
        {
            light.intensity = 0.7f;
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
            anime.SetTrigger("Up");
        }
        else if (Input.GetButton("low") && heightState != -1 && heightCD > 0.5f)
        {
            heightState = Mathf.Max(--heightState, -1);
            heightCD = 0f;
            anime.SetTrigger("Down");
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
            triggerInteractable.GetComponent<InteractableControl>().BeginInteraction();
    //        if (triggerInteractable == null)
    //        {
				//Debug.Log (failSFX.id);
				//GameControl.soundController.Play(failSFX);
    //            //GameControl.soundController.PlayEffect(failSFX, transform.position);
    //        }
    //        else
    //        {
				//Debug.Log (failSFX.id);
				//GameControl.soundController.Play(skill1SFX);
    //            //GameControl.soundController.PlayEffect(skillSFX, transform.position);
    //            triggerInteractable.GetComponent<InteractableControl>().BeginInteraction();
    //            anime.SetTrigger("skill");

    //            //triggerInteractable.GetComponent<InteractableControl>().EndInteraction();
    //            //triggerInteractable = null;
    //        }
        }
        else
        if (Input.GetButtonDown("Exit"))
        {
            triggerInteractable.GetComponent<InteractableControl>().EndInteraction();
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.GetComponent<ActorControl>())
        {
            if (other.gameObject.GetComponent<InteractableControl>())
            {
                triggerInteractable = other.gameObject;
            }
            other.gameObject.GetComponent<ActorControl>().EnterCollider();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.GetComponent<ActorControl>())
        {
            if (triggerInteractable == other.gameObject)
            {
                triggerInteractable = null;
            }
            other.gameObject.GetComponent<ActorControl>().ExitCollider();
        }

        //if (other.gameObject.CompareTag("Interactable"))
        //{
        //    //if (triggerInteractable == other.gameObject)
        //    {
        //        triggerInteractable = null;
        //    }

        //    other.gameObject.GetComponent<InteractableControl>().InteractionUnready();
        //    //if (!other.gameObject.GetComponent<InteractableControl>().endInteractionByButton)
        //    {
        //        other.gameObject.GetComponent<InteractableControl>().EndInteraction();
        //    }
        //}
    }

    void OnTriggerStay(Collider other)
    {
        
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

