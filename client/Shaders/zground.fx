//*****************************************************************************
//*	File:	zground.fx
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
		ColorVertex			= True;
		CullMode			= None;
		FillMode			= Solid;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;
		ColorWriteEnable			= 0;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
