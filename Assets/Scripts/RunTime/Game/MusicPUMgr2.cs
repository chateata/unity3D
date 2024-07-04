using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MusicPUMgr2 : MonoBehaviour
{
    
    private GameObject blockPrefab=null;
    private Transform blockRoot=null;

    private Music[] musicBlocks=null;
    private int totalBlocks=0;
    private int genIndex=0;

    private float gameSpeed = 8f;


    void Start()
    {
        this.blockPrefab = this.transform.Find("SM_MusicNotes").gameObject;

        this.musicBlocks = bgm2Pickup.data2.musics2;
        this.totalBlocks = this.musicBlocks.Length;

        for(int i=0;i<6;i++){
            this.genOneBlock();
        }

    }

    void Update() {
        
        this.genOneBlock();

    }

    private void genOneBlock(){
        if(this.genIndex>=this.totalBlocks){
            return;
        }
        GameObject music = GameObject.Instantiate(this.blockPrefab);
        music.name = "music" + this.genIndex;
        music.transform.SetParent(this.blockRoot,false);
        music.tag="PickUp";
        Vector3 pos= new Vector3(this.musicBlocks[this.genIndex].index, 0.15f, GameObject.FindWithTag("Vehicle").transform.position.z-this.gameSpeed * this.musicBlocks[this.genIndex].zTime);
        music.transform.position=pos;
        this.genIndex++;
    }

}
