using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Crush : MonoBehaviour
{
    private GameObject HitParticles = null;
    private GameObject HitParticlesPrefab = null;
    public Transform VehicleTransform;
    void Start()
    {
        HitParticlesPrefab = Resources.Load<GameObject>("Effects/Matthew Guz/Hits Effects FREE/Prefab/Basic Hit 2");
    }

    private void GetHit(Vector3 pos)
    {
        HitParticles = Instantiate(HitParticlesPrefab, pos, Quaternion.identity);
        HitParticles.name = "HitParticles" ;
        HitParticles.transform.SetParent(this.VehicleTransform,false);
        Time.timeScale=0;
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("OnTriggerEnter:碰撞到了"+ other.name);

        if(other.tag=="Obstacle"){
            
            GameObject collidedObject = other.gameObject;
            Vector3 collisionPosition = other.ClosestPoint(transform.position);
            Debug.Log("Collided with " + collidedObject.name + " at position: " + collisionPosition);
            GetHit(collisionPosition);
        }
        
    }

    private void OnParticleCollision(GameObject other)
    {
        Debug.Log("碰撞到了"+ other.name);
        if (other.name == "Slash")
        {
           
        }



        if (other.name == "Vehicle")
        {
            Time.timeScale=0;
        }

        
    }
}
