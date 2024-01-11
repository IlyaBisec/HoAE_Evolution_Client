//*****************************************************************************
//*	File:	BumpWater.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	        = True;
		SrcBlend			        = SrcAlpha;
		DestBlend			        = InvSrcAlpha;
		AlphaTestEnable		        = True;
		AlphaFunc			        = GreaterEqual;
		AlphaRef			        = 0x01;
		DitherEnable		        = True;
		Lighting			        = True;
		SpecularEnable		        = False;
		ZEnable			            = True;
		ZWriteEnable		        = True;
		FillMode			        = Solid;
		CullMode			        = None;
		COLORVERTEX			        = True;
		NormalizeNormals	        = True;
		ClipPlaneEnable             = 0;

		LightEnable[0]			    = False;
		LightEnable[1]			    = False;
		
		ColorOp[0]			        = BumpEnvMap;
		ColorArg1[0]			    = Texture;
		ColorArg2[0]			    = Current;
		AlphaOp[0]			        = Disable;
		AlphaArg1[0]			    = Diffuse;
		AlphaArg2[0]			    = Texture;
		MinFilter[0]			    = Linear;
		MagFilter[0]			    = Linear;
		AddressU[0]			        = Wrap;
		AddressV[0]			        = Wrap;
		MipFilter[0]			    = Linear;
		
		BumpEnvMat00[0]			    = 10.000000;
		BumpEnvMat01[0]			    = 0.000000;
		BumpEnvMat10[0]			    = 0.000000;
		BumpEnvMat11[0]			    = 10.000000;
		TEXCOORDINDEX[0]			= 0;
		BUMPENVLSCALE[0]			= 0.000000;
		BUMPENVLOFFSET[0]			= 0.000000;
		TEXTURETRANSFORMFLAGS[0]	= Disable;

		ColorOp[1]			        = SelectArg1;
		ColorArg1[1]			    = Texture;
		ColorArg2[1]			    = Current;
		AlphaOp[1]			        = SelectArg1;
		AlphaArg1[1]			    = Diffuse;
		AlphaArg2[1]			    = Texture;
		MinFilter[1]			    = Linear;
		MagFilter[1]			    = Linear;
		AddressU[1]			        = Wrap;
		AddressV[1]			        = Wrap;
		MipFilter[1]			    = Linear;
		TEXTURETRANSFORMFLAGS[1]	= Disable;
		TEXCOORDINDEX[1]			= 1;

	}  //pass P0
}  // technique RenderScene
