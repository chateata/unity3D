using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Crush : MonoBehaviour
{
    private ImageFadeIn imageFadeIn;
    
    
    SoundManager soundManager;
    private GameObject HitParticles = null;
    private GameObject HitParticlesPrefab = null;


    private GameMgr gameMgr;

    private CharacterCtrl player;

    void Start()
    {
        player = FindObjectOfType<CharacterCtrl>();
        imageFadeIn = FindObjectOfType<ImageFadeIn>();
        soundManager = GameObject.FindGameObjectWithTag("Audio").GetComponent<SoundManager>();
        HitParticlesPrefab = Resources.Load<GameObject>("Effects/Matthew Guz/Hits Effects FREE/Prefab/Basic Hit 2");
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
    }
    void SomeFunction()
    {
        imageFadeIn.FadeInImage();
    }

    private void GetHit(Vector3 pos,bool isPlayer)
    {
        if(HitParticles == null && isPlayer)
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
                SomeFunction();
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
        gameMgr.GameOver(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        // Debug.Log("OnTriggerEnter:碰撞到了"+ other.name);
        if(other.tag=="Obstacle" && this.tag == "Vehicle"){
            soundManager.PlaySfx(soundManager.death);
            GameObject collidedObject = other.gameObject;
            Vector3 collisionPosition = other.ClosestPoint(transform.position);
            // Debug.Log("Collided with " + collidedObject.name + " at position: " + collisionPosition);
            GetHit(collisionPosition, true);
        }
        
    }
    private void OnParticleCollision(GameObject other)
    {
        // Debug.Log("OnParticleCollision:碰撞到了"+ other.name);

        if (other.tag == "Vehicle")
        {
            Vector3 collisionPosition = other.transform.position;
            // Debug.Log("Collided with " + other.name + " at position: " + collisionPosition);
            GetHit(collisionPosition,true);
        }

        
    }
}
