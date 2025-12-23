//*****************************************************************************
//*	File:	ShadowVolume3.fx
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
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		StencilFunc			= LessEqual;
		StencilRef			= 0x00000001;
		StencilPass			= Keep;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		AlphaArg2[0]			= Diffuse;

	}  //pass P0
}  // technique RenderScene
