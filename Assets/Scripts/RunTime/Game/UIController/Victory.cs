using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
public class Victory : MonoBehaviour
{
    public TMP_Text scoreText;
    // private int score;

    void Start()
    {
        int score = EnergeScore.score;
        UpdateScoreText(score);
    }

    void UpdateScoreText(int score)
    {
        scoreText.text = "Score: "+score.ToString();
    }
}
