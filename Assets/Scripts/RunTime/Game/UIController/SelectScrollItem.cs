using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SelectScrollItem : MonoBehaviour, IDragHandler, IPointerDownHandler, IPointerUpHandler
{
    [Tooltip("Picture")]
    [SerializeField]private RawImage image;
    [Tooltip("IndexText")]
    [SerializeField]private TMP_Text nameText;
     [Tooltip("desText")]
    [SerializeField]private TMP_Text desText;
    [Tooltip("PictureGroup")]
    [SerializeField] private CanvasGroup canvasGroup;

    [Tooltip("ItemIndex")]
    public int itemIndex;
    [Tooltip("InfoIndex")]
    public int infoIndex;
      [Tooltip("LevelName")]
    public string levelName;
    [Tooltip("Description")]
    public string description;
    [Tooltip("Score")]
    public int score;

    private SelectScrollHorizon selectScrollHorizon;
    [HideInInspector] public RectTransform rectTransform;

    private bool isDrag;

    private void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="texture"></param>
    /// <param name="name"></param>
    /// <param name="description"></param>
    /// <param name="infoIndex"></param>
    /// <param name="selectScrollHorizon"></param>
    public void SetInfo(Texture texture, string name, string description,int score, int infoIndex,
       SelectScrollHorizon selectScrollHorizon)
       {
            image.texture = texture;
            nameText.text = (infoIndex+1).ToString();
            Debug.Log(nameText.text);
            this.description = description;
            desText.text = description;
            this.infoIndex = infoIndex;
            this.levelName = name;
            this.score = score;
            this.selectScrollHorizon = selectScrollHorizon;
       }

    public void SetAlpha(float alpha)
    {
        canvasGroup.alpha = alpha;
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        isDrag = false;
        selectScrollHorizon.OnPointerDown(eventData);

    }

    public void OnPointerUp(PointerEventData eventData)
    {
        if(!isDrag)
        {
            selectScrollHorizon.Select(itemIndex, infoIndex, rectTransform);
        }
        selectScrollHorizon.OnPointerUp(eventData);
    }

    public void OnDrag(PointerEventData eventData)
    {
        isDrag = true;
        selectScrollHorizon.OnDrag(eventData);
    }

  
}
