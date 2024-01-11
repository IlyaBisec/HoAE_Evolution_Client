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

		LightEnable[0]		= True;
		LightEnable[1]		= False;
		
		Lighting		= True; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= True; 
		SrcBlend            	= SrcAlpha;
		DestBlend           	= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual; 
		AlphaRef		= 0x30; 
		ColorVertex		= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode		= CCW;
		Lighting		= True; 
		FillMode		= Solid; 
		ShadeMode		= Gouraud; 
		DitherEnable		= True; 
		ZEnable			= True; 
		ZWriteEnable		= True; 
		ZFunc			= LessEqual; 
		ClipPlaneEnable		= 0; 

		FogEnable		= True;
		
		ColorOp[0]		= Modulate2x;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]		= Modulate;
		AlphaArg1[0] 		= Texture; 
		AlphaArg2[0] 		= TFactor;
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]		= Wrap;  
		AddressV[0]		= Wrap;  
		TexCoordIndex[0]	= PassThru;   
                MipMapLodBias[0]        = -0.2;
		
		ColorOp[1]		= SelectArg1;
		ColorArg1[1]		= Current;
		AlphaOp[1]		= Disable;

		ColorOp[2]		= SelectArg1;
		ColorArg1[2]		= Current;
		AlphaOp[2]		= Disable;

		ColorOp[3]		= BlendTextureAlpha;
		ColorArg1[3]		= Texture;
		ColorArg2[3]		= Current;
		MinFilter[3]		= Linear;
		MagFilter[3]		= Linear;
		AlphaOp[3]		= Disable;