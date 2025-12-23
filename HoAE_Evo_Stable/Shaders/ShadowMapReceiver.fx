//*****************************************************************************
//*	File:	ShadowMapReceiver.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		SrcBlend			= SrcColor;
		DestBlend			= InvSrcColor;
		AlphaBlendEnable			= True;
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

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Tfactor;
		AlphaOp[0]			= Disable;
		MagFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MipFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

	}  //pass P0
}  // technique RenderScene
