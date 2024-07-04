using UnityEngine;
using UnityEngine.SceneManagement;


public class SettingCtrl : MonoBehaviour
{
    private GameMgr gameMgr;

    public void Start()
    {
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
    }
    public void ReStart ()
    {
        SceneManager.LoadScene("mapEditor"+gameMgr.GetCurrentLevelIndex());
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
