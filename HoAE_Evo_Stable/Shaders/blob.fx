//*****************************************************************************
//*	File:	blob.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaBlendEnable			= True;
		AlphaTestEnable			= False;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x01;
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= False;
		CullMode			= None;
		Lighting			= False;
		FillMode			= Solid;
		DitherEnable			= False;
		ZEnable			= True;
		FogEnable			= False;
		Lighting			= False;
		ZWriteEnable			= False;
		ZFunc			= LessEqual;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;

	}  //pass P0
}  // technique RenderScene
