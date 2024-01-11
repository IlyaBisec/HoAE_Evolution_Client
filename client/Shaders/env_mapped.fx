//*****************************************************************************
//*	File:	env_mapped.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= True;
		AlphaFunc			    = GreaterEqual;
		AlphaRef			    = 0x02;
		ColorVertex			    = True;
		SpecularEnable			= True;
		NormalizeNormals		= True;
		CullMode			    = None;
		Lighting			    = True;
		FillMode			    = Solid;
		ShadeMode			    = Gouraud;
		DitherEnable			= False;
		ZEnable			        = True;
		ZWriteEnable			= True;
		ZFunc			        = LessEqual;
		ClipPlaneEnable			= 0;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		MipFilter[0]			= Point;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Diffuse;
		TexCoordIndex[1]			= CameraSpaceReflectionVector;
		MipFilter[1]			= Linear;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
