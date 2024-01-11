//*****************************************************************************
//*	File:	Diffuse.fx
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

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

	}  //pass P0
}  // technique RenderScene
