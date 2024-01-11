//*****************************************************************************
//*	File:	shadowMap.fx
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
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= False;
		CullMode			= None;
		Lighting			= False;
		FillMode			= Solid;
		DitherEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;

		LightEnable[0]			= False;
		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		AlphaOp[0]			= Disable;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
