using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using TMPro;
//text
public class SelectScrollHorizon : MonoBehaviour, IDragHandler, IPointerDownHandler, IPointerUpHandler
{
   [SerializeField]
   private struct ItemInfo
   {
        public string name;
        public Texture texture;
        public string description;
        
        public ItemInfo(string name, Texture texture, string description)
        {
            this.name = name;
            this.texture = texture;
            this.description = description;
        }
   }

    [Tooltip("ItemPrefab")]
    [SerializeField] private GameObject itemPrefab;
    [Tooltip("ItemParent")]
    [SerializeField] private RectTransform itemParent;
    [Tooltip("DescriptionText")]
    [SerializeField] private TMP_Text descriptionText;
    [Tooltip("WorldNameText")]
    [SerializeField] private TMP_Text worldNameText;

    [Tooltip("LevelNameText")]
    [SerializeField] private TMP_Text levelNameText;
    [Tooltip("ScoreText")]
    [SerializeField] private TMP_Text scoreText;
    [Tooltip("ItemInfo")]
    [SerializeField] private ItemInfo[] itemInfos;
    [Tooltip("DisplayNum")]
    [SerializeField] private int displayNum;

    [Tooltip("ItemSpace")]
    [SerializeField] private float itemSpace;
    [Tooltip("MoveSmooth")]
    [SerializeField] private float moveSmooth;
    [Tooltip("Dragspeed")]
    [SerializeField] private float dragspeed;
    [Tooltip("ScaleMultiplying")]
    [SerializeField] private float scaleMultiplying;
    [Tooltip("AlphaMultiplying")]
    [SerializeField] private float alphaMultiplying;
    


    public event Action<int> SelectAction;

    private SelectScrollItem[] items;
    private float displayWidth;
    private int offsetTimes;
    private bool isDrag;
    private int currentItemIndex;
    private float[] distances;
    private float selectItemX;
    private bool isSelectMove;
    private bool isSelected;

    public int index;
    private GameMgr gameMgr;

    private void Start()
    {
        index = 0;
        Init();
        MoveItem(0);
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
    }

    private void Init()
    {
        displayWidth = (displayNum -1) * itemSpace;
        items = new SelectScrollItem[displayNum];
        for(int i = 0; i < displayNum;i++)
        {
            SelectScrollItem item = Instantiate(itemPrefab, itemParent).GetComponent<SelectScrollItem>();
            item.itemIndex = i;
            items[i] = item;
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="names">选项名称</param>
    /// <param name="textures">选项图片</param>
    /// <param name="descriptions">选项描述</param>
    public void SetItemsInfo(string[] names, Texture[] textures, string[] descriptions)
    {
        if(names.Length != textures.Length || textures.Length != descriptions.Length 
            || descriptions.Length != names.Length)
        {
            Debug.Log("数据不完整");
            return;
        }

        itemInfos = new ItemInfo[names.Length];
        for(int i = 0; i < itemInfos.Length; i++)
        {
            itemInfos[i] = new ItemInfo(names[i], textures[i],descriptions[i]);
        }
        SelectAction = null;
        isSelected = false;

    }

    public void Select(int itemIndex, int infoIndex, RectTransform itemRectTransform)
    {

        if(!isSelected && itemIndex == currentItemIndex)
        {
            SelectAction?.Invoke(infoIndex);
            isSelected = true;
            Debug.Log("select "+(infoIndex + 1).ToString());
        }
       
        else{
            isSelectMove = true;selectItemX=itemRectTransform.localPosition.x;
        }
        
    }
    public void MoveItem(int offsetTimes)
    {
        for(int i=0;i<displayNum; i++)
        {
        float x=itemSpace *(i-offsetTimes)-displayWidth /2;
        items[i].rectTransform. localPosition = new Vector2(x, items[i].rectTransform. localPosition.y);
        }
        int middle;

        if (offsetTimes > 0)
        {
            middle = itemInfos.Length - offsetTimes % itemInfos.Length;
        }else{

            // Debug.Log(offsetTimes+"//"+itemInfos.Length);
            middle = -offsetTimes % itemInfos.Length;
        }
        int infoIndex = middle;
        for (int i = Mathf.FloorToInt(displayNum/2f); i <displayNum;i++)
        {
            if(infoIndex >= itemInfos.Length){
                infoIndex = 0;
            }
            items[i].SetInfo(itemInfos[infoIndex].texture, itemInfos[infoIndex]. name,
            itemInfos[infoIndex].description,
            infoIndex, this);
            infoIndex++;
        }
        infoIndex = middle -1;
       
        for(int i=Mathf.FloorToInt(displayNum /2f)-1;i>=0;i--)
        {
            if(infoIndex<=-1)
            {
                infoIndex=itemInfos.Length-1;
            }
      
            items[i].SetInfo(itemInfos[infoIndex].texture, itemInfos[infoIndex]. name,itemInfos[infoIndex].description,infoIndex, this);
            infoIndex--;

        }
        
    }

    public void Update()
    {
        if (!isDrag)
        {
            Absorption();
        }
        int currentOffestTimes = Mathf.FloorToInt(itemParent.localPosition.x / itemSpace);
        if(currentOffestTimes != offsetTimes)
        {
            offsetTimes = currentOffestTimes;
            MoveItem(offsetTimes);
        }
        ItemsControl();
    }
    public void ItemsControl()
    {
        distances = new float[displayNum];
        for (int i = 0; i < displayNum; i++)
        {
            float distance = Math.Abs(items[i].rectTransform.position.x - transform.position.x);
            distances[i] = distance;
            float scale = 1 - distance * scaleMultiplying;
            items[i].rectTransform.localScale = new Vector3(scale, scale, 1);
            items[i].SetAlpha(1 - distance * alphaMultiplying);
        }

        float minDistance = itemSpace * displayNum;
        int minIndex = 0;
        for (int i = 0; i < displayNum; i++)
        {
            if (distances[i] < minDistance)
            {
                minDistance = distances[i];
                minIndex = i;
            }
        }
        descriptionText.text = items[minIndex].description;
        index = items[minIndex].infoIndex;
        worldNameText.text = "World " + (items[minIndex].infoIndex+1);





        Debug.Log("1 levelScores[levelIndex]:" + gameMgr.GetLevelScore(index));

        levelNameText.text = items[minIndex].levelName;
        scoreText.text = gameMgr.GetLevelScore(index) == -1? "Locked" :"score:" + gameMgr.GetLevelScore(index);

        currentItemIndex = items[minIndex].itemIndex;

    

    }
    private void Absorption()
    {
        float targetX;
        if(!isSelectMove)
        {
            float distance=itemParent.localPosition.x% itemSpace;
            int times = Mathf.FloorToInt(itemParent.localPosition.x/itemSpace);
            if(distance >0)
            {
                if(distance < itemSpace / 2)
                {
                    targetX = times * itemSpace;
                }else{
                    targetX = (times +1) * itemSpace;
                }
            }
            else
            {
                if(distance<-itemSpace/2)
                {
                    targetX= times * itemSpace;
                }else
                {
                    targetX=(times +1)*itemSpace;
                }

            }
        }
       else
       {
        targetX = -selectItemX;
       }
       itemParent.localPosition = new Vector2(Mathf.Lerp(itemParent.localPosition.x,
                targetX, moveSmooth/10),itemParent.localPosition.y);



    }

    public void OnDrag(PointerEventData eventData)
    {
        isSelectMove =false;
        itemParent.localPosition = new Vector2(itemParent.localPosition.x + eventData.delta.x * dragspeed, itemParent.localPosition.y);
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        isDrag = true;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        isDrag = false;
    }



}
