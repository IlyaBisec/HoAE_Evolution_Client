technique RenderScene
{
    pass P0
    {          
		Lighting		    = False; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= False; 
		AlphaTestEnable		= False;
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= CW;
		FillMode			= Solid; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 1; 
		
		ColorOp[0]			= SelectArg1;//Modulate;  
		ColorArg1[0]		= Diffuse; 
		//ColorArg1[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Diffuse; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		//TexCoordIndex[0]	= PassThru;   
		
		ColorOp[1]			= Disable;  
		AlphaOp[1]			= Disable;
        ColorOp[2]			= Disable;  
		AlphaOp[2]			= Disable;	  
    }
} // technique RenderScene
