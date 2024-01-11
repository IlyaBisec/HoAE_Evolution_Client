//*****************************************************************************
//*	File:	flat.fx
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
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000004;
		ZEnable			= True;
		ZWriteEnable			= True;
		CullMode			= None;
		Lighting			= False;
		FillMode			= Solid;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
