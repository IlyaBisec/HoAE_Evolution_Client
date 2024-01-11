//*****************************************************************************
//*	File:	Default.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
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
		StencilEnable			= False;
		ColorWriteEnable			= 15;
		FogEnable			= False;		

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= Point;
		TexCoordIndex[0]			= PassThru;
		TextureTransformFlags[0]			= Disable;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

		ColorOp[2]			= Disable;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= Disable;
		AlphaOp[3]			= Disable;

		ColorOp[4]			= Disable;
		AlphaOp[4]			= Disable;

		ColorOp[5]			= Disable;
		AlphaOp[5]			= Disable;

		ColorOp[6]			= Disable;
		AlphaOp[6]			= Disable;

		ColorOp[7]			= Disable;
		AlphaOp[7]			= Disable;

	}  //pass P0
}  // technique RenderScene
