//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Distance Field (Surface)" {
Properties {
 _FaceTex ("Fill Texture", 2D) = "white" { }
 _FaceUVSpeedX ("Face UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _FaceUVSpeedY ("Face UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _FaceColor ("Fill Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _FaceDilate ("Face Dilate", Range(-1.000000,1.000000)) = 0.000000
 _OutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _OutlineTex ("Outline Texture", 2D) = "white" { }
 _OutlineUVSpeedX ("Outline UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _OutlineUVSpeedY ("Outline UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _OutlineWidth ("Outline Thickness", Range(0.000000,1.000000)) = 0.000000
 _OutlineSoftness ("Outline Softness", Range(0.000000,1.000000)) = 0.000000
 _Bevel ("Bevel", Range(0.000000,1.000000)) = 0.500000
 _BevelOffset ("Bevel Offset", Range(-0.500000,0.500000)) = 0.000000
 _BevelWidth ("Bevel Width", Range(-0.500000,0.500000)) = 0.000000
 _BevelClamp ("Bevel Clamp", Range(0.000000,1.000000)) = 0.000000
 _BevelRoundness ("Bevel Roundness", Range(0.000000,1.000000)) = 0.000000
 _BumpMap ("Normalmap", 2D) = "bump" { }
 _BumpOutline ("Bump Outline", Range(0.000000,1.000000)) = 0.500000
 _BumpFace ("Bump Face", Range(0.000000,1.000000)) = 0.500000
 _ReflectFaceColor ("Face Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _ReflectOutlineColor ("Outline Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _Cube ("Reflection Cubemap", CUBE) = "black" { }
 _EnvMatrixRotation ("Texture Rotation", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _SpecColor ("Specular Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _FaceShininess ("Face Shininess", Range(0.000000,1.000000)) = 0.000000
 _OutlineShininess ("Outline Shininess", Range(0.000000,1.000000)) = 0.000000
 _GlowColor ("Color", Color) = (0.000000,1.000000,0.000000,0.500000)
 _GlowOffset ("Offset", Range(-1.000000,1.000000)) = 0.000000
 _GlowInner ("Inner", Range(0.000000,1.000000)) = 0.050000
 _GlowOuter ("Outer", Range(0.000000,1.000000)) = 0.050000
 _GlowPower ("Falloff", Range(1.000000,0.000000)) = 0.750000
 _WeightNormal ("Weight Normal", Float) = 0.000000
 _WeightBold ("Weight Bold", Float) = 0.500000
 _ShaderFlags ("Flags", Float) = 0.000000
 _ScaleRatioA ("Scale RatioA", Float) = 1.000000
 _ScaleRatioB ("Scale RatioB", Float) = 1.000000
 _ScaleRatioC ("Scale RatioC", Float) = 1.000000
 _MainTex ("Font Atlas", 2D) = "white" { }
 _TextureWidth ("Texture Width", Float) = 512.000000
 _TextureHeight ("Texture Height", Float) = 512.000000
 _GradientScale ("Gradient Scale", Float) = 5.000000
 _ScaleX ("Scale X", Float) = 1.000000
 _ScaleY ("Scale Y", Float) = 1.000000
 _PerspectiveFilter ("Perspective Correction", Range(0.000000,1.000000)) = 0.875000
 _VertexOffsetX ("Vertex OffsetX", Float) = 0.000000
 _VertexOffsetY ("Vertex OffsetY", Float) = 0.000000
}
SubShader { 
 LOD 300
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull [_CullMode]
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  GpuProgramID 23880
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_6.x)
   + 
    (v_35.xyz * tmpvar_6.y)
  ) + (v_36.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  mediump vec3 normal_45;
  normal_45 = worldNormal_3;
  mediump vec3 x1_46;
  mediump vec4 tmpvar_47;
  tmpvar_47 = (normal_45.xyzz * normal_45.yzzx);
  x1_46.x = dot (unity_SHBr, tmpvar_47);
  x1_46.y = dot (unity_SHBg, tmpvar_47);
  x1_46.z = dot (unity_SHBb, tmpvar_47);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_46 + (unity_SHC.xyz * (
    (normal_45.x * normal_45.x)
   - 
    (normal_45.y * normal_45.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_6.x)
   + 
    (v_35.xyz * tmpvar_6.y)
  ) + (v_36.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  mediump vec3 normal_45;
  normal_45 = worldNormal_3;
  mediump vec3 x1_46;
  mediump vec4 tmpvar_47;
  tmpvar_47 = (normal_45.xyzz * normal_45.yzzx);
  x1_46.x = dot (unity_SHBr, tmpvar_47);
  x1_46.y = dot (unity_SHBg, tmpvar_47);
  x1_46.z = dot (unity_SHBb, tmpvar_47);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_46 + (unity_SHC.xyz * (
    (normal_45.x * normal_45.x)
   - 
    (normal_45.y * normal_45.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_33;
  tmpvar_33 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp vec4 v_34;
  v_34.x = tmpvar_15;
  v_34.y = tmpvar_16;
  v_34.z = tmpvar_17;
  v_34.w = tmpvar_18;
  highp vec4 v_35;
  v_35.x = tmpvar_20;
  v_35.y = tmpvar_21;
  v_35.z = tmpvar_22;
  v_35.w = tmpvar_23;
  highp vec4 v_36;
  v_36.x = tmpvar_25;
  v_36.y = tmpvar_26;
  v_36.z = tmpvar_27;
  v_36.w = tmpvar_28;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(((
    (v_34.xyz * tmpvar_6.x)
   + 
    (v_35.xyz * tmpvar_6.y)
  ) + (v_36.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_37;
  highp mat3 tmpvar_38;
  tmpvar_38[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_38[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_38[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize((tmpvar_38 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_40;
  lowp vec3 tmpvar_41;
  tmpvar_41 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_42;
  tmpvar_42.x = worldTangent_2.x;
  tmpvar_42.y = tmpvar_41.x;
  tmpvar_42.z = worldNormal_3.x;
  tmpvar_42.w = tmpvar_33.x;
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.y;
  tmpvar_43.y = tmpvar_41.y;
  tmpvar_43.z = worldNormal_3.y;
  tmpvar_43.w = tmpvar_33.y;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.z;
  tmpvar_44.y = tmpvar_41.z;
  tmpvar_44.z = worldNormal_3.z;
  tmpvar_44.w = tmpvar_33.z;
  mediump vec3 normal_45;
  normal_45 = worldNormal_3;
  mediump vec3 x1_46;
  mediump vec4 tmpvar_47;
  tmpvar_47 = (normal_45.xyzz * normal_45.yzzx);
  x1_46.x = dot (unity_SHBr, tmpvar_47);
  x1_46.y = dot (unity_SHBg, tmpvar_47);
  x1_46.z = dot (unity_SHBb, tmpvar_47);
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_42;
  xlv_TEXCOORD2 = tmpvar_43;
  xlv_TEXCOORD3 = tmpvar_44;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_8;
  xlv_TEXCOORD5 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD6 = (x1_46 + (unity_SHC.xyz * (
    (normal_45.x * normal_45.x)
   - 
    (normal_45.y * normal_45.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[0].x;
  v_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[1].x;
  v_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[2].x;
  v_15.z = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[3].x;
  v_15.w = tmpvar_19;
  highp vec4 v_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[0].y;
  v_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[1].y;
  v_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[2].y;
  v_20.z = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[3].y;
  v_20.w = tmpvar_24;
  highp vec4 v_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[0].z;
  v_25.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[1].z;
  v_25.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[2].z;
  v_25.z = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[3].z;
  v_25.w = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((((v_15.xyz * tmpvar_7.x) + (v_20.xyz * tmpvar_7.y)) + (v_25.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_30;
  tmpvar_9.y = tmpvar_30;
  tmpvar_9.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_31;
  xlat_varoutput_31.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_31.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_31.x));
  tmpvar_8.xy = (xlat_varoutput_31 * 0.001953125);
  highp mat3 tmpvar_32;
  tmpvar_32[0] = _EnvMatrix[0].xyz;
  tmpvar_32[1] = _EnvMatrix[1].xyz;
  tmpvar_32[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_16;
  v_35.y = tmpvar_17;
  v_35.z = tmpvar_18;
  v_35.w = tmpvar_19;
  highp vec4 v_36;
  v_36.x = tmpvar_21;
  v_36.y = tmpvar_22;
  v_36.z = tmpvar_23;
  v_36.w = tmpvar_24;
  highp vec4 v_37;
  v_37.x = tmpvar_26;
  v_37.y = tmpvar_27;
  v_37.z = tmpvar_28;
  v_37.w = tmpvar_29;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * tmpvar_7.x)
   + 
    (v_36.xyz * tmpvar_7.y)
  ) + (v_37.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_38;
  highp mat3 tmpvar_39;
  tmpvar_39[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_39[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_39[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_40;
  tmpvar_40 = normalize((tmpvar_39 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_40;
  highp float tmpvar_41;
  tmpvar_41 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.x;
  tmpvar_43.y = tmpvar_42.x;
  tmpvar_43.z = worldNormal_3.x;
  tmpvar_43.w = tmpvar_34.x;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.y;
  tmpvar_44.y = tmpvar_42.y;
  tmpvar_44.z = worldNormal_3.y;
  tmpvar_44.w = tmpvar_34.y;
  highp vec4 tmpvar_45;
  tmpvar_45.x = worldTangent_2.z;
  tmpvar_45.y = tmpvar_42.z;
  tmpvar_45.z = worldNormal_3.z;
  tmpvar_45.w = tmpvar_34.z;
  highp vec3 lightColor0_46;
  lightColor0_46 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_47;
  lightColor1_47 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_48;
  lightColor2_48 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_49;
  lightColor3_49 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_50;
  lightAttenSq_50 = unity_4LightAtten0;
  highp vec3 normal_51;
  normal_51 = worldNormal_3;
  highp vec3 col_52;
  highp vec4 ndotl_53;
  highp vec4 lengthSq_54;
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_57;
  tmpvar_57 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_54 = (tmpvar_55 * tmpvar_55);
  lengthSq_54 = (lengthSq_54 + (tmpvar_56 * tmpvar_56));
  lengthSq_54 = (lengthSq_54 + (tmpvar_57 * tmpvar_57));
  ndotl_53 = (tmpvar_55 * normal_51.x);
  ndotl_53 = (ndotl_53 + (tmpvar_56 * normal_51.y));
  ndotl_53 = (ndotl_53 + (tmpvar_57 * normal_51.z));
  highp vec4 tmpvar_58;
  tmpvar_58 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_53 * inversesqrt(lengthSq_54)));
  ndotl_53 = tmpvar_58;
  highp vec4 tmpvar_59;
  tmpvar_59 = (tmpvar_58 * (1.0/((1.0 + 
    (lengthSq_54 * lightAttenSq_50)
  ))));
  col_52 = (lightColor0_46 * tmpvar_59.x);
  col_52 = (col_52 + (lightColor1_47 * tmpvar_59.y));
  col_52 = (col_52 + (lightColor2_48 * tmpvar_59.z));
  col_52 = (col_52 + (lightColor3_49 * tmpvar_59.w));
  tmpvar_5 = col_52;
  mediump vec3 normal_60;
  normal_60 = worldNormal_3;
  mediump vec3 ambient_61;
  ambient_61 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_62;
  mediump vec4 tmpvar_63;
  tmpvar_63 = (normal_60.xyzz * normal_60.yzzx);
  x1_62.x = dot (unity_SHBr, tmpvar_63);
  x1_62.y = dot (unity_SHBg, tmpvar_63);
  x1_62.z = dot (unity_SHBb, tmpvar_63);
  ambient_61 = (ambient_61 + (x1_62 + (unity_SHC.xyz * 
    ((normal_60.x * normal_60.x) - (normal_60.y * normal_60.y))
  )));
  tmpvar_5 = ambient_61;
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_43;
  xlv_TEXCOORD2 = tmpvar_44;
  xlv_TEXCOORD3 = tmpvar_45;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_9;
  xlv_TEXCOORD5 = (tmpvar_32 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_61;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[0].x;
  v_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[1].x;
  v_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[2].x;
  v_15.z = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[3].x;
  v_15.w = tmpvar_19;
  highp vec4 v_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[0].y;
  v_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[1].y;
  v_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[2].y;
  v_20.z = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[3].y;
  v_20.w = tmpvar_24;
  highp vec4 v_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[0].z;
  v_25.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[1].z;
  v_25.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[2].z;
  v_25.z = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[3].z;
  v_25.w = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((((v_15.xyz * tmpvar_7.x) + (v_20.xyz * tmpvar_7.y)) + (v_25.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_30;
  tmpvar_9.y = tmpvar_30;
  tmpvar_9.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_31;
  xlat_varoutput_31.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_31.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_31.x));
  tmpvar_8.xy = (xlat_varoutput_31 * 0.001953125);
  highp mat3 tmpvar_32;
  tmpvar_32[0] = _EnvMatrix[0].xyz;
  tmpvar_32[1] = _EnvMatrix[1].xyz;
  tmpvar_32[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_16;
  v_35.y = tmpvar_17;
  v_35.z = tmpvar_18;
  v_35.w = tmpvar_19;
  highp vec4 v_36;
  v_36.x = tmpvar_21;
  v_36.y = tmpvar_22;
  v_36.z = tmpvar_23;
  v_36.w = tmpvar_24;
  highp vec4 v_37;
  v_37.x = tmpvar_26;
  v_37.y = tmpvar_27;
  v_37.z = tmpvar_28;
  v_37.w = tmpvar_29;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * tmpvar_7.x)
   + 
    (v_36.xyz * tmpvar_7.y)
  ) + (v_37.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_38;
  highp mat3 tmpvar_39;
  tmpvar_39[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_39[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_39[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_40;
  tmpvar_40 = normalize((tmpvar_39 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_40;
  highp float tmpvar_41;
  tmpvar_41 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.x;
  tmpvar_43.y = tmpvar_42.x;
  tmpvar_43.z = worldNormal_3.x;
  tmpvar_43.w = tmpvar_34.x;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.y;
  tmpvar_44.y = tmpvar_42.y;
  tmpvar_44.z = worldNormal_3.y;
  tmpvar_44.w = tmpvar_34.y;
  highp vec4 tmpvar_45;
  tmpvar_45.x = worldTangent_2.z;
  tmpvar_45.y = tmpvar_42.z;
  tmpvar_45.z = worldNormal_3.z;
  tmpvar_45.w = tmpvar_34.z;
  highp vec3 lightColor0_46;
  lightColor0_46 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_47;
  lightColor1_47 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_48;
  lightColor2_48 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_49;
  lightColor3_49 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_50;
  lightAttenSq_50 = unity_4LightAtten0;
  highp vec3 normal_51;
  normal_51 = worldNormal_3;
  highp vec3 col_52;
  highp vec4 ndotl_53;
  highp vec4 lengthSq_54;
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_57;
  tmpvar_57 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_54 = (tmpvar_55 * tmpvar_55);
  lengthSq_54 = (lengthSq_54 + (tmpvar_56 * tmpvar_56));
  lengthSq_54 = (lengthSq_54 + (tmpvar_57 * tmpvar_57));
  ndotl_53 = (tmpvar_55 * normal_51.x);
  ndotl_53 = (ndotl_53 + (tmpvar_56 * normal_51.y));
  ndotl_53 = (ndotl_53 + (tmpvar_57 * normal_51.z));
  highp vec4 tmpvar_58;
  tmpvar_58 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_53 * inversesqrt(lengthSq_54)));
  ndotl_53 = tmpvar_58;
  highp vec4 tmpvar_59;
  tmpvar_59 = (tmpvar_58 * (1.0/((1.0 + 
    (lengthSq_54 * lightAttenSq_50)
  ))));
  col_52 = (lightColor0_46 * tmpvar_59.x);
  col_52 = (col_52 + (lightColor1_47 * tmpvar_59.y));
  col_52 = (col_52 + (lightColor2_48 * tmpvar_59.z));
  col_52 = (col_52 + (lightColor3_49 * tmpvar_59.w));
  tmpvar_5 = col_52;
  mediump vec3 normal_60;
  normal_60 = worldNormal_3;
  mediump vec3 ambient_61;
  ambient_61 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_62;
  mediump vec4 tmpvar_63;
  tmpvar_63 = (normal_60.xyzz * normal_60.yzzx);
  x1_62.x = dot (unity_SHBr, tmpvar_63);
  x1_62.y = dot (unity_SHBg, tmpvar_63);
  x1_62.z = dot (unity_SHBb, tmpvar_63);
  ambient_61 = (ambient_61 + (x1_62 + (unity_SHC.xyz * 
    ((normal_60.x * normal_60.x) - (normal_60.y * normal_60.y))
  )));
  tmpvar_5 = ambient_61;
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_43;
  xlv_TEXCOORD2 = tmpvar_44;
  xlv_TEXCOORD3 = tmpvar_45;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_9;
  xlv_TEXCOORD5 = (tmpvar_32 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_61;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((glstate_matrix_mvp * tmpvar_6).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[0].x;
  v_15.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[1].x;
  v_15.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[2].x;
  v_15.z = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = unity_WorldToObject[3].x;
  v_15.w = tmpvar_19;
  highp vec4 v_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[0].y;
  v_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[1].y;
  v_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[2].y;
  v_20.z = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = unity_WorldToObject[3].y;
  v_20.w = tmpvar_24;
  highp vec4 v_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[0].z;
  v_25.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[1].z;
  v_25.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[2].z;
  v_25.z = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = unity_WorldToObject[3].z;
  v_25.w = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((((v_15.xyz * tmpvar_7.x) + (v_20.xyz * tmpvar_7.y)) + (v_25.xyz * tmpvar_7.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_30;
  tmpvar_9.y = tmpvar_30;
  tmpvar_9.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_31;
  xlat_varoutput_31.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_31.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_31.x));
  tmpvar_8.xy = (xlat_varoutput_31 * 0.001953125);
  highp mat3 tmpvar_32;
  tmpvar_32[0] = _EnvMatrix[0].xyz;
  tmpvar_32[1] = _EnvMatrix[1].xyz;
  tmpvar_32[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_34;
  tmpvar_34 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp vec4 v_35;
  v_35.x = tmpvar_16;
  v_35.y = tmpvar_17;
  v_35.z = tmpvar_18;
  v_35.w = tmpvar_19;
  highp vec4 v_36;
  v_36.x = tmpvar_21;
  v_36.y = tmpvar_22;
  v_36.z = tmpvar_23;
  v_36.w = tmpvar_24;
  highp vec4 v_37;
  v_37.x = tmpvar_26;
  v_37.y = tmpvar_27;
  v_37.z = tmpvar_28;
  v_37.w = tmpvar_29;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize(((
    (v_35.xyz * tmpvar_7.x)
   + 
    (v_36.xyz * tmpvar_7.y)
  ) + (v_37.xyz * tmpvar_7.z)));
  worldNormal_3 = tmpvar_38;
  highp mat3 tmpvar_39;
  tmpvar_39[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_39[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_39[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_40;
  tmpvar_40 = normalize((tmpvar_39 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_40;
  highp float tmpvar_41;
  tmpvar_41 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_41;
  lowp vec3 tmpvar_42;
  tmpvar_42 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_43;
  tmpvar_43.x = worldTangent_2.x;
  tmpvar_43.y = tmpvar_42.x;
  tmpvar_43.z = worldNormal_3.x;
  tmpvar_43.w = tmpvar_34.x;
  highp vec4 tmpvar_44;
  tmpvar_44.x = worldTangent_2.y;
  tmpvar_44.y = tmpvar_42.y;
  tmpvar_44.z = worldNormal_3.y;
  tmpvar_44.w = tmpvar_34.y;
  highp vec4 tmpvar_45;
  tmpvar_45.x = worldTangent_2.z;
  tmpvar_45.y = tmpvar_42.z;
  tmpvar_45.z = worldNormal_3.z;
  tmpvar_45.w = tmpvar_34.z;
  highp vec3 lightColor0_46;
  lightColor0_46 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_47;
  lightColor1_47 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_48;
  lightColor2_48 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_49;
  lightColor3_49 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_50;
  lightAttenSq_50 = unity_4LightAtten0;
  highp vec3 normal_51;
  normal_51 = worldNormal_3;
  highp vec3 col_52;
  highp vec4 ndotl_53;
  highp vec4 lengthSq_54;
  highp vec4 tmpvar_55;
  tmpvar_55 = (unity_4LightPosX0 - tmpvar_34.x);
  highp vec4 tmpvar_56;
  tmpvar_56 = (unity_4LightPosY0 - tmpvar_34.y);
  highp vec4 tmpvar_57;
  tmpvar_57 = (unity_4LightPosZ0 - tmpvar_34.z);
  lengthSq_54 = (tmpvar_55 * tmpvar_55);
  lengthSq_54 = (lengthSq_54 + (tmpvar_56 * tmpvar_56));
  lengthSq_54 = (lengthSq_54 + (tmpvar_57 * tmpvar_57));
  ndotl_53 = (tmpvar_55 * normal_51.x);
  ndotl_53 = (ndotl_53 + (tmpvar_56 * normal_51.y));
  ndotl_53 = (ndotl_53 + (tmpvar_57 * normal_51.z));
  highp vec4 tmpvar_58;
  tmpvar_58 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_53 * inversesqrt(lengthSq_54)));
  ndotl_53 = tmpvar_58;
  highp vec4 tmpvar_59;
  tmpvar_59 = (tmpvar_58 * (1.0/((1.0 + 
    (lengthSq_54 * lightAttenSq_50)
  ))));
  col_52 = (lightColor0_46 * tmpvar_59.x);
  col_52 = (col_52 + (lightColor1_47 * tmpvar_59.y));
  col_52 = (col_52 + (lightColor2_48 * tmpvar_59.z));
  col_52 = (col_52 + (lightColor3_49 * tmpvar_59.w));
  tmpvar_5 = col_52;
  mediump vec3 normal_60;
  normal_60 = worldNormal_3;
  mediump vec3 ambient_61;
  ambient_61 = (tmpvar_5 * ((tmpvar_5 * 
    ((tmpvar_5 * 0.305306) + 0.6821711)
  ) + 0.01252288));
  mediump vec3 x1_62;
  mediump vec4 tmpvar_63;
  tmpvar_63 = (normal_60.xyzz * normal_60.yzzx);
  x1_62.x = dot (unity_SHBr, tmpvar_63);
  x1_62.y = dot (unity_SHBg, tmpvar_63);
  x1_62.z = dot (unity_SHBb, tmpvar_63);
  ambient_61 = (ambient_61 + (x1_62 + (unity_SHC.xyz * 
    ((normal_60.x * normal_60.x) - (normal_60.y * normal_60.y))
  )));
  tmpvar_5 = ambient_61;
  gl_Position = (glstate_matrix_mvp * tmpvar_33);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_43;
  xlv_TEXCOORD2 = tmpvar_44;
  xlv_TEXCOORD3 = tmpvar_45;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD4 = tmpvar_9;
  xlv_TEXCOORD5 = (tmpvar_32 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD6 = ambient_61;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD1.w;
  tmpvar_12.y = xlv_TEXCOORD2.w;
  tmpvar_12.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  worldViewDir_10 = tmpvar_14;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp vec3 tmpvar_17;
  lowp float tmpvar_18;
  lowp float tmpvar_19;
  tmpvar_15 = tmpvar_5;
  tmpvar_16 = tmpvar_6;
  tmpvar_17 = tmpvar_7;
  tmpvar_18 = tmpvar_8;
  tmpvar_19 = tmpvar_9;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD4.x) * xlv_TEXCOORD4.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD4.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD4.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD4.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD5 - (2.0 * (
    dot (N_61, xlv_TEXCOORD5)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec3 tmpvar_65;
  tmpvar_65 = ((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w);
  tmpvar_15 = faceColor_22.xyz;
  tmpvar_16 = -(tmpvar_58);
  tmpvar_17 = tmpvar_65;
  highp float tmpvar_66;
  tmpvar_66 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_18 = 1.0;
  tmpvar_19 = faceColor_22.w;
  tmpvar_5 = tmpvar_15;
  tmpvar_7 = tmpvar_17;
  tmpvar_8 = tmpvar_18;
  tmpvar_9 = tmpvar_19;
  highp float tmpvar_67;
  tmpvar_67 = dot (xlv_TEXCOORD1.xyz, tmpvar_16);
  worldN_3.x = tmpvar_67;
  highp float tmpvar_68;
  tmpvar_68 = dot (xlv_TEXCOORD2.xyz, tmpvar_16);
  worldN_3.y = tmpvar_68;
  highp float tmpvar_69;
  tmpvar_69 = dot (xlv_TEXCOORD3.xyz, tmpvar_16);
  worldN_3.z = tmpvar_69;
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_70;
  normalWorld_70 = worldN_3;
  mediump vec3 ambient_71;
  mediump vec4 tmpvar_72;
  tmpvar_72.w = 1.0;
  tmpvar_72.xyz = normalWorld_70;
  mediump vec3 x_73;
  x_73.x = dot (unity_SHAr, tmpvar_72);
  x_73.y = dot (unity_SHAg, tmpvar_72);
  x_73.z = dot (unity_SHAb, tmpvar_72);
  ambient_71 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD6 + x_73)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_74;
  viewDir_74 = worldViewDir_10;
  lowp vec4 c_75;
  lowp vec4 c_76;
  highp float nh_77;
  lowp float diff_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_78 = tmpvar_79;
  mediump float tmpvar_80;
  tmpvar_80 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_74)
  )));
  nh_77 = tmpvar_80;
  mediump float y_81;
  y_81 = (mix (_FaceShininess, _OutlineShininess, tmpvar_66) * 128.0);
  highp float tmpvar_82;
  tmpvar_82 = pow (nh_77, y_81);
  c_76.xyz = (((tmpvar_15 * tmpvar_1) * diff_78) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_82));
  c_76.w = tmpvar_19;
  c_75.w = c_76.w;
  c_75.xyz = (c_76.xyz + (tmpvar_15 * ambient_71));
  c_4.w = c_75.w;
  c_4.xyz = (c_75.xyz + tmpvar_17);
  gl_FragData[0] = c_4;
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
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull [_CullMode]
  Blend SrcAlpha One
  ColorMask RGB
  GpuProgramID 94129
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, vec2(tmpvar_67)).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_13 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_17;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  lowp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_11 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_10 = tmpvar_13;
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD4;
  highp vec4 tmpvar_67;
  tmpvar_67 = (unity_WorldToLight * tmpvar_66);
  lowp vec4 tmpvar_68;
  highp vec2 P_69;
  P_69 = ((tmpvar_67.xy / tmpvar_67.w) + 0.5);
  tmpvar_68 = texture2D (_LightTexture0, P_69);
  highp float tmpvar_70;
  tmpvar_70 = dot (tmpvar_67.xyz, tmpvar_67.xyz);
  lowp vec4 tmpvar_71;
  tmpvar_71 = texture2D (_LightTextureB0, vec2(tmpvar_70));
  highp float tmpvar_72;
  tmpvar_72 = ((float(
    (tmpvar_67.z > 0.0)
  ) * tmpvar_68.w) * tmpvar_71.w);
  atten_4 = tmpvar_72;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_15);
  tmpvar_6 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_10;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD4));
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec3 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xyz;
  highp float tmpvar_67;
  tmpvar_67 = dot (tmpvar_66, tmpvar_66);
  lowp float tmpvar_68;
  tmpvar_68 = (texture2D (_LightTextureB0, vec2(tmpvar_67)).w * textureCube (_LightTexture0, tmpvar_66).w);
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_68);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_9;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_13 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_17;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((glstate_matrix_mvp * tmpvar_5).ww / (tmpvar_12 * (tmpvar_13 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp vec4 v_14;
  highp float tmpvar_15;
  tmpvar_15 = unity_WorldToObject[0].x;
  v_14.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = unity_WorldToObject[1].x;
  v_14.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = unity_WorldToObject[2].x;
  v_14.z = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = unity_WorldToObject[3].x;
  v_14.w = tmpvar_18;
  highp vec4 v_19;
  highp float tmpvar_20;
  tmpvar_20 = unity_WorldToObject[0].y;
  v_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = unity_WorldToObject[1].y;
  v_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = unity_WorldToObject[2].y;
  v_19.z = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = unity_WorldToObject[3].y;
  v_19.w = tmpvar_23;
  highp vec4 v_24;
  highp float tmpvar_25;
  tmpvar_25 = unity_WorldToObject[0].z;
  v_24.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = unity_WorldToObject[1].z;
  v_24.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = unity_WorldToObject[2].z;
  v_24.z = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = unity_WorldToObject[3].z;
  v_24.w = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((((v_14.xyz * tmpvar_6.x) + (v_19.xyz * tmpvar_6.y)) + (v_24.xyz * tmpvar_6.z)))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_29;
  tmpvar_8.y = tmpvar_29;
  tmpvar_8.x = ((mix (_WeightNormal, _WeightBold, 
    float((0.0 >= _glesMultiTexCoord1.y))
  ) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  highp vec2 xlat_varoutput_30;
  xlat_varoutput_30.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_30.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_30.x));
  tmpvar_7.xy = (xlat_varoutput_30 * 0.001953125);
  highp mat3 tmpvar_31;
  tmpvar_31[0] = _EnvMatrix[0].xyz;
  tmpvar_31[1] = _EnvMatrix[1].xyz;
  tmpvar_31[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec4 v_33;
  v_33.x = tmpvar_15;
  v_33.y = tmpvar_16;
  v_33.z = tmpvar_17;
  v_33.w = tmpvar_18;
  highp vec4 v_34;
  v_34.x = tmpvar_20;
  v_34.y = tmpvar_21;
  v_34.z = tmpvar_22;
  v_34.w = tmpvar_23;
  highp vec4 v_35;
  v_35.x = tmpvar_25;
  v_35.y = tmpvar_26;
  v_35.z = tmpvar_27;
  v_35.w = tmpvar_28;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize(((
    (v_33.xyz * tmpvar_6.x)
   + 
    (v_34.xyz * tmpvar_6.y)
  ) + (v_35.xyz * tmpvar_6.z)));
  worldNormal_3 = tmpvar_36;
  highp mat3 tmpvar_37;
  tmpvar_37[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_37[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_37[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_38;
  tmpvar_38 = normalize((tmpvar_37 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_39;
  lowp vec3 tmpvar_40;
  tmpvar_40 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  lowp vec3 tmpvar_41;
  tmpvar_41.x = worldTangent_2.x;
  tmpvar_41.y = tmpvar_40.x;
  tmpvar_41.z = worldNormal_3.x;
  lowp vec3 tmpvar_42;
  tmpvar_42.x = worldTangent_2.y;
  tmpvar_42.y = tmpvar_40.y;
  tmpvar_42.z = worldNormal_3.y;
  lowp vec3 tmpvar_43;
  tmpvar_43.x = worldTangent_2.z;
  tmpvar_43.y = tmpvar_40.z;
  tmpvar_43.z = worldNormal_3.z;
  gl_Position = (glstate_matrix_mvp * tmpvar_32);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = tmpvar_41;
  xlv_TEXCOORD2 = tmpvar_42;
  xlv_TEXCOORD3 = tmpvar_43;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_31 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  lowp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  worldViewDir_9 = tmpvar_12;
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_4;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_59, xlv_TEXCOORD6)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_4 = tmpvar_13;
  tmpvar_6 = tmpvar_15;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD4;
  highp vec2 tmpvar_66;
  tmpvar_66 = (unity_WorldToLight * tmpvar_65).xy;
  lowp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, tmpvar_66).w;
  worldN_3.x = dot (xlv_TEXCOORD1, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD3, tmpvar_14);
  tmpvar_5 = worldN_3;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  tmpvar_1 = (tmpvar_1 * tmpvar_67);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_9;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (worldN_3, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (worldN_3, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
 }
 Pass {
  Name "CASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="Transparent" }
  Cull Off
  ColorMask RGB
  Offset 1.000000, 1.000000
  GpuProgramID 187670
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 glstate_matrix_mvp;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (glstate_matrix_mvp * tmpvar_2);
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_ObjectToWorld;
uniform highp vec4 _MainTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (glstate_matrix_mvp * tmpvar_1);
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier03 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
 }
}
CustomEditor "TMPro_SDFMaterialEditor"
}