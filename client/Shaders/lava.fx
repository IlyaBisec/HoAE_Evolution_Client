technique RenderScene
{
    pass P0
    {          
		
		AlphaBlendEnable	= True; 
		SrcBlend            = SrcAlpha;
		DestBlend           = One;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= None;
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		
		LightEnable[0]		= False; 
		Lighting			= False; 
		
		ColorOp[0]			= SelectArg1;  
		ColorArg1[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		
        ColorOp[1]          = Disable;	
        AlphaOp[1]          = Disable;	         
    }
} // technique RenderScene
