using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightballBehavior : InteractableControl
{
    [Header("LightballBehavior")]
    public float freq = 0.3f;
    public float scale = 5.0f;
    public float lifespan = 1.0f;
    public float fleeDistance = 4.0f;
    float xOrg, yOrg, zOrg;
    Vector3 position;
    Vector3 fleePosition;
    float timer;
    float fadeOutSpeed;
    float opacity = 1.0f;
    bool fadeOutTrigger = false;
    Color color;
	// Use this for initialization
	void Start (){
        transform.localScale = transform.localScale * Random.Range(0.8f, 1.2f);

        xOrg = Random.Range(-1.0f, 1.0f);
        yOrg = Random.Range(-1.0f, 1.0f);
        zOrg = Random.Range(-1.0f, 1.0f);
        position = new Vector3(transform.position.x+Random.Range(-scale*0.2f,scale* 0.2f),
                               transform.position.y+Random.Range(-scale* 0.2f, scale* 0.2f),
                               transform.position.z+Random.Range(-scale* 0.2f, scale* 0.2f));
        fadeOutSpeed = 1.0f / lifespan;
        color = GetComponent<Renderer>().material.color;
	}
	
	// Update is called once per frame
	void Update (){
        if(fadeOutTrigger){
            FadeOut();
        }else{
            timer += Time.deltaTime;
            float x = Mathf.PerlinNoise(xOrg + timer * freq, 0) - 0.5f;
            float y = Mathf.PerlinNoise(yOrg + timer * freq, 0) - 0.5f;
            float z = Mathf.PerlinNoise(zOrg + timer * freq, 0) - 0.5f;
            Vector3 offset = new Vector3(x, y, z);
            transform.position = position + offset * scale;
        }
	}

    void FadeOut(){
        color.a -= fadeOutSpeed * Time.deltaTime;
        if(color.a>0){
            GetComponent<Renderer>().material.SetColor("_Color", color);
            Flee();
        }else{
            gameObject.SetActive(false);
        }
       
    }

    void Flee(){
        transform.position = Vector3.Lerp(transform.position, fleePosition, 0.1f);
    }

    void OnTriggerEnter(Collider other) {
        if (other.gameObject.CompareTag("Player")) {
            BeginInteraction();
        }
    }
    public override void BeginInteraction()
    {
        fadeOutTrigger = true;
        Vector3 dir = transform.position - GameObject.FindWithTag("Player").transform.position;
        dir.Normalize();
        fleePosition = transform.position + dir * fleeDistance;
    }
}
