using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoAudio : MonoBehaviour
{
    [SerializeField] AudioSource Go_Audio;
    public AudioClip goAudio;
    private void Start(){
        Go_Audio.clip=goAudio;
        Go_Audio.Play();
    }
}
