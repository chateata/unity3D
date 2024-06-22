using UnityEngine;

public class TrailRendererController : MonoBehaviour
{
    private TrailRenderer trailRenderer;
  
    public Material emissionMaterial;

    private void Start()
    {
        trailRenderer = GetComponent<TrailRenderer>();
        SetTrailRendererProperties();
        
       
    }

    private void SetTrailRendererProperties()
    {
        trailRenderer.time = 0.4f;
        trailRenderer.widthCurve = AnimationCurve.Linear(0, 0.2f, 1, 0);
        trailRenderer.material = emissionMaterial;
        trailRenderer.minVertexDistance = 0.1f;
    }

   

}