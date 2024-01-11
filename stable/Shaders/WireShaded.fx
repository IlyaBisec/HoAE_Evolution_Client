//*****************************************************************************
//*	File:	WireShaded.fx
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
		FillMode			= Wireframe;
		ZEnable			= False;
		ZWriteEnable			= False;
		ZBias			= 16;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= None;
		MagFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
