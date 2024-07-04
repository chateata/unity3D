using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour
{
    [SerializeField] AudioSource GameAudio;
    [SerializeField] AudioSource SfxAudio;

    public AudioClip gameAudio;
    public AudioClip dash;
    public AudioClip pickUp; 
    public AudioClip death;    
    public AudioClip attack;
    public AudioClip button;


    private void Start()
    {
        GameAudio.clip=gameAudio;
        GameAudio.Play();
    }
    public void PlaySfx(AudioClip clip)
    {
        SfxAudio.PlayOneShot(clip);
    }
}
