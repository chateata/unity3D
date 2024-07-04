using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
using System;
public class Victory : MonoBehaviour
{
    public TMP_Text scoreText;
    public TMP_Text worldNameText;
    public GameMgr gameMgr;
    int currentItemIndex;
    void Start()
    {
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
        
        currentItemIndex = gameMgr.GetCurrentLevelIndex();
        int score = EnergeScore.score;

        UpdateScoreText(score);
        UpdateWordlNameText();
        SetScore(score);
    }
    
    void UpdateScoreText(int score)
    {
        if(scoreText != null)
        scoreText.text = "Score: "+ score.ToString();
    }

    void UpdateWordlNameText()
    {
        if(worldNameText != null)
        {
            string worldName = "World" + (currentItemIndex + 1).ToString();
            worldNameText.text = worldName;
        }
      
    }

    public void SetScore(int score)
    {
        if(scoreText != null)
        {
            gameMgr.SetLevelScore(currentItemIndex, score);
        }
    }
    public void Restart()
    {
        SceneManager.LoadScene("mapEditor"+currentItemIndex.ToString());
    }
    public void ReturnMenu(){
        SceneManager.LoadScene("CheckpointEditor");
    }
}
