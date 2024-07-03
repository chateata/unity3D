using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class CameraCtrl : MonoBehaviour
{
    public GameObject targetObject; 
    private float followSpeed = 0f; 
    private Vector3 offset; 
    private float cameraShake = 1f;

    public CharacterCtrl player;
    void Start()
    {
        targetObject = GameObject.FindWithTag("Vehicle");
        player = FindObjectOfType<CharacterCtrl>();
        followSpeed = player.speed;
        offset = transform.position - targetObject.transform.position;
    }

    void LateUpdate()
    {
        followSpeed = player.speed;
        Vector3 targetPosition = targetObject.transform.position + offset;
        ShakeCamera(targetPosition);

        
    }

    void ShakeCamera(Vector3 targetPosition)
    {
        if (GameObject.FindWithTag("Hit") != null)
        {
            transform.position += new Vector3(
                Random.Range(-cameraShake, cameraShake),
                Random.Range(-cameraShake, cameraShake),
                0f
            );
            cameraShake = cameraShake / 1.1f;
 
            if (cameraShake < 0.05f)
            {
                cameraShake = 0;
            }
        }
        else 
        {
            cameraShake = 1f;
            transform.position = Vector3.Lerp(transform.position, targetPosition, followSpeed * Time.deltaTime);
        }

    }
}
