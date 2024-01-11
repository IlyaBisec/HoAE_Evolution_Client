//*****************************************************************************
//*	File:	metamodel.fx
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
technique RenderScene
{
    pass P0
    {          
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		
		AlphaBlendEnable	= True; 
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
		ZWriteEnable		= True; 
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0] 		= Texture; 

		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		MipMapLodBias[0]    = 0;
		
		ColorOp[1]			= Disable;  
		AlphaOp[1]			= Disable;
    }
} // technique RenderScene
