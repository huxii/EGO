using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightballBehavior : InteractableControl
{
    [Header("LightballBehavior")]
    public float freq = 0.3f;
    public float amp = 3;
    public float scale = 5.0f;
    public float lifespan = 1.0f;
    public float fleeForce = 4.0f;
    public GameObject targetLocation;
    float xOrg, yOrg, zOrg;
    Vector3 position;
    Vector3 fleeDir;
    float timer;
    float startTime= 0;
    float fadeOutSpeed;
    float opacity = 1.0f;
    bool fadeOutTrigger = false;
    Color color;
    Rigidbody rb;
	// Use this for initialization
	void Start (){
        rb = GetComponent<Rigidbody>();
        transform.localScale = transform.localScale * Random.Range(0.5f, 1f);

        xOrg = Random.Range(-1.0f, 1.0f);
        yOrg = Random.Range(-1.0f, 1.0f);
        zOrg = Random.Range(-1.0f, 1.0f);
        position = new Vector3(transform.position.x+Random.Range(-scale * 0.2f, scale * 0.2f),
                               transform.position.y+Random.Range(-scale * 0.2f, scale * 0.2f),
                               transform.position.z+Random.Range(-scale * 0.2f, scale * 0.2f));
        fadeOutSpeed = 1.0f / lifespan;
        color = GetComponent<Renderer>().material.color;
	}
	
	// Update is called once per frame
	void Update (){
        timer += Time.deltaTime;
        if(fadeOutTrigger){
            FadeOut();
            //float x = Mathf.PerlinNoise(xOrg + timer * freq*20, 0) - 0.5f;
            //float y = Mathf.PerlinNoise(yOrg + timer * freq*20, 0) - 0.5f;
            //float z = (-fleeDir.x * x  - fleeDir.y * y)/fleeDir.z;

            startTime += Time.deltaTime;
            Vector3 velocity = (Random.onUnitSphere-fleeDir)*amp;

            //Debug.Log(velocity.x*fleeDir.x + velocity.y*fleeDir.y + velocity.z * fleeDir.z);
            if(startTime<0.4f) rb.velocity = rb.velocity + velocity ;

            //rb.velocity = velocity;


        }else{
            float x = Mathf.PerlinNoise(xOrg + timer * freq, 0) - 0.5f;
            float y = Mathf.PerlinNoise(yOrg + timer * freq, 0) - 0.5f;
            float z = Mathf.PerlinNoise(zOrg + timer * freq, 0) - 0.5f;
            startTime = 0;
            Vector3 velocity = new Vector3(x, y, z) * amp;
            rb.velocity = velocity;
        }
	}

    void FadeOut(){
        color.a -= fadeOutSpeed * Time.deltaTime;
        if(color.a>0){
            GetComponent<Renderer>().material.SetColor("_Color", color);
        }else{
            color.a = 0;
            GetComponent<Renderer>().material.SetColor("_Color", color);
        }
       
    }

    void Flee(){
        Vector3 dir =  transform.position- targetLocation.transform.position;
        dir.Normalize();
        fleeDir = dir;
        Debug.Log(dir);
        rb.AddForce(dir*fleeForce, ForceMode.Impulse);
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

    IEnumerator Destory(){
        yield return new WaitForSeconds(3f);
        Destroy(gameObject);
    }
}
