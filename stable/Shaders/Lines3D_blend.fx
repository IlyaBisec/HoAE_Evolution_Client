//*****************************************************************************
//*	File:	Lines3D_blend.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= False;
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000000;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		FillMode			= Solid;
		ZWriteEnable			= True;
		CullMode			= None;
		DitherEnable			= True;
		FogEnable			= False;		

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;

	}  //pass P0
}  // technique RenderScene
