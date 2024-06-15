//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TMPro/Bitmap" {
Properties {
 _MainTex ("Font Atlas", 2D) = "white" { }
 _FaceTex ("Font Texture", 2D) = "white" { }
 _FaceColor ("Text Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _VertexOffsetX ("Vertex OffsetX", Float) = 0.000000
 _VertexOffsetY ("Vertex OffsetY", Float) = 0.000000
 _MaskSoftnessX ("Mask SoftnessX", Float) = 0.000000
 _MaskSoftnessY ("Mask SoftnessY", Float) = 0.000000
 _ClipRect ("Clip Rect", Vector) = (-10000.000000,-10000.000000,10000.000000,10000.000000)
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
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask [_ColorMask]
  GpuProgramID 26942
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  highp float tmpvar_3;
  highp vec2 tmpvar_4;
  tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
  tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
  highp vec2 tmpvar_5;
  tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
  tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
  c_1 = (c_1 * tmpvar_3);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  highp float tmpvar_3;
  highp vec2 tmpvar_4;
  tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
  tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
  highp vec2 tmpvar_5;
  tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
  tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
  c_1 = (c_1 * tmpvar_3);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier03 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _ScreenParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_projection;
uniform lowp vec4 _FaceColor;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 vert_1;
  vert_1.zw = _glesVertex.zw;
  vert_1.x = (_glesVertex.x + _VertexOffsetX);
  vert_1.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 pos_2;
  pos_2 = (glstate_matrix_mvp * vert_1);
  highp vec2 tmpvar_3;
  tmpvar_3 = (_ScreenParams.xy * 0.5);
  pos_2.xy = ((floor(
    (((pos_2.xy / pos_2.w) * tmpvar_3) + vec2(0.5, 0.5))
  ) / tmpvar_3) * pos_2.w);
  highp vec2 tmpvar_4;
  tmpvar_4.x = ((floor(_glesMultiTexCoord1.x) * 4.0) / 4096.0);
  tmpvar_4.y = (fract(_glesMultiTexCoord1.x) * 4.0);
  highp vec2 tmpvar_5;
  tmpvar_5.x = (_ScreenParams.x * glstate_matrix_projection[0].x);
  tmpvar_5.y = (_ScreenParams.y * glstate_matrix_projection[1].y);
  highp vec4 tmpvar_6;
  tmpvar_6.xy = vert_1.xy;
  tmpvar_6.zw = (0.5 / (pos_2.ww / abs(tmpvar_5)));
  gl_Position = pos_2;
  xlv_COLOR = (_glesColor * _FaceColor);
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FaceTex;
uniform highp vec4 _ClipRect;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = (texture2D (_FaceTex, xlv_TEXCOORD1) * xlv_COLOR);
  c_1.xyz = tmpvar_2.xyz;
  c_1.w = (tmpvar_2.w * texture2D (_MainTex, xlv_TEXCOORD0).w);
  highp float tmpvar_3;
  highp vec2 tmpvar_4;
  tmpvar_4.x = float((_ClipRect.z >= xlv_TEXCOORD2.x));
  tmpvar_4.y = float((_ClipRect.w >= xlv_TEXCOORD2.y));
  highp vec2 tmpvar_5;
  tmpvar_5 = (vec2(greaterThanEqual (xlv_TEXCOORD2.xy, _ClipRect.xy)) * tmpvar_4);
  tmpvar_3 = (tmpvar_5.x * tmpvar_5.y);
  c_1 = (c_1 * tmpvar_3);
  gl_FragData[0] = c_1;
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
}