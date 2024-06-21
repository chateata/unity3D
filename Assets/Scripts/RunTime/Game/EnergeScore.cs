using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class EnergeScore : MonoBehaviour
{
    public Text ui;
    public static int score=0;
    // public float floatSpeed = 0.1f;
    // public float floatHeight = 0.1f;
    // private Vector3 startPos;
    // Start is called before the first frame update
    void Start()
    {
        //  startPos = transform.position;       
    }

    // Update is called once per frame
    void Update()
    {
        //float newY = startPos.y + Mathf.Sin(Time.time * floatSpeed) * floatHeight;
        // float newY = startPos.y + Mathf.Sin(Time.time * floatSpeed) * floatHeight/3;
        // transform.position = new Vector3(transform.position.x, newY, transform.position.z);
        transform.Rotate(0,1,0);
    }
    private void OnTriggerEnter(Collider other)
    {
        if(this.tag=="PickUp"){
            score++;
            ui.text="score:"+score;
            Destroy(this.gameObject);
        }
    }
}
