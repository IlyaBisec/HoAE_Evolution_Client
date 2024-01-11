//*****************************************************************************
//*	File:	fground.fx
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
		ColorWriteEnable			= 0;

		ColorOp[0]			= Disable;

		AlphaOp[1]			= Disable;
		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
