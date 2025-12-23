//*****************************************************************************
//*	File:	WaterGF2.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000010;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MipFilter[0]			= None;

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Diffuse;
		AlphaArg2[1]			= Texture;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MipFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
