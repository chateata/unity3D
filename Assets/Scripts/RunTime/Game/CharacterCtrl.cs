using System.Collections;

using System.Collections.Generic;

using UnityEngine;

using UnityEngine.SceneManagement;

  

public class CharacterCtrl : UnitySingleton<CharacterCtrl>

{

    public float turnSpeed=2;
    public float Speed=10;

    
    public float maxXPosition = 1f;
    public float minXPosition = -1f;
    public float xMoveIncrement = 1f;


    [SerializeField] float jumpSpeed=2;
    [SerializeField] float jumpHeight=5;
    [SerializeField] float fallSpeed=10;
    [SerializeField] float jumpTarget=0; 


    private float currentXPosition = 0f;
    private bool isMovingLeft = false;
    private bool isMovingRight = false;

    void Start()
    {
    }

    void Update()
    {

        if (Input.GetKeyDown(KeyCode.R))
        {

            SceneManager.LoadScene(0);
            Time.timeScale=1;
            return;
         }

  
        HandleHorizontalMovement();
        
        jump();

    }
    void HandleHorizontalMovement()
    {
        float z=Input.GetAxis("Horizontal");
        transform.Translate(Speed*Time.deltaTime,0,-z*turnSpeed*Time.deltaTime);

    }
    void jump()
    {

        if(Input.GetKeyDown(KeyCode.Space))
        {
            jumpTarget=jumpHeight;
        }

        if(jumpTarget>0)
        {
            transform.Translate(Vector3.up * jumpSpeed * Time.deltaTime);
            if(transform.position.y>=jumpTarget){
                jumpTarget=0;
            }
        }else if(transform.position.y>0)
        {
            transform.Translate(Vector3.down * fallSpeed * Time.deltaTime);
            if(transform.position.y<0){
                Vector3 newPos=transform.position;
                newPos.y=0;
                transform.position=newPos;
            }
        }
    }
}