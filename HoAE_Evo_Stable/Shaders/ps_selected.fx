//*****************************************************************************
//*	File:	ps_add4x.fx
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
technique RenderScene
{
    pass P0
    {          
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		
		AlphaBlendEnable	= False;//True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		CullMode			= None;
		Lighting			= False; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= False; 
		DepthBias               = -0.002;
		
		ColorOp[0]			= Modulate4x;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0] 		= Texture; 

		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		
		ColorOp[1]			= Modulate;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= TFactor; 
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]		= Current;
		AlphaArg2[1] 		= TFactor; 

		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]			= Mirror;  
		AddressV[1]			= Mirror;             
    }
} // technique RenderScene
