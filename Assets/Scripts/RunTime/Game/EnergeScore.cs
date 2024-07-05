using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnergeScore : MonoBehaviour
{
    public Text ui;
    public static int score=0;
    SoundManager soundManager;
    void Start()
    {
      soundManager=GameObject.FindGameObjectWithTag("Audio").GetComponent<SoundManager>();
      score=0;
    }
    void Update()
    {
        transform.Rotate(0,1,0);
    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Vehicle"){
            soundManager.PlaySfx(soundManager.pickUp);
            score++;
            ui.text = "score:"+score;
            Destroy(this.gameObject);
        }
    }
}
