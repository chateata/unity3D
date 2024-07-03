using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class checkPoint : MonoBehaviour
{
    StartAudio startAudio;
    void Start(){
        startAudio=GameObject.FindGameObjectWithTag("Audio").GetComponent<StartAudio>();
    }
    public void Play()
   {
        startAudio.PlaySfx(startAudio.button);
        SceneManager.LoadScene("mapEditor");
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
