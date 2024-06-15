//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Toony Colors Pro 2/Variants/Mobile Matcap Rim" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _HColor ("Highlight Color", Color) = (0.600000,0.600000,0.600000,1.000000)
 _SColor ("Shadow Color", Color) = (0.200000,0.200000,0.200000,1.000000)
 _MainTex ("Main Texture (RGB) Spec/MatCap Mask (A) ", 2D) = "white" { }
 _Ramp ("#RAMPT# Toon Ramp (RGB)", 2D) = "gray" { }
 _RampThreshold ("#RAMPF# Ramp Threshold", Range(0.000000,1.000000)) = 0.500000
 _RampSmooth ("#RAMPF# Ramp Smoothing", Range(0.010000,1.000000)) = 0.100000
 _BumpMap ("#NORM# Normal map (RGB)", 2D) = "bump" { }
 _RimColor ("#RIM# Rim Color", Color) = (0.800000,0.800000,0.800000,0.600000)
 _RimMin ("#RIM# Rim Min", Range(0.000000,1.000000)) = 0.500000
 _RimMax ("#RIM# Rim Max", Range(0.000000,1.000000)) = 1.000000
 _RimDir ("#RIMDIR# Rim Direction", Vector) = (0.000000,0.000000,1.000000,0.000000)
 _MatCap ("#MC# MatCap (RGB)", 2D) = "black" { }
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  GpuProgramID 55945
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_17;
  v_33.y = tmpvar_18;
  v_33.z = tmpvar_19;
  v_33.w = tmpvar_20;
  highp vec4 v_34;
  v_34.x = tmpvar_22;
  v_34.y = tmpvar_23;
  v_34.z = tmpvar_24;
  v_34.w = tmpvar_25;
  highp vec4 v_35;
  v_35.x = tmpvar_27;
  v_35.y = tmpvar_28;
  v_35.z = tmpvar_29;
  v_35.w = tmpvar_30;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * _glesNormal.x)
   + 
    (v_34.xyz * _glesNormal.y)
  ) + (v_35.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_36;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_37;
  tmpvar_37.w = 1.0;
  tmpvar_37.xyz = worldNormal_2;
  mediump vec4 normal_38;
  normal_38 = tmpvar_37;
  mediump vec3 res_39;
  mediump vec3 x_40;
  x_40.x = dot (unity_SHAr, normal_38);
  x_40.y = dot (unity_SHAg, normal_38);
  x_40.z = dot (unity_SHAb, normal_38);
  mediump vec3 x1_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (normal_38.xyzz * normal_38.yzzx);
  x1_41.x = dot (unity_SHBr, tmpvar_42);
  x1_41.y = dot (unity_SHBg, tmpvar_42);
  x1_41.z = dot (unity_SHBb, tmpvar_42);
  res_39 = (x_40 + (x1_41 + (unity_SHC.xyz * 
    ((normal_38.x * normal_38.x) - (normal_38.y * normal_38.y))
  )));
  res_39 = max (((1.055 * 
    pow (max (res_39, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_39;
  tmpvar_6 = shlight_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_11;
  mediump vec3 lightDir_12;
  lightDir_12 = lightDir_3;
  lowp vec4 c_13;
  lowp vec3 ramp_14;
  lowp float ndl_15;
  mediump float tmpvar_16;
  tmpvar_16 = max (0.0, ((
    dot (tmpvar_2, lightDir_12)
   * 0.5) + 0.5));
  ndl_15 = tmpvar_16;
  highp float edge0_17;
  highp float tmpvar_18;
  tmpvar_18 = (_RampSmooth * 0.5);
  edge0_17 = (_RampThreshold - tmpvar_18);
  highp float tmpvar_19;
  tmpvar_19 = clamp (((ndl_15 - edge0_17) / (
    (_RampThreshold + tmpvar_18)
   - edge0_17)), 0.0, 1.0);
  highp vec3 tmpvar_20;
  tmpvar_20 = vec3((tmpvar_19 * (tmpvar_19 * (3.0 - 
    (2.0 * tmpvar_19)
  ))));
  ramp_14 = tmpvar_20;
  lowp vec3 tmpvar_21;
  tmpvar_21 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_14);
  ramp_14 = tmpvar_21;
  c_13.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_21);
  c_13.w = tmpvar_8;
  tmpvar_11 = c_13;
  c_1 = (c_1 + tmpvar_11);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_33);
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_33);
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" "TCP2_MC" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_WorldToShadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 _RimColor;
uniform lowp float _RimMin;
uniform lowp float _RimMax;
uniform highp vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD6;
void main ()
{
  highp vec3 shlight_1;
  lowp vec3 worldNormal_2;
  mediump vec2 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec2 tmpvar_9;
  highp vec3 worldNorm_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_12;
  tmpvar_12 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_11).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_13;
  tmpvar_13 = (1.0 - tmpvar_12);
  mediump float tmpvar_14;
  mediump float tmpvar_15;
  tmpvar_15 = clamp (((tmpvar_13 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_14 = (tmpvar_15 * (tmpvar_15 * (3.0 - 
    (2.0 * tmpvar_15)
  )));
  tmpvar_8 = (tmpvar_14 * _RimColor.w);
  highp vec4 v_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[0].x;
  v_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[1].x;
  v_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[2].x;
  v_16.z = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[3].x;
  v_16.w = tmpvar_20;
  highp vec4 v_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[0].y;
  v_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[1].y;
  v_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[2].y;
  v_21.z = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[3].y;
  v_21.w = tmpvar_25;
  highp vec4 v_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[0].z;
  v_26.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[1].z;
  v_26.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[2].z;
  v_26.z = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[3].z;
  v_26.w = tmpvar_30;
  highp mat3 tmpvar_31;
  tmpvar_31[0] = unity_MatrixV[0].xyz;
  tmpvar_31[1] = unity_MatrixV[1].xyz;
  tmpvar_31[2] = unity_MatrixV[2].xyz;
  worldNorm_10 = (tmpvar_31 * normalize((
    ((v_16.xyz * _glesNormal.x) + (v_21.xyz * _glesNormal.y))
   + 
    (v_26.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_10.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_34;
  v_34.x = tmpvar_17;
  v_34.y = tmpvar_18;
  v_34.z = tmpvar_19;
  v_34.w = tmpvar_20;
  highp vec4 v_35;
  v_35.x = tmpvar_22;
  v_35.y = tmpvar_23;
  v_35.z = tmpvar_24;
  v_35.w = tmpvar_25;
  highp vec4 v_36;
  v_36.x = tmpvar_27;
  v_36.y = tmpvar_28;
  v_36.z = tmpvar_29;
  v_36.w = tmpvar_30;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * _glesNormal.x)
   + 
    (v_35.xyz * _glesNormal.y)
  ) + (v_36.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_37;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_38;
  tmpvar_38.w = 1.0;
  tmpvar_38.xyz = worldNormal_2;
  mediump vec4 normal_39;
  normal_39 = tmpvar_38;
  mediump vec3 res_40;
  mediump vec3 x_41;
  x_41.x = dot (unity_SHAr, normal_39);
  x_41.y = dot (unity_SHAg, normal_39);
  x_41.z = dot (unity_SHAb, normal_39);
  mediump vec3 x1_42;
  mediump vec4 tmpvar_43;
  tmpvar_43 = (normal_39.xyzz * normal_39.yzzx);
  x1_42.x = dot (unity_SHBr, tmpvar_43);
  x1_42.y = dot (unity_SHBg, tmpvar_43);
  x1_42.z = dot (unity_SHBb, tmpvar_43);
  res_40 = (x_41 + (x1_42 + (unity_SHC.xyz * 
    ((normal_39.x * normal_39.x) - (normal_39.y * normal_39.y))
  )));
  res_40 = max (((1.055 * 
    pow (max (res_40, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_40;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_44;
  lightColor0_44 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_45;
  lightColor1_45 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_46;
  lightColor2_46 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_47;
  lightColor3_47 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_48;
  lightAttenSq_48 = unity_4LightAtten0;
  highp vec3 normal_49;
  normal_49 = worldNormal_2;
  highp vec3 col_50;
  highp vec4 ndotl_51;
  highp vec4 lengthSq_52;
  highp vec4 tmpvar_53;
  tmpvar_53 = (unity_4LightPosX0 - tmpvar_33.x);
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosY0 - tmpvar_33.y);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosZ0 - tmpvar_33.z);
  lengthSq_52 = (tmpvar_53 * tmpvar_53);
  lengthSq_52 = (lengthSq_52 + (tmpvar_54 * tmpvar_54));
  lengthSq_52 = (lengthSq_52 + (tmpvar_55 * tmpvar_55));
  ndotl_51 = (tmpvar_53 * normal_49.x);
  ndotl_51 = (ndotl_51 + (tmpvar_54 * normal_49.y));
  ndotl_51 = (ndotl_51 + (tmpvar_55 * normal_49.z));
  highp vec4 tmpvar_56;
  tmpvar_56 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_51 * inversesqrt(lengthSq_52)));
  ndotl_51 = tmpvar_56;
  highp vec4 tmpvar_57;
  tmpvar_57 = (tmpvar_56 * (1.0/((1.0 + 
    (lengthSq_52 * lightAttenSq_48)
  ))));
  col_50 = (lightColor0_44 * tmpvar_57.x);
  col_50 = (col_50 + (lightColor1_45 * tmpvar_57.y));
  col_50 = (col_50 + (lightColor2_46 * tmpvar_57.z));
  col_50 = (col_50 + (lightColor3_47 * tmpvar_57.w));
  tmpvar_6 = (tmpvar_6 + col_50);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_WorldToShadow[0] * tmpvar_33);
  xlv_TEXCOORD6 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform highp sampler2D _ShadowMapTexture;
uniform highp float _RampThreshold;
uniform highp float _RampSmooth;
uniform lowp vec4 _HColor;
uniform lowp vec4 _SColor;
uniform lowp vec4 _Color;
uniform sampler2D _MainTex;
uniform sampler2D _MatCap;
uniform lowp vec4 _RimColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  highp vec3 lightDir_3;
  lowp float tmpvar_4;
  tmpvar_4 = xlv_TEXCOORD2.x;
  mediump vec3 tmpvar_5;
  tmpvar_5 = _WorldSpaceLightPos0.xyz;
  lightDir_3 = tmpvar_5;
  tmpvar_2 = xlv_TEXCOORD1;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  mediump vec4 main_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_9 = tmpvar_10;
  tmpvar_6 = (main_9.xyz * _Color.xyz);
  tmpvar_8 = (main_9.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  tmpvar_7 = (tmpvar_7 + texture2D (_MatCap, xlv_TEXCOORD2.yz).xyz);
  lowp float tmpvar_11;
  highp float lightShadowDataX_12;
  mediump float tmpvar_13;
  tmpvar_13 = _LightShadowData.x;
  lightShadowDataX_12 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD4.xy).x > xlv_TEXCOORD4.z)), lightShadowDataX_12);
  tmpvar_11 = tmpvar_14;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD3);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  mediump float atten_17;
  atten_17 = tmpvar_11;
  lowp vec4 c_18;
  lowp vec3 ramp_19;
  lowp float ndl_20;
  mediump float tmpvar_21;
  tmpvar_21 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_20 = tmpvar_21;
  highp float edge0_22;
  highp float tmpvar_23;
  tmpvar_23 = (_RampSmooth * 0.5);
  edge0_22 = (_RampThreshold - tmpvar_23);
  highp float tmpvar_24;
  tmpvar_24 = clamp (((ndl_20 - edge0_22) / (
    (_RampThreshold + tmpvar_23)
   - edge0_22)), 0.0, 1.0);
  highp vec3 tmpvar_25;
  tmpvar_25 = vec3((tmpvar_24 * (tmpvar_24 * (3.0 - 
    (2.0 * tmpvar_24)
  ))));
  ramp_19 = tmpvar_25;
  ramp_19 = (ramp_19 * atten_17);
  lowp vec3 tmpvar_26;
  tmpvar_26 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_19);
  ramp_19 = tmpvar_26;
  c_18.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_26);
  c_18.w = tmpvar_8;
  tmpvar_15 = c_18;
  c_1 = (c_1 + tmpvar_15);
  c_1.xyz = (c_1.xyz + tmpvar_7);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "TCP2_MC" }
""
}
}
 }
}
CustomEditor "TCP2_MaterialInspector"
Fallback "Diffuse"
}