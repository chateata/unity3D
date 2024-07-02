using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Crush : MonoBehaviour
{
    
    void Start()
    {
        
    }

   
    private void OnTriggerEnter(Collider other)
    {
        if(other.name=="Vehicle"){
            Time.timeScale=0;
        }
        
    }

    private void OnParticleCollision(GameObject other)
    {
        Debug.Log("碰撞到了"+ other.name);
        if (other.name == "Vehicle")
        {
            Time.timeScale=0;
        }
    }
}
