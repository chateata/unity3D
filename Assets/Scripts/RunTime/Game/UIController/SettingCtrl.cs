using UnityEngine;
using UnityEngine.SceneManagement;


public class SettingCtrl : MonoBehaviour
{
    public void ReStart ()
    {
        SceneManager.LoadScene("mapEditor");
        Time.timeScale = 1f;
    }

    public void Con ()
    {
        Time.timeScale = 1f;
        
    }

    public void Menu ()
    {
        SceneManager.LoadScene("CheckpointEditor");
        Time.timeScale = 1f;
    }

    public void Stop ()
    {
        Time.timeScale = 0f;
    }
}
