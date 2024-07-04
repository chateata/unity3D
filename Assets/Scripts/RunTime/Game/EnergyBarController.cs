using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class EnergyBarController : UnitySingleton<EnergyBarController>
{
    public Image energyFullImage;
    public float maxEnergy = 60f;
    public float currentEnergy;
    public float timeval;
    public CharacterCtrl vehicle;
    public EnemyAI enemy;
    private bool canIncreaseEnergy = true;
    void Start()
    {
        currentEnergy = 0f;
        UpdateEnergyBar();
    }

    public void AddEnergy(float amount){
        if (canIncreaseEnergy)
        {
            StartCoroutine(SmoothIncreaseEnergy(amount));
        }
        ResetEnergyIncrease();
    }

    private IEnumerator SmoothIncreaseEnergy(float amount){
        float targetEnergy = currentEnergy + amount;
        if(currentEnergy >= maxEnergy){
            currentEnergy = 0;
            targetEnergy =0;
            canIncreaseEnergy = false;
            UpdateEnergyBar();
            yield return null;
            enemy.isSlowing = true;
           
        }
        while(currentEnergy<targetEnergy){
            Debug.Log("currentEnergy:"+currentEnergy);
            currentEnergy += Time.deltaTime * (amount / 1);
            if(currentEnergy >= targetEnergy){
                currentEnergy = targetEnergy;
            }
            UpdateEnergyBar();
            yield return null;
        }
    }
    public void ResetEnergyIncrease()
    {
        canIncreaseEnergy = true;
    }

    void UpdateEnergyBar()
    {
        energyFullImage.fillAmount = currentEnergy / maxEnergy;
    }

}
