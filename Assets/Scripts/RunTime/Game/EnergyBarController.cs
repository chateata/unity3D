using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class EnergyBarController : UnitySingleton<EnergyBarController>
{
    public Image energyFullImage;
    public float maxEnergy = 60f;
    public float currentEnergy;
    public float timeval;

    void Start()
    {
        currentEnergy = 0f;
        UpdateEnergyBar();
    }

    public void AddEnergy(float amount){
        // for(int i=0;i<5;i++){
        //     currentEnergy += 1;
        //     UpdateEnergyBar();
        // }
        StartCoroutine(SmoothIncreaseEnergy(amount));


        // if(currentEnergy > maxEnergy){
        //     UpSpeed();
        // }

    }

    private IEnumerator SmoothIncreaseEnergy(float amount){
        float targetEnergy = currentEnergy + amount;
        if(targetEnergy > maxEnergy){
            UpSpeed();
        }
        while(currentEnergy<targetEnergy){
            currentEnergy += Time.deltaTime * (amount / 1);
            if(currentEnergy > targetEnergy){
                currentEnergy = targetEnergy;
            }
            UpdateEnergyBar();
            yield return null;
        }
    }
    void UpdateEnergyBar()
    {
        energyFullImage.fillAmount = currentEnergy / maxEnergy;
    }

    void UpSpeed(){

    }
}