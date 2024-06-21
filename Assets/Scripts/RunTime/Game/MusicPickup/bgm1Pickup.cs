using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bgm1Pickup
{
    public static string soundUr1="Sounds/bgm1";
    public static string soundName="bgm1";
    public static float musicTime=222;

    public static PickupData data=new PickupData{
        musics=new Music[]{
            new Music{zTime=2.100000f, index=-1},
            new Music{zTime=3.970000f, index=0},
            new Music{zTime=7.800000f, index=1},
            //new Music{zTime=7.850000f, index=1},
            //new Music{zTime=9.720000f, index=0},
            new Music{zTime=10.620000f, index=1},
            new Music{zTime=14.520000f, index=0},
            // new Music{zTime=17.370000f, index=1},
            // new Music{zTime=18.810000f, index=-1},
            // new Music{zTime=20.300000f, index=0},
            // new Music{zTime=23.180000f, index=1}
        }
    };
}