//*****************************************************************************
//*	File:	shadowReceiver.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		AlphaTestEnable			= True;
		AlphaFunc			= Less;
		AlphaRef			= 0x00000060;
		SrcBlend			= Zero;
		DestBlend			= SrcColor;
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= False;
		CullMode			= None;
		Lighting			= False;
		FillMode			= Solid;
		DitherEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= False;
		TextureTransformFlags			= Count2;

		LightEnable[0]			= False;
		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		TexCoordIndex[0]			= PassThru;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
