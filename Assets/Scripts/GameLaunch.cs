using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameLaunch : UnitySingleton<GameLaunch> {
    
    public override void Awake() {
        base.Awake();

        //初始化框架模块：资源管理模块，日志管理模块，网络管理模块，声音管理模块，UI管理模块   
        this.gameObject.AddComponent<ResMgr>();

        //end

        //初始化游戏模块
        this.gameObject.AddComponent<Game>();
        //ed

    }

    public void  Start() {
        //检查资源分析
        //end

        Game.Instance.Gamestart();
    }
}
