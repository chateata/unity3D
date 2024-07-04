using UnityEngine;
using UnityEngine.SceneManagement;

public class InputHandler : MonoBehaviour
{
    void Update()
    {
        // 检查是否检测到鼠标左键或触摸
        if (Input.GetMouseButtonDown(0) || Input.touchCount > 0)
        {
            // 调用返回主界面的方法
            ReturnToMainMenu();
        }
    }

    void ReturnToMainMenu()
    {
        SceneManager.LoadScene("StartEditor");
    }
}