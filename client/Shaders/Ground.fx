//*****************************************************************************
//*	File:	Ground.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= False;
		AlphaTestEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ColorVertex			= False;
		CullMode			= None;
		FillMode			= Solid;
		ZEnable			= True;
		ZWriteEnable			= True;
		FogEnable			= False;	

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		AlphaOp[0]			= Disable;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= None;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= None;
		MagFilter[1]			= None;
		MipFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
