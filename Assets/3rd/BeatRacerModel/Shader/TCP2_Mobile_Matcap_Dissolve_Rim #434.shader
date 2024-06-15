//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Beatracer/Toony Colors Pro 2/Variants/Mobile Matcap Dissolve Rim" {
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
 _MatCap2 ("#MC# MatCap2 (RGB)", 2D) = "black" { }
 _BlendAmount ("#MC# Blend Amount", Range(0.000000,1.000000)) = 0.000000
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  GpuProgramID 24848
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 v_34;
  v_34.x = tmpvar_18;
  v_34.y = tmpvar_19;
  v_34.z = tmpvar_20;
  v_34.w = tmpvar_21;
  highp vec4 v_35;
  v_35.x = tmpvar_23;
  v_35.y = tmpvar_24;
  v_35.z = tmpvar_25;
  v_35.w = tmpvar_26;
  highp vec4 v_36;
  v_36.x = tmpvar_28;
  v_36.y = tmpvar_29;
  v_36.z = tmpvar_30;
  v_36.w = tmpvar_31;
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
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * (unity_ObjectToWorld * _glesVertex));
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_15;
  mediump vec3 lightDir_16;
  lightDir_16 = lightDir_3;
  lowp vec4 c_17;
  lowp vec3 ramp_18;
  lowp float ndl_19;
  mediump float tmpvar_20;
  tmpvar_20 = max (0.0, ((
    dot (tmpvar_2, lightDir_16)
   * 0.5) + 0.5));
  ndl_19 = tmpvar_20;
  highp float edge0_21;
  highp float tmpvar_22;
  tmpvar_22 = (_RampSmooth * 0.5);
  edge0_21 = (_RampThreshold - tmpvar_22);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((ndl_19 - edge0_21) / (
    (_RampThreshold + tmpvar_22)
   - edge0_21)), 0.0, 1.0);
  highp vec3 tmpvar_24;
  tmpvar_24 = vec3((tmpvar_23 * (tmpvar_23 * (3.0 - 
    (2.0 * tmpvar_23)
  ))));
  ramp_18 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_18);
  ramp_18 = tmpvar_25;
  c_17.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_25);
  c_17.w = tmpvar_8;
  tmpvar_15 = c_17;
  c_1 = (c_1 + tmpvar_15);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_34);
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_34);
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD7;
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
  mediump vec2 tmpvar_10;
  highp vec3 worldNorm_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp float tmpvar_13;
  tmpvar_13 = clamp (dot (normalize(
    ((unity_WorldToObject * tmpvar_12).xyz - _glesVertex.xyz)
  ), _glesNormal), 0.0, 1.0);
  mediump float tmpvar_14;
  tmpvar_14 = (1.0 - tmpvar_13);
  mediump float tmpvar_15;
  mediump float tmpvar_16;
  tmpvar_16 = clamp (((tmpvar_14 - _RimMin) / (_RimMax - _RimMin)), 0.0, 1.0);
  tmpvar_15 = (tmpvar_16 * (tmpvar_16 * (3.0 - 
    (2.0 * tmpvar_16)
  )));
  tmpvar_8 = (tmpvar_15 * _RimColor.w);
  highp vec4 v_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[0].x;
  v_17.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[1].x;
  v_17.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[2].x;
  v_17.z = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[3].x;
  v_17.w = tmpvar_21;
  highp vec4 v_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[0].y;
  v_22.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[1].y;
  v_22.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[2].y;
  v_22.z = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[3].y;
  v_22.w = tmpvar_26;
  highp vec4 v_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[0].z;
  v_27.x = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[1].z;
  v_27.y = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = unity_WorldToObject[2].z;
  v_27.z = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = unity_WorldToObject[3].z;
  v_27.w = tmpvar_31;
  highp mat3 tmpvar_32;
  tmpvar_32[0] = unity_MatrixV[0].xyz;
  tmpvar_32[1] = unity_MatrixV[1].xyz;
  tmpvar_32[2] = unity_MatrixV[2].xyz;
  worldNorm_11 = (tmpvar_32 * normalize((
    ((v_17.xyz * _glesNormal.x) + (v_22.xyz * _glesNormal.y))
   + 
    (v_27.xyz * _glesNormal.z)
  )));
  tmpvar_9 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_10 = ((worldNorm_11.xy * 0.5) + 0.5);
  tmpvar_5.x = tmpvar_8;
  tmpvar_5.yz = tmpvar_9;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = _glesVertex.xyz;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * _glesVertex);
  highp vec4 v_35;
  v_35.x = tmpvar_18;
  v_35.y = tmpvar_19;
  v_35.z = tmpvar_20;
  v_35.w = tmpvar_21;
  highp vec4 v_36;
  v_36.x = tmpvar_23;
  v_36.y = tmpvar_24;
  v_36.z = tmpvar_25;
  v_36.w = tmpvar_26;
  highp vec4 v_37;
  v_37.x = tmpvar_28;
  v_37.y = tmpvar_29;
  v_37.z = tmpvar_30;
  v_37.w = tmpvar_31;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * _glesNormal.x)
   + 
    (v_36.xyz * _glesNormal.y)
  ) + (v_37.xyz * _glesNormal.z)));
  worldNormal_2 = tmpvar_38;
  tmpvar_4 = worldNormal_2;
  lowp vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = worldNormal_2;
  mediump vec4 normal_40;
  normal_40 = tmpvar_39;
  mediump vec3 res_41;
  mediump vec3 x_42;
  x_42.x = dot (unity_SHAr, normal_40);
  x_42.y = dot (unity_SHAg, normal_40);
  x_42.z = dot (unity_SHAb, normal_40);
  mediump vec3 x1_43;
  mediump vec4 tmpvar_44;
  tmpvar_44 = (normal_40.xyzz * normal_40.yzzx);
  x1_43.x = dot (unity_SHBr, tmpvar_44);
  x1_43.y = dot (unity_SHBg, tmpvar_44);
  x1_43.z = dot (unity_SHBb, tmpvar_44);
  res_41 = (x_42 + (x1_43 + (unity_SHC.xyz * 
    ((normal_40.x * normal_40.x) - (normal_40.y * normal_40.y))
  )));
  res_41 = max (((1.055 * 
    pow (max (res_41, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  shlight_1 = res_41;
  tmpvar_6 = shlight_1;
  highp vec3 lightColor0_45;
  lightColor0_45 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_46;
  lightColor1_46 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_47;
  lightColor2_47 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_48;
  lightColor3_48 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_49;
  lightAttenSq_49 = unity_4LightAtten0;
  highp vec3 normal_50;
  normal_50 = worldNormal_2;
  highp vec3 col_51;
  highp vec4 ndotl_52;
  highp vec4 lengthSq_53;
  highp vec4 tmpvar_54;
  tmpvar_54 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_53 = (tmpvar_54 * tmpvar_54);
  lengthSq_53 = (lengthSq_53 + (tmpvar_55 * tmpvar_55));
  lengthSq_53 = (lengthSq_53 + (tmpvar_56 * tmpvar_56));
  ndotl_52 = (tmpvar_54 * normal_50.x);
  ndotl_52 = (ndotl_52 + (tmpvar_55 * normal_50.y));
  ndotl_52 = (ndotl_52 + (tmpvar_56 * normal_50.z));
  highp vec4 tmpvar_57;
  tmpvar_57 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_52 * inversesqrt(lengthSq_53)));
  ndotl_52 = tmpvar_57;
  highp vec4 tmpvar_58;
  tmpvar_58 = (tmpvar_57 * (1.0/((1.0 + 
    (lengthSq_53 * lightAttenSq_49)
  ))));
  col_51 = (lightColor0_45 * tmpvar_58.x);
  col_51 = (col_51 + (lightColor1_46 * tmpvar_58.y));
  col_51 = (col_51 + (lightColor2_47 * tmpvar_58.z));
  col_51 = (col_51 + (lightColor3_48 * tmpvar_58.w));
  tmpvar_6 = (tmpvar_6 + col_51);
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_10;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = (unity_WorldToShadow[0] * tmpvar_34);
  xlv_TEXCOORD7 = tmpvar_7;
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
uniform sampler2D _MatCap2;
uniform lowp vec4 _RimColor;
uniform highp float _BlendAmount;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec4 xlv_TEXCOORD5;
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
  lowp vec3 blend_9;
  mediump vec4 main_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  main_10 = tmpvar_11;
  tmpvar_6 = (main_10.xyz * _Color.xyz);
  tmpvar_8 = (main_10.w * _Color.w);
  tmpvar_7 = (tmpvar_4 * _RimColor.xyz);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MatCap, xlv_TEXCOORD2.yz);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MatCap2, xlv_TEXCOORD3);
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (tmpvar_12.xyz, tmpvar_13.xyz, vec3(_BlendAmount));
  blend_9 = tmpvar_14;
  tmpvar_7 = (tmpvar_7 + blend_9);
  lowp float tmpvar_15;
  highp float lightShadowDataX_16;
  mediump float tmpvar_17;
  tmpvar_17 = _LightShadowData.x;
  lightShadowDataX_16 = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = max (float((texture2D (_ShadowMapTexture, xlv_TEXCOORD5.xy).x > xlv_TEXCOORD5.z)), lightShadowDataX_16);
  tmpvar_15 = tmpvar_18;
  c_1.w = 0.0;
  c_1.xyz = (tmpvar_6 * xlv_TEXCOORD4);
  mediump vec4 tmpvar_19;
  mediump vec3 lightDir_20;
  lightDir_20 = lightDir_3;
  mediump float atten_21;
  atten_21 = tmpvar_15;
  lowp vec4 c_22;
  lowp vec3 ramp_23;
  lowp float ndl_24;
  mediump float tmpvar_25;
  tmpvar_25 = max (0.0, ((
    dot (tmpvar_2, lightDir_20)
   * 0.5) + 0.5));
  ndl_24 = tmpvar_25;
  highp float edge0_26;
  highp float tmpvar_27;
  tmpvar_27 = (_RampSmooth * 0.5);
  edge0_26 = (_RampThreshold - tmpvar_27);
  highp float tmpvar_28;
  tmpvar_28 = clamp (((ndl_24 - edge0_26) / (
    (_RampThreshold + tmpvar_27)
   - edge0_26)), 0.0, 1.0);
  highp vec3 tmpvar_29;
  tmpvar_29 = vec3((tmpvar_28 * (tmpvar_28 * (3.0 - 
    (2.0 * tmpvar_28)
  ))));
  ramp_23 = tmpvar_29;
  ramp_23 = (ramp_23 * atten_21);
  lowp vec3 tmpvar_30;
  tmpvar_30 = mix (mix (_HColor, _SColor, _SColor.wwww).xyz, _HColor.xyz, ramp_23);
  ramp_23 = tmpvar_30;
  c_22.xyz = ((tmpvar_6 * _LightColor0.xyz) * tmpvar_30);
  c_22.w = tmpvar_8;
  tmpvar_19 = c_22;
  c_1 = (c_1 + tmpvar_19);
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