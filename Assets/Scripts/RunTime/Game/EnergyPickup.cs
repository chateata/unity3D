using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnergyPickup : MonoBehaviour
{
   public float energyAmount = 2f; // 能量值

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Vehicle"))
        {
            EnergyBarController energyBar = FindObjectOfType<EnergyBarController>();
            if (energyBar != null)
            {
                energyBar.AddEnergy(energyAmount); // 增加能量
            }
            Destroy(gameObject); // 拾取后销毁能量块
        }
    }
}
