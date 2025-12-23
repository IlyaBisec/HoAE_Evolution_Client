//*****************************************************************************
//*	File:	vertex_lit_natcolor.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 

//#define RANDOMLIGHT

//#define DISPLACEMENT  1.0
#define TEXSIZE       256.0
#define BUMPSTRENGTH  3.0
#define SPECULARTYPE  BLUE
#define HEIGHTSRC r
#define HSIGN -

#include "include\skinning_base.fx"

technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True;
		SrcBlend		= SrcColor;
		DestBlend		= DestColor;
		BlendOp			= Max;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual;
		AlphaRef		= 0x2;
		DitherEnable		= False;
		Lighting		= False;
		SpecularEnable		= False;
		ZEnable			= True;
		ZFunc			= LessEqual;
		ZWriteEnable		= True;
		FillMode		= Solid;
		CullMode		= CCW;

		FogEnable		= True;		

		ColorOp[0]		= BlendDiffuseAlpha;
		ColorArg1[0]		= TFactor;
		ColorArg2[0]		= Specular;
		AlphaOp[0]		= SelectArg1;
		AlphaArg1[0]		= Specular;
		AlphaArg2[0]		= Texture;
		AddressU[0]		= Wrap;
		AddressV[0]		= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= -0.5;
		VertexShader = compile vs_2_0 VSMainShadow();
  		//PixelShader = compile ps_2_0 brightPS();
    }
} // technique RenderScene
