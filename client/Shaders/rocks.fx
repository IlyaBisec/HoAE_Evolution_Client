//*****************************************************************************
//*	File:	rocks.fx
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
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x01;
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= True;
		CullMode			= CCW;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;
		FogEnable			= False;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

	}  //pass P0
}  // technique RenderScene
