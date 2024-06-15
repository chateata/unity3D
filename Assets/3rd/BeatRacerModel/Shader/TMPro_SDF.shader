//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Distance Field" {
Properties {
 _FaceTex ("Face Texture", 2D) = "white" { }
 _FaceUVSpeedX ("Face UV Speed X", Range(-5.000000,5.000000)) = 0.000000
 _FaceUVSpeedY ("Face UV Speed Y", Range(-5.000000,5.000000)) = 0.000000
 _FaceColor ("Face Color", Color) = (1.000000,1.000000,1.000000,1.000000)
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
 _LightAngle ("Light Angle", Range(0.000000,6.283185)) = 3.141600
 _SpecularColor ("Specular", Color) = (1.000000,1.000000,1.000000,1.000000)
 _SpecularPower ("Specular", Range(0.000000,4.000000)) = 2.000000
 _Reflectivity ("Reflectivity", Range(5.000000,15.000000)) = 10.000000
 _Diffuse ("Diffuse", Range(0.000000,1.000000)) = 0.500000
 _Ambient ("Ambient", Range(1.000000,0.000000)) = 0.500000
 _BumpMap ("Normal map", 2D) = "bump" { }
 _BumpOutline ("Bump Outline", Range(0.000000,1.000000)) = 0.000000
 _BumpFace ("Bump Face", Range(0.000000,1.000000)) = 0.000000
 _ReflectFaceColor ("Reflection Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _ReflectOutlineColor ("Reflection Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _Cube ("Reflection Cubemap", CUBE) = "black" { }
 _EnvMatrixRotation ("Texture Rotation", Vector) = (0.000000,0.000000,0.000000,0.000000)
 _UnderlayColor ("Border Color", Color) = (0.000000,0.000000,0.000000,0.500000)
 _UnderlayOffsetX ("Border OffsetX", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayOffsetY ("Border OffsetY", Range(-1.000000,1.000000)) = 0.000000
 _UnderlayDilate ("Border Dilate", Range(-1.000000,1.000000)) = 0.000000
 _UnderlaySoftness ("Border Softness", Range(0.000000,1.000000)) = 0.000000
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
 _MaskCoord ("Mask Coordinates", Vector) = (0.000000,0.000000,10000.000000,10000.000000)
 _ClipRect ("Clip Rect", Vector) = (-10000.000000,-10000.000000,10000.000000,10000.000000)
 _MaskSoftnessX ("Mask SoftnessX", Float) = 0.000000
 _MaskSoftnessY ("Mask SoftnessY", Float) = 0.000000
 _StencilComp ("Stencil Comparison", Float) = 8.000000
 _Stencil ("Stencil ID", Float) = 0.000000
 _StencilOp ("Stencil Operation", Float) = 0.000000
 _StencilWriteMask ("Stencil Write Mask", Float) = 255.000000
 _StencilReadMask ("Stencil Read Mask", Float) = 255.000000
 _ColorMask ("Color Mask", Float) = 15.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZTest [unity_GUIZTestMode]
  ZWrite Off
  Cull [_CullMode]
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend One OneMinusSrcAlpha
  ColorMask [_ColorMask]
  GpuProgramID 56738
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
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
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
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
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp float xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = (inversesqrt(dot (pixelSize_8, pixelSize_8)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_23;
  xlv_COLOR1 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_1.w;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_20;
  xlv_TEXCOORD3 = tmpvar_21;
  xlv_TEXCOORD4 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD2.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD2.z - c_4) * xlv_TEXCOORD2.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD2.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD2.y);
  faceColor_3 = xlv_COLOR;
  outlineColor_2 = xlv_COLOR1;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD1.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD1.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD1.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD1.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  highp float tmpvar_21;
  highp vec2 tmpvar_22;
  tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD3.x));
  tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD3.y));
  highp vec2 tmpvar_23;
  tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD3.xy, _ClipRect.xy)) * tmpvar_22);
  tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
  faceColor_3 = (faceColor_3 * tmpvar_21);
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
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
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
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
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp float xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = (inversesqrt(dot (pixelSize_8, pixelSize_8)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_23;
  xlv_COLOR1 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_1.w;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_20;
  xlv_TEXCOORD3 = tmpvar_21;
  xlv_TEXCOORD4 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD2.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD2.z - c_4) * xlv_TEXCOORD2.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD2.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD2.y);
  faceColor_3 = xlv_COLOR;
  outlineColor_2 = xlv_COLOR1;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD1.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD1.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD1.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD1.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  highp float tmpvar_21;
  highp vec2 tmpvar_22;
  tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD3.x));
  tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD3.y));
  highp vec2 tmpvar_23;
  tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD3.xy, _ClipRect.xy)) * tmpvar_22);
  tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
  faceColor_3 = (faceColor_3 * tmpvar_21);
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
"#version 100

#ifdef VERTEX
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
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
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
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying lowp float xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp vec4 outlineColor_3;
  highp vec4 faceColor_4;
  highp float opacity_5;
  highp float weight_6;
  highp float scale_7;
  highp vec2 pixelSize_8;
  highp vec4 vert_9;
  highp float tmpvar_10;
  tmpvar_10 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_9.zw = _glesVertex.zw;
  vert_9.x = (_glesVertex.x + _VertexOffsetX);
  vert_9.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11 = (glstate_matrix_mvp * vert_9);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_8 = (tmpvar_11.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_7 = (inversesqrt(dot (pixelSize_8, pixelSize_8)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp vec4 v_14;
    v_14.x = unity_WorldToObject[0].x;
    v_14.y = unity_WorldToObject[1].x;
    v_14.z = unity_WorldToObject[2].x;
    v_14.w = unity_WorldToObject[3].x;
    highp vec4 v_15;
    v_15.x = unity_WorldToObject[0].y;
    v_15.y = unity_WorldToObject[1].y;
    v_15.z = unity_WorldToObject[2].y;
    v_15.w = unity_WorldToObject[3].y;
    highp vec4 v_16;
    v_16.x = unity_WorldToObject[0].z;
    v_16.y = unity_WorldToObject[1].z;
    v_16.z = unity_WorldToObject[2].z;
    v_16.w = unity_WorldToObject[3].z;
    scale_7 = mix ((scale_7 * (1.0 - _PerspectiveFilter)), scale_7, abs(dot (
      normalize((((v_14.xyz * _glesNormal.x) + (v_15.xyz * _glesNormal.y)) + (v_16.xyz * _glesNormal.z)))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz))
    )));
  };
  weight_6 = ((mix (_WeightNormal, _WeightBold, tmpvar_10) / _GradientScale) + ((_FaceDilate * _ScaleRatioA) * 0.5));
  lowp float tmpvar_17;
  tmpvar_17 = tmpvar_1.w;
  opacity_5 = tmpvar_17;
  faceColor_4 = _FaceColor;
  faceColor_4.xyz = (faceColor_4.xyz * _glesColor.xyz);
  faceColor_4.w = (faceColor_4.w * opacity_5);
  outlineColor_3 = _OutlineColor;
  outlineColor_3.w = (outlineColor_3.w * opacity_5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  highp vec4 tmpvar_19;
  tmpvar_19.xy = tmpvar_2;
  tmpvar_19.zw = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_20;
  tmpvar_20.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_7)) - weight_6);
  tmpvar_20.y = scale_7;
  tmpvar_20.z = ((0.5 - weight_6) + (0.5 / scale_7));
  tmpvar_20.w = weight_6;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = vert_9.xy;
  tmpvar_21.zw = (0.5 / pixelSize_8);
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  lowp vec4 tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_23 = faceColor_4;
  tmpvar_24 = outlineColor_3;
  gl_Position = tmpvar_11;
  xlv_COLOR = tmpvar_23;
  xlv_COLOR1 = tmpvar_24;
  xlv_TEXCOORD0 = tmpvar_1.w;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_20;
  xlv_TEXCOORD3 = tmpvar_21;
  xlv_TEXCOORD4 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_9).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1.xy).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD2.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD2.z - c_4) * xlv_TEXCOORD2.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD2.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD2.y);
  faceColor_3 = xlv_COLOR;
  outlineColor_2 = xlv_COLOR1;
  highp vec2 tmpvar_10;
  tmpvar_10.x = (xlv_TEXCOORD1.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_10.y = (xlv_TEXCOORD1.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_FaceTex, tmpvar_10);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_12;
  tmpvar_12.x = (xlv_TEXCOORD1.z + (_OutlineUVSpeedX * _Time.y));
  tmpvar_12.y = (xlv_TEXCOORD1.w + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_OutlineTex, tmpvar_12);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_14;
  d_14 = tmpvar_7;
  lowp vec4 faceColor_15;
  faceColor_15 = faceColor_3;
  lowp vec4 outlineColor_16;
  outlineColor_16 = outlineColor_2;
  mediump float outline_17;
  outline_17 = tmpvar_8;
  mediump float softness_18;
  softness_18 = tmpvar_9;
  mediump float tmpvar_19;
  tmpvar_19 = (1.0 - clamp ((
    ((d_14 - (outline_17 * 0.5)) + (softness_18 * 0.5))
   / 
    (1.0 + softness_18)
  ), 0.0, 1.0));
  faceColor_15.xyz = (faceColor_15.xyz * faceColor_15.w);
  outlineColor_16.xyz = (outlineColor_16.xyz * outlineColor_16.w);
  mediump vec4 tmpvar_20;
  tmpvar_20 = mix (faceColor_15, outlineColor_16, vec4((clamp (
    (d_14 + (outline_17 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_17)
  ))));
  faceColor_15 = tmpvar_20;
  faceColor_15 = (faceColor_15 * tmpvar_19);
  faceColor_3 = faceColor_15;
  highp float tmpvar_21;
  highp vec2 tmpvar_22;
  tmpvar_22.x = float((_ClipRect.z >= xlv_TEXCOORD3.x));
  tmpvar_22.y = float((_ClipRect.w >= xlv_TEXCOORD3.y));
  highp vec2 tmpvar_23;
  tmpvar_23 = (vec2(greaterThanEqual (xlv_TEXCOORD3.xy, _ClipRect.xy)) * tmpvar_22);
  tmpvar_21 = (tmpvar_23.x * tmpvar_23.y);
  faceColor_3 = (faceColor_3 * tmpvar_21);
  tmpvar_1 = faceColor_3;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier03 " {
""
}
}
 }
}
CustomEditor "TMPro_SDFMaterialEditor"
Fallback "TMPro/Mobile/Distance Field"
}