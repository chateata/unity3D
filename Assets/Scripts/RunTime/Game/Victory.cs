using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
public class VictoryUI : MonoBehaviour
{
    public TMP_Text scoreText;
    // private int score;

    void Start()
    {
        int score = EnergeScore.score;
        SetScoreText(score);
    }

    public void SetScoreText(int score)
    {
        scoreText.text = "Score: "+score;
    }
}
