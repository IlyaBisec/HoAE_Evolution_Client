technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= False;
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000000;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable				= True;
		ZWriteEnable		= True;
		ColorVertex			= True;
		FillMode			= Solid;
		CullMode			= None;
		DitherEnable		= True;
		FogEnable			= False;
		
		ColorOp[0]			= SelectArg1;
		ColorArg1[0]		= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]		= Diffuse;     
    }
} // technique RenderScene
