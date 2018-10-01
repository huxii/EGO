using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameEvents : MonoBehaviour
{
    char[] splitter = { ',', ' ' };
    public void Destroy(GameObject obj)
    {
        Object.Destroy(obj);
    }

    public void SwitchScene(string para)
    {
        string[] paras = para.Split(splitter, System.StringSplitOptions.RemoveEmptyEntries);
        GameObject obj0 = GameObject.Find(paras[0]);
        GameObject obj1 = Instantiate(Resources.Load(paras[1]) as GameObject);

        Object.Destroy(obj0);
    }
}
