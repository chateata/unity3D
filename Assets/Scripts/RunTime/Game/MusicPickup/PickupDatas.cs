using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Music
{
    public float zTime;//音乐时间
    public int index;//在左中右哪个位置[-1,0,1]
}

public class PickupData
{
    public Music[] musics2;
    public Music[] musics1;
}