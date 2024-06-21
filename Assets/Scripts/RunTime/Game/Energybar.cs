using UnityEngine;
using UnityEngine.UI;

public class EnergyBar : MonoBehaviour
{
    public Image energyBarForeground;
    public float maxEnergy = 100f;
    public float currentEnergy;

    void Start()
    {
        currentEnergy = maxEnergy;
        UpdateEnergyBar();
    }

    void Update()
    {
        // 这里可以添加消耗能量的逻辑，比如：
        // currentEnergy -= Time.deltaTime * energyConsumptionRate;
        // currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);

        // 示例：按下空格键消耗能量
        if (Input.GetKey(KeyCode.Space))
        {
            currentEnergy -= Time.deltaTime * 10; // 每秒消耗10能量
            currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
            UpdateEnergyBar();
        }

        // 示例：松开空格键恢复能量
        if (!Input.GetKey(KeyCode.Space))
        {
            currentEnergy += Time.deltaTime * 5; // 每秒恢复5能量
            currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
            UpdateEnergyBar();
        }
    }

    void UpdateEnergyBar()
    {
        float ratio = currentEnergy / maxEnergy;
        energyBarForeground.rectTransform.localScale = new Vector3(ratio, 1, 1);
    }
}