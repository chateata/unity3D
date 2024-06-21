using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraCtrl : MonoBehaviour
{
    public GameObject targetObject; 
    public float followSpeed = 10f; // 跟随速度
    private Vector3 offset; // 摄像头相对目标对象的偏移量

    void Start()
    {
        // 计算摄像头相对目标对象的初始偏移量
        targetObject = GameObject.Find("Vehicle");
        offset = transform.position - targetObject.transform.position;
    }

    void LateUpdate()
    {
       
        Vector3 targetPosition = targetObject.transform.position + offset;
        transform.position = Vector3.Lerp(transform.position, targetPosition, followSpeed * Time.deltaTime);
    }
}
