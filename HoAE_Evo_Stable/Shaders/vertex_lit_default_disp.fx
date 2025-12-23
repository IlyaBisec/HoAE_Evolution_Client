//*****************************************************************************
//*	File:	vertex_lit_natcolor.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 

//#define RANDOMLIGHT
#define DISPLACEMENT  1.0
#define TEXSIZE       256.0
#define BUMPSTRENGTH  3.0

#include "include\skinning_base.fx"

technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialPower		= 40.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.3, 1.3, 1.3, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.3, 0.3, 0.3, 1.0};
		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
		LightRange[0]     	= 100000.0; 

//		LightType[0]      	= DIRECTIONAL; 
//		LightDiffuse[0]   	= {4.3, 4.3, 4.3, 1.0}; 
//		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
//		LightAmbient[0]   	= {0.2, 0.2, 0.2, 1.0};
//		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
//		LightRange[0]     	= 100000.0; 
		
		LightType[1]      	= DIRECTIONAL; 
		LightDiffuse[1]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[1]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[1]   	= {0.2, 0.2, 0.2, 1.0};
		LightDirection[1] 	= {-0.0, -0.2, -1.0};  
		LightRange[1]     	= 100000.0; 

		LightEnable[0]		= True;
		LightEnable[1]		= False;
		
		Lighting		    = True; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= True; 
		SrcBlend            = SrcAlpha;
		DestBlend           = InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= CCW;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 2; 
		
		FogEnable			= True;
		
		ColorOp[0]			= SelectArg2;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;   
                MipMapLodBias[0]        = -0.2;
		
		ColorOp[1]			= BlendCurrentAlpha;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= TFactor; 
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1] 		= TFactor; 
		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]			= Wrap;  
		AddressV[1]			= Wrap;  
		
		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= Disable;

		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;
		VertexShader = compile vs_2_0 VSMain();
  		PixelShader = compile ps_2_0 brightPS();
    }
} // technique RenderScene
