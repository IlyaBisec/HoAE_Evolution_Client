//*****************************************************************************
//*	File:	vertex_lit_shiny.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialPower		= 100.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.5, 0.5, 0.5, 1.0};
		LightDirection[0] 	= {0.577, -0.577, 0.577};  
		LightRange[0]     	= 100000.0; 
		LightEnable[0]		= True; 

		Lighting			= True; 
		SpecularEnable		= True; 
		
		AlphaBlendEnable	= True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= True;
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
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Texture; 
		MipFilter[0] 		= Point;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;   
		
		ColorOp[1]			= Modulate;
		ColorArg1[1]		= Current;
		ColorArg2[1]		= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]		= Texture;
		AlphaArg2[1]		= Diffuse;
		TexCoordIndex[1]	= CameraSpaceReflectionVector;
		MipFilter[1]		= Linear;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;				 
          
    }
} // technique RenderScene
