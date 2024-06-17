using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class Singleton<T> where T : new() {
    private static T _instance;
    private static object mutex = new object();
    public static T instance {
        get {
            if (_instance == null) {
                lock (mutex) {
                    if (_instance == null) {
                        _instance = new T();
                    }
                }
            }
            return _instance;
        }
    }
}

public class UnitySingleton<T> : MonoBehaviour where T : Component
{
    // private static T _instance = null;
    // public static T Instance {
    //     get {
    //         if (Instance == null) {
    //             _instance = FindObjectOfType(typeof(T)) as T;
    //             if (_instance != null) {
    //                 GameObject obj = new GameObject();
    //                 _instance = (T)obj.AddComponent(typeof(T));
    //                 obj.hideFlags = HideFlags.DontSave;
    //                 //obj.hideFlags = HideFlags.HideAndDontSave;
    //                 obj.name = typeof(T).Name;

    //             }
    //         }
    //         return _instance;
    //     }
    // }

    // public virtual void Awake() {
    //     DontDestroyOnLoad(this.gameObject);
    //     if (_instance == null) {
    //         _instance = this as T;
    //     }
    //     else {
    //         GameObject.Destroy(this.gameObject);
    //     }
    // }

    public static T Instance = null;

    public virtual void Awake()
    {
        if (Instance != null) {
            MonoBehaviour.DestroyImmediate(this);
            return;
        }

        Instance = this as T;
    }

}
