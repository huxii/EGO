using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.Events;

public class TransitionEffectControl : MonoBehaviour
{
    public UnityEvent nextTransition;
    public GameObject targetObj;
    public float speed = 0.2f;
    public bool destroyWhenDone = false;

    [SerializeField]
    protected float timer = 0;
    protected List<Material> mats = new List<Material>();
    [SerializeField]
    protected bool isPlaying = false;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    protected void Init()
    {
        MeshRenderer[] renderers = targetObj.GetComponentsInChildren<MeshRenderer>();
        List<Material> tmpMats = new List<Material>();
        foreach (MeshRenderer mr in renderers)
        {
            foreach (Material m in mr.materials)
                tmpMats.Add(m);
        }

        mats = tmpMats.Distinct().ToList();
    }

    protected void Done()
    {
        isPlaying = false;
        if (destroyWhenDone)
        {
            Destroy(gameObject);
        }

        nextTransition.Invoke();

        if (gameObject.GetComponent<InteractableControl>())
        {
            gameObject.GetComponent<InteractableControl>().EndInteraction();
        }
    }

    public void Pause()
    {
        isPlaying = false;
    }

    public virtual void Play()
    {
        isPlaying = true;
        gameObject.SetActive(true);
    }

    public virtual void Play(GameObject camera)
    {
        isPlaying = true;
        gameObject.SetActive(true);
    }
}
