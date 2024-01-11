//*****************************************************************************
//*	File:	vertex_lit.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
float4x4 WorldViewProjTM;
float4x4 ViewTM;

float4 LDir=float4(-0.866,-0.43,0.43,0);

float4 LightDiffuse=float4(1.0,1.0,1.0,1.0);
float4 LightAmbient=float4(0.2,0.2,0.2,1.0);

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
};

sampler Texture2 :register(s1) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
};

sampler Texture3 :register(s2) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
};

struct VS_OUTPUT 
{
   float4 Pos : POSITION;
   float2 UV  : TEXCOORD0;
};

float4 PSMain(float2 uv:TEXCOORD0) : COLOR
{
   float d=1/512.0f;
   float  dX=tex2D(Texture,uv+float2(d,0)).y-tex2D(Texture,uv+float2(-d,0)).y;
   float  dY=tex2D(Texture,uv+float2(0,d)).y-tex2D(Texture,uv+float2(0,-d)).y;
   float3 N=float3(dX,dY,d*128);
   N=normalize(N);
   float3 vdir=float3(0,0,1);
   float3 ldir=float3(-1,1,0.3);
   ldir=normalize(ldir);
   float D=(dot(ldir,N)+1)/3;
   float3 v2=vdir-N*dot(N,vdir);
   float s=(1-dot(v2,ldir))/2;
   
   float4 DC=tex2D(Texture2,uv);
   DC.xyz*=D;
   DC.xyz+=pow(s,8)*tex2D(Texture3,uv).y*4;
   DC.w=clamp(DC.w,0.1,0.4);
   return DC;//float4(D,D,D,1);
}
technique RenderScene
{
    pass P0
    {          
                AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		/*
		AlphaBlendEnable	= False; 
		SrcBlend            	= SrcAlpha;
		DestBlend           	= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual; 
		AlphaRef		= 0x00; 
		CullMode		= CCW;
//		FillMode		= Wireframe; 
		FillMode		= Solid; 
		ShadeMode		= Gouraud; 
		DitherEnable		= True; 
		ZEnable			= False; 
		ZWriteEnable		= False; 
		ZFunc			= LessEqual; 
		FogEnable		= False;
                */
		PixelShader  		= compile ps_2_0 PSMain();
    }
} // technique RenderScene
