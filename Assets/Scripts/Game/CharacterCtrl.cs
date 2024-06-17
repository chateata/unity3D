using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CharacterCtrl : UnitySingleton<CharacterCtrl>
{
    public float turnSpeed=2;
    public float Speed=4;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            SceneManager.LoadScene(0);
            Time.timeScale=1;
            return;
        }

        float z=Input.GetAxis("Horizontal");
        
        transform.Translate(Speed*Time.deltaTime,0,-z*turnSpeed*Time.deltaTime);

    }
}
