using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightballBehaviorTest : InteractableControl
{
    [Header("LightballBehavior")]
    public float freq = 0.3f;
    public float amp = 3;
    public float scale = 5.0f;
    public float lifespan = 1.0f;
    public float fleeForce = 4.0f;
    public GameObject targetLocation;
    float[] xOrg = new float[6];
    float[] yOrg = new float[6];
    float[] zOrg = new float[6];
    Vector3 position;
    Vector3[] fleeDir = new Vector3[6];
    float timer;
    float startTime= 0;
    float fadeOutSpeed;
    float opacity = 1.0f;
    bool fadeOutTrigger = false;
    Vector3[] dir = new Vector3[6];
    Color[] color = new Color[6];
    Transform[] children = new Transform[6];
    Rigidbody[] rb = new Rigidbody[6];
	// Use this for initialization
	void Start (){
        for (int i = 0; i< gameObject.transform.childCount;i++){
            children[i] = gameObject.transform.GetChild(i);
            children[i].localScale *= Random.Range(0.7f, 1f);

            children[i].position = new Vector3(transform.position.x + Random.Range(-scale * 0.2f, scale * 0.2f),
                                               transform.position.y + Random.Range(-scale * 0.2f, scale * 0.2f),
                                               transform.position.z + Random.Range(-scale * 0.2f, scale * 0.2f));
            color[i] = children[i].gameObject.GetComponent<Renderer>().material.color;
            rb[i] = children[i].gameObject.GetComponent<Rigidbody>();
            xOrg[i] = Random.Range(-1.0f, 1.0f);
            yOrg[i] = Random.Range(-1.0f, 1.0f);
            zOrg[i] = Random.Range(-1.0f, 1.0f);
        }



        fadeOutSpeed = 1.0f / lifespan;
	}
	
	// Update is called once per frame
	void Update (){
        timer += Time.deltaTime;
        for (int i = 0;i<children.Length ;i++ )
        {
            if (fadeOutTrigger)
            {
                FadeOut();
                startTime += Time.deltaTime / children.Length;
                Vector3 velocity = (Random.onUnitSphere - fleeDir[i]) * amp;

                //Debug.Log(velocity.x*fleeDir.x + velocity.y*fleeDir.y + velocity.z * fleeDir.z);
                if (startTime < 0.4f) rb[i].velocity += velocity;

                //rb.velocity = velocity;


            }
            else
            {
                float x = Mathf.PerlinNoise(xOrg[i] + timer * freq, 0) - 0.5f;
                float y = Mathf.PerlinNoise(yOrg[i] + timer * freq, 0) - 0.5f;
                float z = Mathf.PerlinNoise(zOrg[i] + timer * freq, 0) - 0.5f;
                startTime = 0;
                Vector3 velocity = new Vector3(x, y, z) * amp;
                rb[i].velocity = velocity;
            }
        }
	}

    void FadeOut(){
        for (int i = 0; i < children.Length; i++) { 
            color[i].a -= fadeOutSpeed * Time.deltaTime/children.Length;
            if (color[i].a > 0) {
                children[i].gameObject.GetComponent<Renderer>().material.SetColor("_Color", color[i]);
            } else {
                color[i].a = 0;
                children[i].gameObject.GetComponent<Renderer>().material.SetColor("_Color", color[i]);
            }
        }
    }

    void Flee(){
        for (int i = 0; i < children.Length; i++)
        {
            dir[i] = children[i].position - targetLocation.transform.position;
            fleeDir[i] = dir[i].normalized;
            rb[i].AddForce(fleeDir[i] * fleeForce, ForceMode.Force);
        }
        //transform.position = Vector3.Lerp(transform.position, fleePosition, 0.1f);
    }

    void OnTriggerEnter(Collider other) {
        if (other.gameObject.CompareTag("Player")) {
            BeginInteraction();
        }
    }

    public override void BeginInteraction(){
        if(!fadeOutTrigger){
            Flee();
            StartCoroutine(Destory());
        }
        fadeOutTrigger = true;
    }

    IEnumerator Destory() {
        yield return new WaitForSeconds(3f);
        foreach (Transform t in children) {
            Destroy(t.gameObject);
        }
        Destroy(gameObject);
    }
}
