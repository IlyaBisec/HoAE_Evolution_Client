//*****************************************************************************
//*	File:	carcass.fx
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
		AlphaRef			= 0x000000AA;
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
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Point;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

	}  //pass P0
}  // technique RenderScene
