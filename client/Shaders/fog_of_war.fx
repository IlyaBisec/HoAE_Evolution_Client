//*****************************************************************************
//*	File:	fow.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

float4x4 WorldViewProjTM;
float FarPlane;
float3 ViewPos;
float4x4 ViewTM;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.UV = UV;
   Out.D=D;
   float3 dp=Pos-ViewPos;
   dp=normalize(dp);
   dp.z*=10.0*ViewTM._m22;
   Out.D.w*=dp.z*(1-pow(Out.Pos.z/FarPlane,3));
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
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable			= True;

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg2;
		AlphaArg1[0]			= Tfactor;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MipFilter[0]			= None;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Diffuse;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= TFactor;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MipFilter[1]			= None;

		//ColorOp[2]			= Disable;
		//AlphaOp[2]			= Disable;

		VertexShader 			= compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene

