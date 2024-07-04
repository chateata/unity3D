using UnityEngine;
using System.Collections;
using System.Collections.Generic;
class MapExplansion:MonoBehaviour{
    public GameObject[] mapChunks; // 地图块数组
    public float chunkLength = 10f; // 每个地图块的长度
    private Transform player; // 玩家或摄像机的 Transform 组件
    private List<GameObject> activeChunks = new List<GameObject>(); // 当前激活的地图块
    private float spawnZ = 0f; // 下一个地图块生成的 Z 坐标
    private int chunksOnScreen = 7; // 屏幕上显示的地图块数量
    private float safeZone = 15f; // 安全区，决定何时删除不再显示的地图块
    public TimeCtrl timeCtrl;
    
    public GameMgr gameMgr;
    private float GameTimer = 0f;
    private int flag = 0;

    void Start()
    {
        player = Camera.main.transform;
        GameTimer = 0f;
        gameMgr = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<GameMgr>();
        timeCtrl = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<TimeCtrl>();
        Debug.Log("" + gameMgr);
        
        for (int i = 0; i < chunksOnScreen; i++)
        {
            SpawnChunk();
        }
    }

    void Update()
    {
        if (-player.position.z - safeZone > (spawnZ - chunksOnScreen * chunkLength))
        {
            SpawnChunk();
            DeleteChunk();
        }
        GameTimer += Time.deltaTime;

        if(flag!=0)
        {
            if(Time.timeScale == 0) gameMgr.GameOver(true);
        }
    }
        
        
    void Win()
    {
        Debug.Log("Start");
        timeCtrl.SlowdownToZero(5f);
    }

    void SpawnChunk(int prefabIndex = -1)
    {
        GameObject chunk;
        if (prefabIndex == -1 )
        {
            
            if(GameTimer <= 10.151f){
                chunk = GameObject.Instantiate(mapChunks[Random.Range(1, mapChunks.Length-2)]) as GameObject;
                
            }else
            {
                if( flag == 0 ) 
                {
                    flag ++;
                    chunk = GameObject.Instantiate(mapChunks[1]) as GameObject;
                    CreatFloor(chunk);
                    spawnZ -= chunkLength;
                }else if( flag == 5){
                   
                    chunk = GameObject.Instantiate(mapChunks[6]) as GameObject;
                    flag ++;
                    CreatFloor(chunk);
                }
               
                chunk = GameObject.Instantiate(mapChunks[0]) as GameObject;
                flag++;
                Invoke("Win", 5f);
                
             
               
                
            }
            
        }
        else
        {
            chunk = GameObject.Instantiate(mapChunks[prefabIndex]) as GameObject;
        }
        CreatFloor(chunk);
       
    }
    

    void CreatFloor(GameObject chunk ){
        chunk.transform.SetParent(transform);
        chunk.transform.position = -Vector3.forward * spawnZ;
        spawnZ += chunkLength;
        activeChunks.Add(chunk);
    }

    void DeleteChunk()
    {
        // 销毁最早生成的地图块并从列表中移除
        Destroy(activeChunks[0]);
        activeChunks.RemoveAt(0);
    }

}