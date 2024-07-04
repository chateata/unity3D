using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class checkPoint : MonoBehaviour
{
    StartAudio startAudio;
    GameMgr gameMgr;
    public GameObject NullBox; 
    void Start(){
        startAudio = GameObject.FindGameObjectWithTag("Audio").GetComponent<StartAudio>();
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
    }
    public void Play()
   {
        startAudio.PlaySfx(startAudio.button);
        int index = gameMgr.GetCurrentLevelIndex();
        if(index <= gameMgr.levelLength - 2){
            String sceneName = "mapEditor" + index;
            Debug.Log("" + SceneManager.GetSceneByName("Boot").IsValid());
            SceneManager.LoadScene(sceneName);
        }else{
            NullBox.SetActive(true);
        }
        

       
           
        
       
     
        

   }

   public void Quit()
   {
        
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }
}
