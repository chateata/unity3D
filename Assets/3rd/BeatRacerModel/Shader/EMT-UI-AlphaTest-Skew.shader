//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Easy Masking Transition/Unlit/Transparent Tint-Skew" {
Properties {
 _MainTex ("Image (RGB)", 2D) = "white" { }
 _Gradation ("Gradation (A8)", 2D) = "white" { }
 _Color ("Tint", Color) = (1.000000,1.000000,1.000000,1.000000)
 _Cutoff ("Alpha Cut Off", Range(0.000000,1.000000)) = 0.500000
[Toggle]  _Invert ("Inverted (Boolean)", Float) = 0.000000
 _Scale ("Scale", Range(0.000000,1.000000)) = 1.000000
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" "PreviewType"="Plane" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="TransparentCutout" "PreviewType"="Plane" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  GpuProgramID 60779
Program "vp" {
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
uniform lowp float _Scale;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec2 tmpvar_3;
  tmpvar_3.x = 1.0;
  tmpvar_3.y = _Scale;
  mediump vec2 P_4;
  P_4 = (xlv_TEXCOORD0 * tmpvar_3);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_Gradation, P_4) - 0.01);
  col_2 = tmpvar_5;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_5);
  };
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  tex_1 = tmpvar_7;
  lowp float x_8;
  x_8 = (_Cutoff - col_2.w);
  if ((x_8 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
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
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
uniform lowp float _Scale;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec2 tmpvar_3;
  tmpvar_3.x = 1.0;
  tmpvar_3.y = _Scale;
  mediump vec2 P_4;
  P_4 = (xlv_TEXCOORD0 * tmpvar_3);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_Gradation, P_4) - 0.01);
  col_2 = tmpvar_5;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_5);
  };
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  tex_1 = tmpvar_7;
  lowp float x_8;
  x_8 = (_Cutoff - col_2.w);
  if ((x_8 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
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
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Color;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec2 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = (_glesColor * _Color);
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _Gradation;
uniform lowp float _Cutoff;
uniform lowp float _Invert;
uniform lowp float _Scale;
varying highp vec4 xlv_COLOR;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  lowp vec4 col_2;
  lowp vec2 tmpvar_3;
  tmpvar_3.x = 1.0;
  tmpvar_3.y = _Scale;
  mediump vec2 P_4;
  P_4 = (xlv_TEXCOORD0 * tmpvar_3);
  lowp vec4 tmpvar_5;
  tmpvar_5 = (texture2D (_Gradation, P_4) - 0.01);
  col_2 = tmpvar_5;
  if ((_Invert == 0.0)) {
    col_2 = (1.0 - tmpvar_5);
  };
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * xlv_COLOR);
  tex_1 = tmpvar_7;
  lowp float x_8;
  x_8 = (_Cutoff - col_2.w);
  if ((x_8 < 0.0)) {
    discard;
  };
  gl_FragData[0] = tex_1;
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