using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class Game : UnitySingleton<Game>
{
    public void InitGame() 
    {
        //全局加载配置文件
        
        //end
    }

    public void EnterGame()
    {
        // var bootLoader = GameObject.Find("Canvas/BootLoader");
        // GameObject.Destroy(bootLoader);


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
