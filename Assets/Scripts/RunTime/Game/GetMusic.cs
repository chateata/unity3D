using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class GetMusic : MonoBehaviour
{
    public AudioClip collectsound;
    public Text ui;
    public int score=0;

    void MusicPickup()
    {
        AudioSource.PlayClipAtPoint(collectsound,transform.position);
    }
}
