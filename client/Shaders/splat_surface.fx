/*****************************************************************************/
/*	File:	splat_facture.fx
/*	Author:	Ruslan Shestopalyuk
/*	Date:	15.11.2004
/*****************************************************************************/
technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 39;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable				= False;
		ZWriteEnable		= False;
		ColorVertex			= True;
		FillMode			= Solid;
		CullMode			= None;
		DitherEnable		= True;
		
		ColorOp[0]			= Modulate2x;
		ColorArg1[0]		= Texture;
		ColorArg2[0]		= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]		= Diffuse;  
		
		AddressU[0]         = Clamp;
		AddressV[0]         = Clamp;
		MinFilter[0]        = Point;
		MagFilter[0]        = Point;  
		MipFilter[0]        = Linear;
		
		ColorOp[1]			= Disable;	
		AlphaOp[1]			= Disable;	
		
		VertexShader        = NULL;
		PixelShader         = NULL;
    }
} // technique RenderScene
