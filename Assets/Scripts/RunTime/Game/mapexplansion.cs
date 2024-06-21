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

    private MusicPUMgr musicPUMgr;
    private float GameTimer = 0f;

    void Start()
    {
        player = Camera.main.transform; // 获取主摄像机的 Transform 组件
        GameTimer = 0f;
        // 初始生成地图块
        for (int i = 0; i < chunksOnScreen; i++)
        {
            SpawnChunk();
        }
    }

    void Update()
    {
        // 当玩家位置超过最后一个地图块的安全区时，生成新地图块并删除旧地图块
        if (-player.position.z - safeZone > (spawnZ - chunksOnScreen * chunkLength))
        {
            SpawnChunk();
            DeleteChunk();
        }
        GameTimer += Time.deltaTime;
    }
        
        


    void SpawnChunk(int prefabIndex = -1)
    {
        GameObject chunk;
        if (prefabIndex == -1)
        {
            
            if(GameTimer <=20.180000f){
                Debug.Log(GameTimer);
                chunk = GameObject.Instantiate(mapChunks[Random.Range(1, mapChunks.Length)]) as GameObject;
                
            }else
            {
                chunk = GameObject.Instantiate(mapChunks[Random.Range(1, mapChunks.Length)]) as GameObject;
                CreatFloor(chunk);
                chunk = GameObject.Instantiate(mapChunks[0]) as GameObject;
                spawnZ += chunkLength;
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