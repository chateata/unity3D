using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnergeScore : MonoBehaviour
{
    public Text ui;
    public static int score=0;
    void Start()
    {
      
    }

    void Update()
    {
        transform.Rotate(0,1,0);
    }
    private void OnTriggerEnter(Collider other)
    {
        if(this.tag == "PickUp"){
            score++;
            ui.text = "score:"+score;
            Destroy(this.gameObject);
        }
    }
}
