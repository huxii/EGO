using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewPooledObject : MonoBehaviour {
    public static NewPooledObject current;
    public GameObject effect_player;
    public int pooledamount = 10;
    public bool WillGrow = true;
    public List<GameObject> Effects;

	// Use this for initialization
	private void Awake()
	{
        current = this;
	}
	void Start () {
        Effects = new List<GameObject>();
        for (int i = 0; i < pooledamount; i++)
        {
            GameObject eff = (GameObject)Instantiate(effect_player);
            eff.SetActive(false);
            Effects.Add(eff);
        }
	}
	

    public GameObject GetSoundEffect(){
        for (int i = 0; i < Effects.Capacity;i++){
            if (!Effects[i].activeInHierarchy)
            {
                return Effects[i];
            }
        }
        if (WillGrow)
        {
            GameObject eff = (GameObject)Instantiate(effect_player);
            Effects.Add(eff);
            return eff;
        }
        return null;
    }
	// Update is called once per frame
	void Update () {
		
	}
}
