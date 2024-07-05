using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class Game : UnitySingleton<Game>
{
    public void InitGame() 
    {
    }

    public void EnterGame()
    {
        //正式进入游戏
        Debug.Log("EnterGame!");
        this.EnterMainMenu();
        //end
    }

    public void EnterMainMenu()
    {
        SceneManager.LoadScene("StartEditor");
    }
    
}