using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class checkPoint : MonoBehaviour
{
    
    public void Play()
   {
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
