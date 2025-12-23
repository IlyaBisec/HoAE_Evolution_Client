//*****************************************************************************
//*	File:	fill.fx
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
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= solid;
		CullMode			= None;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MipFilter[0]			= None;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
