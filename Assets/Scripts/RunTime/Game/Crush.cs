using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Crush : MonoBehaviour
{
    SoundManager soundManager;
    private GameObject HitParticles = null;
    private GameObject HitParticlesPrefab = null;

    private CharacterCtrl player;
    
    void Start()
    {
        player = FindObjectOfType<CharacterCtrl>();
        soundManager=GameObject.FindGameObjectWithTag("Audio").GetComponent<SoundManager>();
        HitParticlesPrefab = Resources.Load<GameObject>("Effects/Matthew Guz/Hits Effects FREE/Prefab/Basic Hit 2");
    }

    private void GetHit(Vector3 pos)
    {
        if(HitParticles == null)
        {
            player.speed = 0;
            pos.z = 0;
            HitParticles = Instantiate(HitParticlesPrefab, pos, Quaternion.identity);
            HitParticles.name = "HitParticles" ;
            HitParticles.transform.SetParent(player.transform,false);
            HitParticles.transform.localScale = Vector3.one * 15f;
            ParticleSystem hitParticles = HitParticles.GetComponent<ParticleSystem>();
            
            if (hitParticles != null)
            {
                hitParticles.Play();
                StartCoroutine(WaitForParticlesAndDestroy(hitParticles));
            }
        }

        
        
        
    }

    private System.Collections.IEnumerator WaitForParticlesAndDestroy(ParticleSystem hitParticles)
    {
        
        while(hitParticles.isPlaying)
        {
            yield return null;
        }
        Destroy(hitParticles);
        Debug.Log("撞到了");
        Time.timeScale=0;
    }

    private void OnTriggerEnter(Collider other)
    {
        // Debug.Log("OnTriggerEnter:碰撞到了"+ other.name);

        if(other.tag=="Obstacle"){
            soundManager.PlaySfx(soundManager.death);
            GameObject collidedObject = other.gameObject;
            Vector3 collisionPosition = other.ClosestPoint(transform.position);
            // Debug.Log("Collided with " + collidedObject.name + " at position: " + collisionPosition);
            GetHit(collisionPosition);
        }
        
    }
    private void OnParticleCollision(GameObject other)
    {
        // Debug.Log("OnParticleCollision:碰撞到了"+ other.name);
        if (other.name == "Slash")
        {
           
        }

        if (other.name == "Vehicle")
        {
            Vector3 collisionPosition = other.transform.position;
            // Debug.Log("Collided with " + other.name + " at position: " + collisionPosition);
            GetHit(collisionPosition);
        }

        
    }
}
