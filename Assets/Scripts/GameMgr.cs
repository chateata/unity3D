using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class GameMgr_1 : MonoBehaviour
{
    private GameObject ball=null;
    private Transform gameCamera=null;
    private GameObject blockPrefab=null;
    private Transform blockRoot=null;

    private Block[] musicBlocks=null;
    private int totalBlocks=0;
    private AudioSource music=null;
    private float gameSpeed=0.0f;
    private float gameGravity=0.0f;

    public static object Instance { get; internal set; }

    public void init(){
        //通过配置文件读取的
        this.gameSpeed=12.0f;
        this.gameGravity=-40.0f;
        //end


        //元素相关
        this.ball=this.transform.Find("ball").gameObject;
        this.gameCamera=this.transform.Find("Main Camera");
        this.blockPrefab=this.transform.Find("Start").gameObject;
        this.blockRoot=this.transform.Find("PlatRoot");
        //end


        //音乐相关，名字--》选取音乐
        this.musicBlocks=bgm1Data.data .blocks;
        this.totalBlocks=this.musicBlocks.Length;
        //end


        //放音乐
        this.music=this.gameObject.AddComponent<AudioSource>();
        this.music.clip=ResMgr.Instance.GetAssetCache<AudioClip>(bgm1Data.soundUr1);
        //end




        this.GameStart();

    }

    private void GameStart(){
        this.music.Play();

    }
}



   

    //管理所有游戏元素：游戏主角，障碍，音乐数据，游戏数据（速度，重力），特效控制

