technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True;
		SrcBlend		= SrcAlpha;
		DestBlend		= InvSrcAlpha;
		CullMode		= None;
		Lighting		= False;
		DitherEnable		= True;
		ZEnable			= True;
		ZWriteEnable		= False;

		ColorOp[0]		= Modulate2x;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]		= SelectArg1;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]		= Wrap;
		AddressV[0]		= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;

		ColorOp[1]		= Disable;
		AlphaOp[1]		= Disable;
     
    }
} // technique RenderScene
