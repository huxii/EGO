using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;
using UnityEngine.UI;
using DG.Tweening;

public class VideoControl : MonoBehaviour
{
    public GameObject targetCamera;
    public GameObject blackImage;
    public List<VideoClip> videoList;
    public enum VideoListID
    {
        LEVEL1CUTSCENE,
    };

	// Use this for initialization
	void Start ()
    {
    }
	
	// Update is called once per frame
	void Update ()
    {
		
	}

    public void Play(VideoListID id)
    {
        var videoPlayer = targetCamera.AddComponent<VideoPlayer>();
        videoPlayer.playOnAwake = false;
        videoPlayer.clip = videoList[(int)id];
        videoPlayer.aspectRatio = VideoAspectRatio.FitOutside;
        videoPlayer.Pause();

        blackImage.GetComponent<Image>().color = new Color(0, 0, 0, 0);
        blackImage.SetActive(true);
        videoPlayer.Play();
        blackImage.GetComponent<Image>().DOFade(1, 2f).OnComplete(
            () => 
            {             
                blackImage.SetActive(false);              
            }
            );      
    }
}
