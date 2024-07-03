using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartAudio : MonoBehaviour
{
    
    [SerializeField] AudioSource BeginAudio;
    [SerializeField] AudioSource coolAudio;
    public AudioClip startAudio;
    public AudioClip button;
    public AudioClip close_button;
    private void Start(){
        BeginAudio.clip=startAudio;
        BeginAudio.Play();
    }
    
    public void PlaySfx(AudioClip clip)
    {
        coolAudio.PlayOneShot(clip);
    }
}
