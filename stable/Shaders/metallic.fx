//*****************************************************************************
//*	File:	metallic.fx
//*	Desc:	
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
		LightDiffuse[0]   	= {0.5, 0.5, 0.5, 1.0}; 
		LightSpecular[0]  	= {0.5, 0.5, 0.5, 1.0};
		LightAmbient[0]   	= {0.3, 0.3, 0.3, 1.0};
		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
		LightRange[0]     	= 100000.0; 
		
		LightType[1]      	= DIRECTIONAL; 
		LightDiffuse[1]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[1]  	= {0.3, 0.3, 0.3, 1.0};
		LightAmbient[1]   	= {0.0, 0.0, 0.0, 1.0};
		LightDirection[1] 	= {-0.0, -0.0, -1.0};  
		LightRange[1]     	= 100000.0; 

		LightEnable[0]		= True;
		LightEnable[1]		= True;
		
		Lighting		    = True; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= True; 
		SrcBlend            = SrcAlpha;
		DestBlend           = InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		SpecularEnable		= True; 
		NormalizeNormals	= True; 
		CullMode			= CCW;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= True; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 0; 
		
		ColorOp[0]			= Modulate;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]		= Texture;
		MipFilter[0]		= Point;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]	= PassThru;

		ColorOp[1]			= Modulate;
		ColorArg1[1]		= Current;
		ColorArg2[1]		= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]		= Current;
		AlphaArg1[1]		= TFactor;		
		TexCoordIndex[1]	= CameraSpaceReflectionVector;
		MipFilter[1]		= Linear;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		
        ColorOp[2]			= Disable;  
		AlphaOp[2]			= Disable;	  
    }
} // technique RenderScene
