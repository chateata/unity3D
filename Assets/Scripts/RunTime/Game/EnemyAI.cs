using UnityEngine;

public class EnemyAI : MonoBehaviour
{
  
    public float playerSpeed = 10f;
    public float followSpeed = 18f;

    public float zdistance_player = 0f;
    public float zdistance_Obstacle = 0f;
    public float attackRange = 5.5f;

 
    private bool isAttacking = false;
    private float attackTimer = 0f;
    private float attackTime = 10f;
    private float playerLastXpos;

    public Transform playerTransform;
    public Transform EnemyTransform;
    private GameObject gameMgr;
    private GameObject chargeParticles = null;
    public GameObject attackParticles;
    public GameObject attackParticlesPrefab = null;


   
    

    void Start()
    {
        playerTransform = GameObject.FindWithTag("Vehicle").transform;

        gameMgr = GameObject.FindWithTag("GameMgr");

        playerLastXpos = playerTransform.position.x;

        chargeParticles = Resources.Load<GameObject>("Effects/Hovl Studio/Magic effects pack/Prefabs/Portals/Portal blue");
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
            
            isAttacking = true;
            attackTimer += Time.deltaTime;

            if (chargeParticles != null && !isAttacking)
            {
                Debug.Log("Charge!");
                Instantiate(chargeParticles, transform.position, Quaternion.identity);
            }
            
            if( attackTimer >= attackTime )
            {
                AttackPlayer();
                attackTimer = 0f;
                isAttacking = false;
            }

        }else
        {
        
            isAttacking = false;
            attackTimer = 0f;
        }

        if (attackParticles != null)
        {
            attackParticles.transform.position = this.EnemyTransform.position;
            attackParticles.transform.rotation = this.EnemyTransform.rotation;
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
        if (attackParticles != null)
        {
            attackParticles = Instantiate(attackParticlesPrefab, this.EnemyTransform.position, Quaternion.identity);
            attackParticles.name = "attackParticles" ;
            attackParticles.transform.SetParent(this.EnemyTransform,false);

            Debug.Log("Enemy attacked the player!");
        }else{
            Debug.Log("No attackParticles!");
        }
        
    }
}
