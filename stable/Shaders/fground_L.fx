//*****************************************************************************
//*	File:	fground_L.fx
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
		ZFunc			= LessEqual;
		ColorWriteEnable			= 15;

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Linear;
		MipFilter[0]			= None;
		MagFilter[0]			= Point;
		AddressU[0]			= Mirror;
		AddressV[0]			= Mirror;

		AlphaOp[1]			= Disable;
		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
