//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Beatracer/Transparent/Unlit" {
Properties {
 _EmisColor ("Emissive Color", Color) = (0.200000,0.200000,0.200000,0.000000)
 _MainTex ("Texture", 2D) = "white" { }
}
SubShader { 
 Tags { "QUEUE"="Geometry+50" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Geometry+50" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
  GpuProgramID 36148
Program "vp" {
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _EmisColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_4.xyz;
  tmpvar_3 = tmpvar_4.w;
  mediump vec4 c_5;
  c_5.xyz = tmpvar_2;
  c_5.w = tmpvar_3;
  c_1 = c_5;
  lowp vec4 color_6;
  color_6 = (c_1 * _EmisColor);
  c_1 = color_6;
  gl_FragData[0] = color_6;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _EmisColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_4.xyz;
  tmpvar_3 = tmpvar_4.w;
  mediump vec4 c_5;
  c_5.xyz = tmpvar_2;
  c_5.w = tmpvar_3;
  c_1 = c_5;
  lowp vec4 color_6;
  color_6 = (c_1 * _EmisColor);
  c_1 = color_6;
  gl_FragData[0] = color_6;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 worldNormal_1;
  mediump vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 v_4;
  v_4.x = unity_WorldToObject[0].x;
  v_4.y = unity_WorldToObject[1].x;
  v_4.z = unity_WorldToObject[2].x;
  v_4.w = unity_WorldToObject[3].x;
  highp vec4 v_5;
  v_5.x = unity_WorldToObject[0].y;
  v_5.y = unity_WorldToObject[1].y;
  v_5.z = unity_WorldToObject[2].y;
  v_5.w = unity_WorldToObject[3].y;
  highp vec4 v_6;
  v_6.x = unity_WorldToObject[0].z;
  v_6.y = unity_WorldToObject[1].z;
  v_6.z = unity_WorldToObject[2].z;
  v_6.w = unity_WorldToObject[3].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize(((
    (v_4.xyz * _glesNormal.x)
   + 
    (v_5.xyz * _glesNormal.y)
  ) + (v_6.xyz * _glesNormal.z)));
  worldNormal_1 = tmpvar_7;
  tmpvar_2 = worldNormal_1;
  gl_Position = (glstate_matrix_mvp * tmpvar_3);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _EmisColor;
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 tmpvar_2;
  lowp float tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  tmpvar_2 = tmpvar_4.xyz;
  tmpvar_3 = tmpvar_4.w;
  mediump vec4 c_5;
  c_5.xyz = tmpvar_2;
  c_5.w = tmpvar_3;
  c_1 = c_5;
  lowp vec4 color_6;
  color_6 = (c_1 * _EmisColor);
  c_1 = color_6;
  gl_FragData[0] = color_6;
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
}
}