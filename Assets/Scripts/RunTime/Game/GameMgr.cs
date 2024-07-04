using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;


public class GameMgr : MonoBehaviour
{
    public SelectScrollHorizon horizontalScroll;
    private static int currentLevelIndex = 0;
    public int levelLength = 3;
    static int[] levelScores = null;
    static int num;
    static string[] names;
    static Texture[] textures;

    static string[] worldNames;
    static string[] descriptions;
    static private int flag = 0;
    private void Awake()
    {
       
       
        if (horizontalScroll != null)
        {
            if(flag == 0)
            {

                flag ++;
                num = levelLength;

                names = new string[num];
                textures = new Texture[num];

                worldNames = new string[num];
                descriptions = new string[num];
                levelScores = new int[num];
            
                for (int i = 0; i < num; i++)
                {
                    worldNames[i] = (i).ToString();
                    String path = "GUI/Texture2D/cover" + (i + 1) + "";
                    Debug.Log(path);
                    textures[i] = Resources.Load<Texture2D>(path);

                
                    // worldNames[i] = "Name" + (i+1).ToString();
                    // descriptions[i] = "description: " + (i + 1).ToString();
                    levelScores[i] = -1;
                }
                names[0] = "Aventurine";
                names[1] = "ForgetName";

                descriptions[0] = "All to the Amber King";
                descriptions[1] = "I don't want to go to school";
            }
           
            Debug.Log("Start");
                horizontalScroll.SetItemsInfo(names, textures, descriptions);
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
            SceneManager.LoadScene("WinInterface");
            Time.timeScale = 1;
           
        }else{
            // SceneManager.LoadScene(0);
            SceneManager.LoadScene("FailInterface");
            Time.timeScale = 1;
        }
        
        return;
    }
    public int GetCurrentLevelIndex()
    {
        if(horizontalScroll!=null) {currentLevelIndex = horizontalScroll.index;}
        
        return currentLevelIndex;
    }



    public int GetLevelScore(int levelIndex)
    {
        return levelScores[levelIndex];
    }

    public void SetLevelScore(int levelIndex, int score)
    {
        Debug.Log("1 + levelScores[levelIndex] " + levelScores[levelIndex]);
        if(score >= levelScores[levelIndex])   
        {
            levelScores[levelIndex] = score;
            Debug.Log("2score: " + score);
            Debug.Log("3 levelScores[levelIndex]:" + levelScores[levelIndex]);
        }
    }

    












}
