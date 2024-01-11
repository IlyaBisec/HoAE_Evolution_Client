//*****************************************************************************
//*	File:	ShadowSquare.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		ZEnable			= False;
		StencilEnable			= True;
		FogEnable			= False;
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		StencilRef			= 0x00000001;
		StencilFunc			= 4;
		StencilPass			= Keep;

		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		ColorOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;

	}  //pass P0
}  // technique RenderScene
