//*****************************************************************************
//*	File:	rocks_top.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= InvSrcAlpha;
		DestBlend			= SrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x0;
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

		ColorOp[0]			= BlendTextureAlpha;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= TFactor;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= Current;
		MipFilter[1]			= Linear;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		TexCoordIndex[1]			= CameraSpacePosition;
		TextureTransformFlags[1]			= Count2;

	}  //pass P0
}  // technique RenderScene
