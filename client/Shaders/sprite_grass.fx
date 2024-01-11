/*****************************************************************************/
/*	File:	fastsprites.fx
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
		AlphaRef			= 60;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable				= True;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= None;
		
		ColorOp[0]			= SelectArg2;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;  
		AlphaArg2[0]		= Texture;    
		
		AddressU[0]         = Wrap;
		AddressV[0]         = Wrap;
		MinFilter[0]        = Linear;
		MipFilter[0]        = Linear;
		MagFilter[0]        = Linear;  
		
		ColorOp[1]			= Disable;	
		AlphaOp[1]			= Disable;	
		
		VertexShader        = NULL;
		PixelShader         = NULL;
    }
} // technique RenderScene
