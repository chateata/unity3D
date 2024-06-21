using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class EnemyAI : MonoBehaviour
{
  
    public float playerSpeed = 10f;
    public float followSpeed = 18f;

    public float attackRange = 6f;
    public float zdistance = 0f;
    
 
    private bool isAttacking = false;
    private float attackTimer = 0f;
    private float attackTime = 10f;

    public Transform playerTransform;
    private GameObject gameMgr;
    private float playerLastXpos;
    

    void Start()
    {
        playerTransform = GameObject.FindWithTag("Vehicle").transform;
        gameMgr = GameObject.FindWithTag("GameMgr");
        playerLastXpos = playerTransform.position.x;
    }

    void Update()
    {
        zdistance = Mathf.Abs(playerTransform.position.z - transform.position.z);

        FollowPlayer();
        
        //浮点误差！！
        if(zdistance <= attackRange + 0.1f )
        {
            
            isAttacking = true;
            attackTimer += Time.deltaTime;
            
            
            if( attackTimer >= attackTime )
            {
                AttackPlayer();
                attackTimer = 0f;
                isAttacking = false;
            }

        }else
        {
           Debug.Log(attackTimer);
            isAttacking = false;
            attackTimer = 0f;
            Debug.Log(attackTimer + " rest " + Time.time);
        }

        
        
        
    }

    void FollowPlayer()
    {
        
        float zSpeed = Mathf.Lerp(followSpeed,  playerSpeed, attackRange / zdistance);
        transform.Translate(Vector3.forward * zSpeed * Time.deltaTime);

        
        float targetX = playerTransform.position.x;
        transform.position = new Vector3(Mathf.Lerp(transform.position.x, targetX, Time.deltaTime * 3f), 0f, transform.position.z);
        playerLastXpos = playerTransform.position.x;

        
    }

    void AttackPlayer()
    {
        // RaycastHit hit;
        // if (Physics.Raycast(transform.position, (playerTransform.position - transform.position).normalized, out hit, attackRange))
        // {
        //     if (hit.transform.CompareTag("Vehicle"))
        //     {
        //         // gameMgr.GetComponent<GameMgr>().GameOver();
        //         Debug.Log("Shoot");
        //     }
        // }

        Debug.Log("Enemy attacked the player!");
    }
}
