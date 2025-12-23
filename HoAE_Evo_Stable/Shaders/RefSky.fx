//*****************************************************************************
//*	File:	RefSky.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= False;
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

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MipFilter[0]			= None;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
