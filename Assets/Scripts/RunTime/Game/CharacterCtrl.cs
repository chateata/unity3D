using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

  

public class CharacterCtrl : UnitySingleton<CharacterCtrl>

{
    private Vector3 startPosition;

    public float moveDistance = 1f; 
    private float currentPosition; 
    private bool isMoving = false; 

    public float speed = 10f;

   

    [SerializeField] float jumpSpeed=2;
    [SerializeField] float jumpHeight=5;
    [SerializeField] float fallSpeed=10;
    [SerializeField] float jumpTarget=0; 

    void Start()
    {
        startPosition = transform.position;
    }

    void Update()
    {

        if (Input.GetKeyDown(KeyCode.R))
        {
            SceneManager.LoadScene(3);
            Time.timeScale = 1;
            return;
         }
  
        Move();
        jump();

        transform.Translate(transform.forward * speed * Time.deltaTime);
    }
    void Move() 
    {
 
        float horizontalInput = Input.GetAxis("Horizontal");

        if (horizontalInput != 0 && !isMoving)
        {
            float targetPosition;
            if (horizontalInput < 0)
            {
                targetPosition = transform.position.x + moveDistance;
            }
            else
            {
                targetPosition = transform.position.x - moveDistance;
            }

            targetPosition = Mathf.Clamp(targetPosition, -1f, 1f);

            if (targetPosition >= -1 && targetPosition <= 1)
                StartCoroutine(MoveToPosition(targetPosition));
        }

    }
    

    private IEnumerator MoveToPosition(float targetPosition)
    {
        isMoving = true;
        float startPosition = transform.position.x;
        float elapsedTime = 0f;
        float moveDuration = 0.2f;

        while (elapsedTime < moveDuration)
        {
            currentPosition = Mathf.Lerp(startPosition, targetPosition, elapsedTime / moveDuration);
            transform.position = new Vector3(currentPosition, transform.position.y, transform.position.z);

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transform.position = new Vector3(targetPosition, transform.position.y, transform.position.z);
        isMoving = false;
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