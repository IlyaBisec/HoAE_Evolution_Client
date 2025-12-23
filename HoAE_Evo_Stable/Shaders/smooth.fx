//*****************************************************************************
//*	File:	smooth.fx
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
		MaterialPower		= 40.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.8, 0.8, 0.79, 1.0};
		LightDirection[0] 	= {0.577, -0.577, 0.577};  
		LightRange[0]     	= 100000.0; 

		LightEnable[0]		= True; 
		Lighting			= True; 
		SpecularEnable		= False; 
		
		AlphaBlendEnable	= True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= None;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 0; 
		
		ColorOp[0]			= Modulate;  
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
		
		ColorOp[1]			= BlendCurrentAlpha;  
		ColorArg1[1]		= Current;          
		ColorArg2[1]		= TFactor;          
		AlphaOp[1]			= Add;				 
		AlphaArg1[1] 		= Current;          
		AlphaArg2[1] 		= Current;          
		MipFilter[1] 		= Linear;           
		MinFilter[1] 		= Linear;           
		MagFilter[1] 		= Linear;           
		AddressU[1]			= Wrap;            
		AddressV[1]			= Wrap;            
    }
} // technique RenderScene
