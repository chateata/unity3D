using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bgm1Data
{
    public static string soundUr1="Sounds/bgm1";
    public static string soundName="bgm1";
    public static float musicTime=222;

    public static MusicData data=new MusicData{
        blocks=new Block[]{
            new Block{zTime=2.100000f, index=0},
            new Block{zTime=3.970000f, index=-1},
            new Block{zTime=5.800000f, index=0},
            new Block{zTime=7.850000f, index=1},
            new Block{zTime=9.720000f, index=0},
            new Block{zTime=11.620000f, index=-1},
            new Block{zTime=13.520000f, index=0},
            new Block{zTime=17.370000f, index=1},
            new Block{zTime=18.810000f, index=-1},
            new Block{zTime=20.300000f, index=0},
            new Block{zTime=23.180000f, index=1}
        }
    };
}