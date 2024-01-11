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
   Out.Pos.z-=36;
   Out.Pos = mul(ProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV;
   Out.D=D;
   Out.S=S;
   return Out;
}
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable			= False;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		VertexShader = compile vs_1_1 VSMain();
	}  //pass P0
}  // technique RenderScene
