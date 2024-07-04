using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartAudio : MonoBehaviour
{
    public SelectScrollHorizon horizontalScroll;
    public GameMgr gameMgr;
    [SerializeField] AudioSource BeginAudio;
    [SerializeField] AudioSource coolAudio;
    public AudioClip startAudio1;
    public AudioClip startAudio2;
    public AudioClip startAudio3;
    public AudioClip button;
    public AudioClip close_button;
    public int lastIndex;
    public AudioClip[] Music;
    public new AudioSource audio;
    public void Start(){
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
        audio = gameObject.AddComponent<AudioSource>();
        Music = new AudioClip[gameMgr.levelLength];
        Music[0]=startAudio1;
        Music[1]=startAudio2;
        Music[2]=startAudio3;
        lastIndex=0;
        PlayMusic(lastIndex);
    }
    public void Update(){
        if(horizontalScroll.index != lastIndex){
            StopMusic();
            lastIndex  = horizontalScroll.index;
            PlayMusic(lastIndex);
        }

     }
    public void PlaySfx(AudioClip clip)
    {
        coolAudio.PlayOneShot(clip);
    }
void PlayMusic(int index)
    {
        audio.clip = Music[index];
        audio.Play();
    }

    void StopMusic()
    {
        if (audio.isPlaying)
        {
            audio.Stop();
        }
    }
}
