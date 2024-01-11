//*****************************************************************************
//*	File:	ShadowVolume2.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		ZWriteEnable			= False;
		ZEnable			= True;
		StencilEnable			= True;
		ShadeMode			= Flat;
		StencilFunc			= Always;
		StencilZFail			= Keep;
		StencilFail			= Keep;
		StencilRef			= 0x00000001;
		StencilMask			= 0xFFFFFFFF;
		StencilWriteMask			= 0xFFFFFFFF;
		StencilPass			= Decr;
		AlphaBlendEnable			= True;
		SrcBlend			= Zero;
		DestBlend			= One;
		CullMode			= CW;

	}  //pass P0
}  // technique RenderScene
