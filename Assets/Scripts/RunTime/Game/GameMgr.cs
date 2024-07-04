using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameMgr : MonoBehaviour
{
    public SelectScrollHorizon horizontalScroll;
    private int currentLevelIndex = 0;

    int[] levelScores = null;

    private void Awake()
    {
       
       
        if (horizontalScroll != null)
        {
            int num = 3;

            string[] names = new string[num];
            Texture[] textures = new Texture[num];

            string[] worldNames = new string[num];
            string[] descriptions = new string[num];
            levelScores = new int[num];
            
            for (int i = 0; i < num; i++)
            {
                names[i] = (i + 1).ToString();
                String path = "GUI/Texture2D/cover" + (i + 1) + "";
                Debug.Log(path);
                textures[i] = Resources.Load<Texture2D>(path);

              
                worldNames[i] = "Name" + (i+1).ToString();
                descriptions[i] = "description: " + (i + 1).ToString();
                levelScores[i] = -1;
            }
            Debug.Log("Start");
            horizontalScroll.SetItemsInfo(names, textures, descriptions,levelScores);
             horizontalScroll.SelectAction += (index) =>
        {
            print(index);
        };
        }

       
    }

    public void GameOver(bool win)
    {
        if(win)
        {
            SceneManager.LoadScene(0);
            // SceneManager.LoadScene("WinIntetface");
            // Time.timeScale = 1;
           
        }else{
            SceneManager.LoadScene(0);
            // SceneManager.LoadScene("FailInterface");
            // Time.timeScale = 1;
        }
        
        return;
    }
    public int GetCurrentLevelIndex()
    {
        currentLevelIndex = horizontalScroll.index;
        return currentLevelIndex;
    }

    public void StartNextLevel()
    {
       
        // 加载下一个关卡
    }

    public int GetLevelScore(int levelIndex)
    {
        return levelScores[levelIndex];
    }

    public void SetLevelScore(int levelIndex, int score)
    {
        levelScores[levelIndex] = score;
    }

    public void IncreaseLevelScore(int levelIndex, int points)
    {
        levelScores[levelIndex] += points;
    }












}
