//*****************************************************************************
//*	File:	minimap.fx
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
		AlphaRef			= 0x00000011;
		Lighting			= False;
		SpecularEnable			= False;
		CullMode			= CCW;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		AlphaOp[0]			= Disable;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= None;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
