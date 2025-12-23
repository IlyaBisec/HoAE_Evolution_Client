//*****************************************************************************
//*	File:	fantasy_fog.fx
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
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x2;
		ColorVertex			= False;
		SpecularEnable			= False;
		NormalizeNormals			= True;
		CullMode			= CCW;
		Lighting			= False;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= False;
		ZFunc			= LessEqual;
		FogEnable			= False;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TextureTransformFlags[0]			= Count2;
		TexCoordIndex[0]			= CameraSpacePosition;

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaOp[1]			= Modulate2x;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= Texture;
		MipFilter[1]			= Linear;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		TextureTransformFlags[1]			= Count2;
		TexCoordIndex[1]			= CameraSpacePosition;

	}  //pass P0
}  // technique RenderScene
