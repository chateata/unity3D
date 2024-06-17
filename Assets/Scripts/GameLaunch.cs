using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameLaunch : UnitySingleton<GameLaunch> {
    
    public override void Awake() {
        base.Awake();

        //初始化游戏框架
        this.InitFramwork();

        //初始化游戏逻辑
        this.InitGameLogic();

    }

    private void InitFramwork() 
    {
        //初始化框架：资源管理模块，声音管理模块，UI管理模块   
        this.gameObject.AddComponent<ResMgr>();
        this.gameObject.AddComponent<AudioMgr>();
        this.gameObject.AddComponent<UIMgr>();
    }

    private void InitGameLogic() {
        this.gameObject.AddComponent<Game>();
        Game.Instance.InitGame();
    }

    public void  Start() {
        //检查资源分析
        //没写，来个人写吧
        //end

        Game.Instance.InitGame();
    }
}
