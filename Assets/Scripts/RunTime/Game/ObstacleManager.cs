using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ObstacleManager : MonoBehaviour
{
    
    // private GameObject ball=null;
    // private Transform gameCamera=null;
    private GameObject blockPrefab=null;
    private Transform blockRoot=null;

    private Block[] musicBlocks=null;
    private int totalBlocks=0;
    private int genIndex=0;
    private AudioSource music=null;

    private float gameSpeed=5f;
    // private float gameGravity=0.0f;

    // public static object Instance { get; internal set; }

    void Update() {
        

        //元素相关
        // this.ball=this.transform.Find("ball").gameObject;
        // this.gameCamera=this.transform.Find("Main Camera");
        this.blockPrefab = this.transform.Find("Start").gameObject;
        // this.blockRoot=this.transform.Find("PlatRoot");
        //end


        //音乐相关，名字--》选取音乐
        this.musicBlocks=bgm1Data.data.blocks;
        this.totalBlocks=this.musicBlocks.Length;
        // //end

        //        //放音乐
        // this.music=this.gameObject.AddComponent<AudioSource>();
        // this.music.clip=ResMgr.Instance.GetAssetCache<AudioClip>(bgm1Data.soundUr1);
        // //end

        //预先生成6个块；
        for(int i=0;i<6;i++){
            this.genOneBlock();
        }
        //end

    }
    private void genOneBlock(){
        if(this.genIndex>=this.totalBlocks){
            return;
        }
        GameObject block = GameObject.Instantiate(this.blockPrefab);
        block.name="block"+this.genIndex;
        block.transform.SetParent(this.blockRoot,false);
        Vector3 pos=new Vector3(0,0.34f,-this.gameSpeed*this.musicBlocks[this.genIndex].zTime);
        block.transform.position=pos;
        this.genIndex++;
    }

    void Start(){
        // this.music.Play();
    }
}




   

    //管理所有游戏元素：游戏主角，障碍，音乐数据，游戏数据（速度，重力），特效控制

