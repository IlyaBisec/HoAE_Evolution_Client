//*****************************************************************************
//*	File:	point.fx
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
		AlphaTestEnable			= False;
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000000;
		ColorVertex			= True;
		SpecularEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		Lighting			= True;
		FillMode			= Point;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		ZBias			= 12;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		MipFilter[1]			= None;
		MinFilter[1]			= None;
		MagFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
