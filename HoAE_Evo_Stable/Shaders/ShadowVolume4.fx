//*****************************************************************************
//*	File:	ShadowVolume4.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		ZEnable			= False;
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

	}  //pass P0
}  // technique RenderScene
