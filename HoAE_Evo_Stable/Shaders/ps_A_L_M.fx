//*****************************************************************************
//*	File:	ps_A_L_M.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
float4x4 ViewTM;
float4x4 WorldTM;
float4x4 ProjTM;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float2 UV1: TEXCOORD1,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldTM, Pos);
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewTM, Out.Pos);
   Out.Pos.z -= 24;
   Out.Pos = mul(ProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV1;
   Out.D=D;
   return Out;
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
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		ZFunc			= LessEqual;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Mirror;
		AddressV[0]			= Mirror;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Current;
		ColorArg1[2]			= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= Texture;
 

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
