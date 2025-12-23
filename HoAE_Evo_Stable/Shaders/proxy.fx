//*****************************************************************************
//*	File:	vertex_lit.fx
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
		MaterialSpecular	= {1.0, 1.0, 0.6, 1.0}; 
		MaterialPower		= 30.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.2, 0.2, 0.3, 1.0};
		LightDirection[0] 	= {0.577, -0.577, -2.577};  
		LightRange[0]     	= 100000.0; 

		LightEnable[0]		= True; 
		Lighting			= False; 
		SpecularEnable		= True; 
		
		AlphaBlendEnable	= True; 
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= False;
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
		
		ColorOp[0]			= SelectArg2;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Texture; 
		MipFilter[0] 		= Point;  
		MinFilter[0] 		= Point;  
		MagFilter[0] 		= Point;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;  
		
		ColorOp[1]			= Disable;  
		ColorArg1[1]		= Current;          
		ColorArg2[1]		= Texture;          
		AlphaOp[1]			= Modulate;				 
		AlphaArg1[1] 		= Current;
		AlphaArg2[1] 		= Texture;          
		MipFilter[1] 		= Point;           
		MinFilter[1] 		= Point;           
		MagFilter[1] 		= Point;           
		AddressU[1]			= Wrap;            
		AddressV[1]			= Wrap;            
    }
} // technique RenderScene
