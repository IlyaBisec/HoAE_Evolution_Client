//*****************************************************************************
//*	File:	NoDepth.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= False;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= None;

	}  //pass P0
}  // technique RenderScene
