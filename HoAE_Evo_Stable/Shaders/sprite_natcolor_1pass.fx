//*****************************************************************************
//*	File:	hud.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
float4x4 ProjTM;
float4x4 ViewTM;
float4x4 WorldTM;


struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
   float4 S  : COLOR1;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0,float4 S:COLOR1)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldTM, Pos);
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewTM, Out.Pos);
   Out.Pos.z-=16;
   Out.Pos = mul(ProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV;
   Out.D=D*float4(1,1,1,1);
   Out.S=S;
   return Out;
}
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= False;//True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x000000B0;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= True;
		ZFunc				= LessEqual;
		ZWriteEnable			= True;
		FillMode			= Solid;
		CullMode			= None;
		//DepthBias           = -0.001;

		FogEnable			= True;		

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= AddSigned2x;
		AlphaArg1[0]			= Specular;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

		ColorOp[1]			= BlendCurrentAlpha;
		ColorArg1[1]			= Specular;
		ColorArg2[1]			= Current;
		AlphaOp[1]			= Modulate2x;
		AlphaArg1[1]			= Diffuse;
		AlphaArg2[1]			= Texture;
		TexCoordIndex[1]		= 0;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;
		VertexShader = compile vs_1_1 VSMain();
	}  //pass P0
}  // technique RenderScene
