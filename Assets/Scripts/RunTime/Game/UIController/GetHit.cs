using UnityEngine;
using UnityEngine.UI;

public class ImageFadeIn : MonoBehaviour
{
    public RawImage targetImage;
    private float fadeInDuration = 0.2f; 
    private float fadeInTimer = 0f; 
    private bool isFadingIn = false;

    private void Start()
    {
        targetImage.color = new Color(targetImage.color.r, targetImage.color.g, targetImage.color.b, 0f);
    }

    private void Update()
    {
        if (isFadingIn)
        {
            fadeInTimer += Time.deltaTime;

            float alpha = Mathf.Lerp(0f, 0.5f, fadeInTimer / fadeInDuration);
            targetImage.color = new Color(targetImage.color.r, targetImage.color.g, targetImage.color.b, alpha);

            if (fadeInTimer >= fadeInDuration)
            {
                isFadingIn = false;
                fadeInTimer = 0f;
            }
        }
    }

    public void FadeInImage()
    {
        isFadingIn = true;
    }
}

