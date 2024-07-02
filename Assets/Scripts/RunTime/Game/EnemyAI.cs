using UnityEngine;

public class EnemyAI : MonoBehaviour
{
  
    public float playerSpeed = 10f;
    public float followSpeed = 18f;

    public float zdistance_player = 0f;
    public float zdistance_Obstacle = 0f;
    public float attackRange = 5f;

 
    private bool isAttacking = false;
    private float chargeTimer = 0f;
    private float chargeTime = 10f;
    private float attackTimer = 0f;
    private float attackTime = 2f;
    private float playerLastXpos;

    public Transform playerTransform;
    public Transform EnemyTransform;
    private GameObject gameMgr;
    private GameObject chargeParticles = null;
    private GameObject attackParticles = null;
    private GameObject chargeParticlesPrefab = null;
    private GameObject attackParticlesPrefab = null;
 

   
    

    void Start()
    {
        playerTransform = GameObject.FindWithTag("Vehicle").transform;

        gameMgr = GameObject.FindWithTag("GameMgr");

        playerLastXpos = playerTransform.position.x;

        chargeParticlesPrefab = Resources.Load<GameObject>("Effects/Hovl Studio/Magic effects pack/Prefabs/Portals/Portal blue");
        attackParticlesPrefab = Resources.Load<GameObject>("Effects/Hovl Studio/Magic effects pack/Prefabs/Slash effects/Charge slash purple");
        
       
    }


    void Update()
    {
        zdistance_player = Mathf.Abs(playerTransform.position.z - transform.position.z);


        float zSpeed = Mathf.Lerp(followSpeed, playerSpeed, attackRange / zdistance_player);
        transform.Translate(Vector3.forward * zSpeed * Time.deltaTime);
      
        FollowPlayer();
       
        if(zdistance_player <= attackRange + 0.1f )
        {
            if (!isAttacking)
            {
                if (chargeParticlesPrefab != null)
                {
                    chargeParticles = Instantiate(chargeParticlesPrefab, this.EnemyTransform.position, Quaternion.identity);
                    chargeParticles.name = "chargeParticles" ;
                    chargeParticles.transform.SetParent(this.EnemyTransform,false);
                    chargeParticles.transform.localScale = new Vector3(6f, 6f, 6f);
                    Debug.Log("Enemy is charging.");
                }else{
                    Debug.Log("No chargeParticles!");
                }
            }
            
            isAttacking = true;
            chargeTimer += Time.deltaTime;
            
            
            if( chargeTimer >= chargeTime )
            {
                attackTimer += Time.deltaTime;
                Destroy(chargeParticles);
                if (attackParticles == null)
                {
                    AttackPlayer();
                 
                }

                if (attackTimer >= attackTime)
                {
                    Destroy(attackParticles);
                    
                    attackTimer = 0f;
                    chargeTimer = 0f;
                    isAttacking = false;
                }
            }

        }else
        {
            
            isAttacking = false;
            chargeTimer = 0f;
        }

       FollowEnemy(attackParticles);
       FollowEnemy(chargeParticles);

    }

    void FollowEnemy (GameObject gameObject)
    {
         if (gameObject != null)
        {
            Vector3 pos= new Vector3(this.EnemyTransform.position.x, this.EnemyTransform.position.y+0.6f, this.EnemyTransform.position.z - 1);
            gameObject.transform.position = pos;

        }
    }

    void FollowPlayer()
    {
        float targetX = playerTransform.position.x;
        transform.position = new UnityEngine.Vector3(Mathf.Lerp(transform.position.x, targetX, Time.deltaTime * 3f), 0f, transform.position.z);
        playerLastXpos = playerTransform.position.x;
        
        
    }

    void AttackPlayer()
    {
        if (attackParticlesPrefab != null)
        {
            attackParticles = Instantiate(attackParticlesPrefab, this.EnemyTransform.position, Quaternion.identity);
            attackParticles.name = "attackParticles" ;
            attackParticles.transform.SetParent(this.EnemyTransform,false);
            attackParticles.transform.Rotate(Vector3.forward * 90f);
            Debug.Log("Enemy attacked the player!");
        }else{
            Debug.Log("No attackParticles!");
        }
        
    }
}
