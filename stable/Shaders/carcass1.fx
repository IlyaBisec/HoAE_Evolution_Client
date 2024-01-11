//*****************************************************************************
//*	File:	carcass1.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		AlphaTestEnable			= False;
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= False;
		CullMode			= None;
		Lighting			= False;
		FillMode			= Solid;
		DitherEnable			= True;
		TextureTransformFlags			= Count2;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;

		LightEnable[0]			= False;
		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Tfactor;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

	}  //pass P0
}  // technique RenderScene
