//*****************************************************************************
//*	File:	terra_shadowed.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= False;
		ColorVertex			    = True;
		SpecularEnable			= False;
		NormalizeNormals		= False;
		CullMode			    = None;
		Lighting			    = False;
		FillMode			    = Solid;
		ShadeMode			    = Gouraud;
		DitherEnable			= False;
		ZEnable			        = True;
		ZWriteEnable			= True;
		ZFunc			        = LessEqual;
		DiffuseMaterialSource	= Color1;
		ClipPlaneEnable			= 0;
		FogEnable			= False;		

		ColorOp[0]			    = Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			    = Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipMapLodBias[0]        = -0.3;
		AddressU[0]			    = Wrap;
		AddressV[0]			    = Wrap;
		TexCoordIndex[0]		= PassThru;

		ColorOp[1]			    = Modulate;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaOp[1]			    = SelectArg1;
		AlphaArg1[1]			= Current;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		MipFilter[1]			= Linear;
		AddressU[1]			    = Clamp;
		AddressV[1]			    = Clamp;
		TexCoordIndex[1]		= CameraSpacePosition;
		TextureTransformFlags[1]= Count2;

	}  //pass P0
}  // technique RenderScene
