//*****************************************************************************
//*	File:	bump_default.fx
//*	Author:	Andrew Shpagin
//*	Date:	22.09.2006
//***************************************************************************** 


float4   TFactor;
float4x4 ViewProjTM;
float4x4 WorldTM;
float    Time;
float3   ViewPos;
float4   LDir=float4(-0.866,-0.43,-0.43,0);
float4   LightDiffuse=float4(0.6,0.6,0.6,1.0);
float4   LightAmbient=float4(0.2,0.2,0.2,1.0);
float4   BonesArray[210];

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0.0;
};
sampler BumpSpec :register(s1) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0.0;
};
sampler BumpSpec2 :register(s2) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0.0;
};
sampler FogOfWar :register(s3) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0;
};
struct VS_OUTPUT 
{
   float4 Pos   : POSITION;
   float2 UV    : TEXCOORD0;
   float3 View  : TEXCOORD2;
   float2 UV3   : TEXCOORD3;
   float3 Row1  : TEXCOORD4;
   float3 Row2  : TEXCOORD5;
   float3 Row3  : TEXCOORD6;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float4 D:COLOR0,float4 S:COLOR1, float4 C:COLOR2,float2 UV: TEXCOORD0)
{
   VS_OUTPUT Out;
   
   float3 T=normalize(D.xyz*2-1);
   float3 N=normalize(S.xyz*2-1);   

   int4 idx=D3DCOLORtoUBYTE4(C);
   float4x4 m;
   
   m._m00_m01_m02_m03=BonesArray[idx.x  ]*D.w;
   m._m10_m11_m12_m13=BonesArray[idx.x+1]*D.w;
   m._m20_m21_m22_m23=BonesArray[idx.x+2]*D.w;

   m._m00_m01_m02_m03+=BonesArray[idx.y  ]*C.w;
   m._m10_m11_m12_m13+=BonesArray[idx.y+1]*C.w;
   m._m20_m21_m22_m23+=BonesArray[idx.y+2]*C.w;

   C.w=1-C.w-D.w;

   m._m00_m01_m02_m03+=BonesArray[idx.z  ]*C.w;
   m._m10_m11_m12_m13+=BonesArray[idx.z+1]*C.w;
   m._m20_m21_m22_m23+=BonesArray[idx.z+2]*C.w;

   m._m30_m31_m32_m33=float4(0,0,0,1);   

   float4x4 m2;
   m2=mul(m,WorldTM);
   Out.Pos = mul(m2,Pos); 
   
   Out.Row1 = m._m00_m10_m20;
   Out.Row2 = m._m01_m11_m21;
   Out.Row3 = m._m02_m12_m22;

   Out.Row1 = m._m00_m01_m02;
   Out.Row2 = m._m10_m11_m12;
   Out.Row3 = m._m20_m21_m22;


   float3 View = ViewPos-Out.Pos;   
   Out.View    = -normalize(View);
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.UV  = UV;
   return Out;
}

float4 brightPS_nmap(VS_OUTPUT v):COLOR{

   //LDir=float4(1,0,0,0);

   float4 tex=tex2D(Texture,v.UV*330);

   float4 bump=tex2D(BumpSpec,v.UV)*2-1;
   float3 b2 = float3(-bump.z,bump.x,bump.y);
   float3 b3 = normalize(float3(dot(b2,v.Row1),dot(b2,v.Row2),dot(b2,v.Row3)));
   float  dp=dot(b3,LDir);
   float  D=(LightAmbient-clamp(LightDiffuse*dp,-1,1));
   float3 refl=v.View-2*b3*dot(v.View,b3);
   float  S=max(0,-dot(refl,LDir));
   float4 fog=tex2D(FogOfWar,v.UV3);
   float4 c1=D*TFactor+pow(S,32);
   c1.w=TFactor.w;
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w);//+pow(S,16)*tex.g/1;
   float d=dot(LDir,refl);
    
   return tex*c1;
}

technique RenderScene
{
    pass P0
    {   

#include "Include\skinning_renderstates.fx"

		VertexShader = compile vs_2_0 VSMain();
  		PixelShader = compile ps_2_0 brightPS_nmap();
    }
} // technique RenderScene
