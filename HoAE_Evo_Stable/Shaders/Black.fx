//*****************************************************************************
//*	File:	Black.fx
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
		FillMode			= Solid;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZBias			= 0;

		ColorOp[0]			= SelectArg2;
		ColorArg2[0]			= Tfactor;
		AlphaOp[0]			= Disable;
		MinFilter[0]			= None;
		MagFilter[0]			= None;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
