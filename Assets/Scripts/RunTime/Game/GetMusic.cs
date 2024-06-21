using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class GetMusic : MonoBehaviour
{
    public AudioClip collectsound;
    public Text ui;
    public int score=0;
    // Start is called before the first frame update
    void Start()
    {
        
    }
    void Update()
    {

    }
    void MusicPickup()
    {
        AudioSource.PlayClipAtPoint(collectsound,transform.position);
    }
}
