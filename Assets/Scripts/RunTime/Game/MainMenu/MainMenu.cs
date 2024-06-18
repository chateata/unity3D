using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class NewBehaviourScript : MonoBehaviour
{
   public void Play()
   {
    SceneManager.LoadScene("CheckPointEditor");

   }

   public void Quit()
   {
        // Application.Quit();
        // 在编辑器模式下，退出播放模式
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        // 在构建后的应用中，退出游戏
        Application.Quit();
#endif
    }

}
