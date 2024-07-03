using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ObstacleManager : MonoBehaviour
{
    private GameObject blockPrefab=null;
    private Transform blockRoot=null;

    private Block[] musicBlocks=null;
    private int totalBlocks=0;
    private int genIndex=0;
    private int desIndex = 0;

    private float gameSpeed = 8f;

    private Transform player;
    private float safeZone = 15f;

    private List<GameObject> activeBlocks = new List<GameObject>(); 
    

    void Start()
    {
        player = GameObject.FindWithTag("Vehicle").transform;

        this.blockPrefab = this.transform.Find("Start").gameObject;

        this.musicBlocks = bgm1Data.data.blocks;
        this.totalBlocks = this.musicBlocks.Length;

        for(int i=0;i<6;i++){
            this.genOneBlock();
        }

    }

    void Update() {
        this.genOneBlock();
        
        if (-player.position.z - safeZone >= -activeBlocks[0].transform.position.z)
        {
           this.DestroyBlock();
        }
       
    }

    private void genOneBlock(){
        if(this.genIndex>=this.totalBlocks){
            return;
        }
        GameObject block = GameObject.Instantiate(this.blockPrefab);
        block.name = "block" + this.genIndex;
        block.transform.SetParent(this.blockRoot,false);
        Vector3 pos= new Vector3(this.musicBlocks[this.genIndex].index, 0.15f, player.position.z-this.gameSpeed * this.musicBlocks[this.genIndex].zTime);
        block.transform.position=pos;
        activeBlocks.Add(block);
        this.genIndex++;

        // Debug.Log("Creat" + this.genIndex);
       
    }
    private void DestroyBlock(){
        if(this.genIndex <=this.desIndex){
            return;
        }
        // Debug.Log("destroy" + desIndex);
        Destroy(activeBlocks[0]);
        activeBlocks.RemoveAt(0);
        this.desIndex++;
    }

}




   

    //管理所有游戏元素：游戏主角，障碍，音乐数据，游戏数据（速度，重力），特效控制

