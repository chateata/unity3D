using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttackEnemy : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        check();
    }
    void check(){
        if(EnergeScore.score==3){
            Attack();
            EnergeScore.score=0;
        }
    }
    void Attack(){
        
    }
}
