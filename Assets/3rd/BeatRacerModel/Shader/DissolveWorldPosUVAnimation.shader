//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Beatracer/Unlit/DissolveFromWorldUVAnimation" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
 _SubTex ("Sub (RGB)", 2D) = "white" { }
 _AnimationTex ("Animation (RGBA)", 2D) = "white" { }
 _Amount ("Blend Amount", Float) = 1.000000
 _BurnLineWidth ("Burn Line Size", Range(0.000000,50.000000)) = 0.300000
 _Origin ("Origin", Vector) = (0.000000,0.000000,0.000000,1.000000)
 _Radius ("Radius", Float) = 60.000000
 _Progress ("Progress", Range(0.000000,1.000000)) = 0.000000
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" }
  GpuProgramID 10899
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD3 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD3 = tmpvar_9.xyz;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_9);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD3 = tmpvar_9.xyz;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_9);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _SubTex_ST;
uniform highp vec4 _AnimationTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  mediump vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_2.zw = ((_glesMultiTexCoord0.xy * _SubTex_ST.xy) + _SubTex_ST.zw);
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].x;
  v_5.y = unity_WorldToObject[1].x;
  v_5.z = unity_WorldToObject[2].x;
  v_5.w = unity_WorldToObject[3].x;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].y;
  v_6.y = unity_WorldToObject[1].y;
  v_6.z = unity_WorldToObject[2].y;
  v_6.w = unity_WorldToObject[3].y;
  highp vec4 v_7;
  v_7.x = unity_WorldToObject[0].z;
  v_7.y = unity_WorldToObject[1].z;
  v_7.z = unity_WorldToObject[2].z;
  v_7.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize(((
    (v_5.xyz * _glesNormal.x)
   + 
    (v_6.xyz * _glesNormal.y)
  ) + (v_7.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_8;
  tmpvar_3 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_4);
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _AnimationTex_ST.xy) + _AnimationTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  highp vec4 tmpvar_9;
  tmpvar_9 = (unity_ObjectToWorld * _glesVertex);
  xlv_TEXCOORD3 = tmpvar_9.xyz;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_9);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _SubTex;
uniform sampler2D _AnimationTex;
uniform highp float _Amount;
uniform highp vec4 _Origin;
uniform highp float _Radius;
uniform highp float _Progress;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  tmpvar_2 = vec3(0.0, 0.0, 0.0);
  lowp vec3 tmpvar_3;
  tmpvar_3 = tmpvar_2;
  highp vec4 animationTex_4;
  highp vec4 sub_5;
  highp vec4 main_6;
  highp float hexgonInner_7;
  highp float radius_8;
  radius_8 = 0.1;
  if ((_Progress < 0.3)) {
    radius_8 = 0.1;
    if ((_Progress < 0.01)) {
      hexgonInner_7 = 0.0;
    } else {
      highp float tmpvar_9;
      tmpvar_9 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / 0.1);
      hexgonInner_7 = float(((tmpvar_9 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / 0.1)) + (0.25 * tmpvar_9))
       < 0.21)));
    };
  } else {
    radius_8 = (_Radius * (_Progress - 0.3));
    if ((_Progress > 0.8)) {
      hexgonInner_7 = 1.0;
    } else {
      highp float tmpvar_10;
      tmpvar_10 = (abs((xlv_TEXCOORD3.x - _Origin.x)) / radius_8);
      hexgonInner_7 = float(((tmpvar_10 < 0.43) && (
        ((0.43 * (abs(
          (xlv_TEXCOORD3.z - _Origin.z)
        ) / radius_8)) + (0.25 * tmpvar_10))
       < 0.21)));
    };
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  main_6 = tmpvar_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_SubTex, xlv_TEXCOORD0.zw);
  sub_5 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_AnimationTex, xlv_TEXCOORD1);
  animationTex_4 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((mix (main_6, sub_5, vec4(hexgonInner_7)) * animationTex_4) * _Amount).xyz;
  tmpvar_3 = tmpvar_14;
  tmpvar_2 = tmpvar_3;
  lowp vec4 c_15;
  c_15.xyz = tmpvar_3;
  c_15.w = 0.0;
  c_1.xyz = c_15.xyz;
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
}
 }
}
}