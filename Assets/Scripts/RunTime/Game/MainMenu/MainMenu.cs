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
        // �ڱ༭��ģʽ�£��˳�����ģʽ
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        // �ڹ������Ӧ���У��˳���Ϸ
        Application.Quit();
#endif
    }

}
