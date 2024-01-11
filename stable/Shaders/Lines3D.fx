//*****************************************************************************
//*	File:	Lines3D.fx
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
		AlphaRef			= 0x00000000;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		ColorVertex			= True;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable			= False;		

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			= Disable;

	}  //pass P0
}  // technique RenderScene
