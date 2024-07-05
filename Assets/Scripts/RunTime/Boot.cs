using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Boot : MonoBehaviour {
 
    private void InitGameLogic() {
        this.gameObject.AddComponent<Game>();
        Game.Instance.InitGame();
    }

    public void Awake() {
        DontDestroyOnLoad(this.gameObject);
        this.InitGameLogic();
    }

    public void Start() {
        Game.Instance.EnterGame();
    }
}
