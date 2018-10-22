using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using DG.Tweening;

public class HUDControl : MonoBehaviour
{
    public GameObject canvas;
    public GameObject blank;
    //public List<UnityEvent> levelUIEvents;
    private int curId = 0;

    [SerializeField]
    private List<GameObject> anchors = new List<GameObject>();
    [SerializeField]
    private GameObject anchorsObj;
    [HideInInspector]
    [SerializeField]
    private int anchorCounter = 0;

    void Start()
    {
        ShowPhoto("Anchor0,WASD_normal4, 2");
        //PlayNextUIEvent();
        //PlayNextUIEvent();
    }

    private void Update()
    {
    }

    private void OnDrawGizmos()
    {
        foreach (GameObject anchor in anchors.ToArray())
        {
            if (anchor == null)
            {
                anchors.Remove(anchor);
            }
            else
            {
                //Gizmos.DrawGUITexture(new Rect(anchor.transform.position.x, anchor.transform.position.y, 1, 1), gizmoTexture);
                Gizmos.color = Color.cyan;
                Gizmos.DrawWireSphere(anchor.transform.position, 0.2f);
            }
        }
    }

    //public void PlayNextUIEvent()
    //{
    //    if (curId < levelUIEvents.Count)
    //    {
    //        levelUIEvents[curId].Invoke();
    //        ++curId;
    //    }
    //}

    private GameObject DisplayImage(string anchorImage)
    {
        string[] info = anchorImage.Split(',');
        foreach (GameObject anch in anchors)
        {
            if (anch.name == info[0])
            {
                GameObject image = new GameObject(info[1], typeof(RectTransform));
                image.transform.position = anch.transform.position;
                image.transform.SetParent(canvas.transform);
                image.AddComponent<Image>();
                Sprite outsideImage = Resources.Load<Sprite>("Sprites/" + info[1]);
                image.GetComponent<Image>().sprite = outsideImage;
                return image;
            }
        }

        return null;
    }

    public void ShowPhoto(string anchorImage)
    {
        GameObject photo = DisplayImage(anchorImage);
        photo.AddComponent<PhotoControl>();
        photo.transform.localScale = Vector3.zero;
        photo.transform.DOScale(Vector3.one, 1f);
    }

    public void ClosePhoto(GameObject obj)
    {
        obj.transform.DOScale(Vector3.zero, 1f).OnComplete(() => { Destroy(obj); });
    }

    public void AddAnchor()
    {
        if (anchorsObj == null)
        {
            anchorsObj = new GameObject("Anchors", typeof(RectTransform));
            anchorsObj.transform.SetParent(canvas.transform);
            anchorsObj.transform.localPosition = Vector3.zero;
        }

        GameObject anchor = new GameObject("Anchor" + anchorCounter, typeof(RectTransform));
        anchor.transform.SetParent(anchorsObj.transform);
        anchor.transform.localPosition = Vector3.zero;
        ++anchorCounter;

        anchors.Add(anchor);
    }

    public void FadeIn(float time = 2f)
    {
        Color col = blank.GetComponent<Image>().color;
        blank.GetComponent<Image>().color = new Color(col.r, col.g, col.b, 0);
        blank.GetComponent<Image>().DOFade(1f, time);
    }

    public void FadeOut(float time = 2f)
    {
        Color col = blank.GetComponent<Image>().color;
        blank.GetComponent<Image>().color = new Color(col.r, col.g, col.b, 1);
        blank.GetComponent<Image>().DOFade(0f, time);
    }
}

