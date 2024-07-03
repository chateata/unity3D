using UnityEngine;
using System.Collections;

public class TimeCtrl : UnitySingleton<TimeCtrl>
{
    public float smoothingDuration = 0.5f; 

    private float startTimescale;
    private float startTime;
 
    public void SlowdownToZero(float Duration)
    {
        smoothingDuration = Duration;
        startTimescale = Time.timeScale;

        startTime = Time.unscaledTime;

        StartCoroutine(SmoothTimeScale());
    }

    private IEnumerator SmoothTimeScale()
    {
        while (Time.timeScale > 0.05f)
        {
            
            float elapsedTime = Time.unscaledTime - startTime;

          
            Time.timeScale = Mathf.Lerp(startTimescale, 0f, elapsedTime / smoothingDuration);
           
            yield return null;
        }
        Time.timeScale = 0f;
    }
}