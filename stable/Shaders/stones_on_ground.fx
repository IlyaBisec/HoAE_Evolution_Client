/*****************************************************************************/
/*	File:	stonesonground.fx
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
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000004;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable				= False;
		ZWriteEnable		= False;
		ColorVertex			= True;
		FillMode			= Solid;
		CullMode			= None;
		DitherEnable		= True;
		
		ColorOp[0]			= Modulate;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;  
		AlphaArg2[0]		= Texture;    
		
		AddressU[0]         = Wrap;
		AddressV[0]         = Wrap;
		MinFilter[0]        = Point;
		MagFilter[0]        = Point;  
		
		ColorOp[1]			= Disable;	
		AlphaOp[1]			= Disable;	
		
		VertexShader        = NULL;
		PixelShader         = NULL;
    }
} // technique RenderScene
