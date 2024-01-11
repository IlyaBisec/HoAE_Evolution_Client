//*****************************************************************************
//*	File:	transformtools.fx
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
		ZEnable			= True;
		ZWriteEnable			= True;
		Lighting			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;

	}  //pass P0
}  // technique RenderScene
