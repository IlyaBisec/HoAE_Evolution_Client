//*****************************************************************************
//*	File:	bld.fx
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
		AlphaTestEnable			= False;
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000000;
		ColorVertex			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		Lighting			= False;
		FillMode			= Solid;
		CullMode			= CCW;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Disable;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Diffuse;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
