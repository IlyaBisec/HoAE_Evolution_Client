//*****************************************************************************
//*	File:	reflection_map.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
float4x4 WorldTM;
float4x4 ViewProjTM;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0)
{
   VS_OUTPUT Out; 
   Pos = mul(WorldTM, Pos);
   D.w=1;
   D.rgb=0.7;
   if(Pos.z<0)D.w=0;
   //if(Pos.z>0)Pos.z=0;
   Out.Pos = mul(ViewProjTM , Pos);
   Out.UV = UV;
   Out.D=D;
   //Out.D.xyz=float3(1,1,0);
   return Out;
}
technique RenderScene
{
	pass P0
	{
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaBlendEnable			= True;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x08;
		ColorVertex			= True;
		SpecularEnable			= False;
		CullMode			= None;
		Lighting			= True;
		FillMode			= Solid;
		DitherEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		ZFunc			= LessEqual;
		ClipPlaneEnable			= 2;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;
		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
