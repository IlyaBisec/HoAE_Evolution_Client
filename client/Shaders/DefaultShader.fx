//*****************************************************************************
//*	File:	DefaultShader.fx
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
		ColorVertex			= True;
		SpecularEnable			= False;
		NormalizeNormals			= False;
		CullMode			= None;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		DiffuseMaterialSource			= Color1;
		AmbientMaterialSource			= Material;
		SpecularMaterialSource			= Color2;
		Ambient			= 0xFF000000;
		TextureTransformFlags			= Count2;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;
		FogEnable			= False;		

		LightEnable[0]			= True;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

	}  //pass P0
}  // technique RenderScene
