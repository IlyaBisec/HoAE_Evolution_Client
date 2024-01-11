technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True;
		AlphaTestEnable		= False;
		SrcBlend		= SrcAlpha;
		DestBlend		= InvSrcAlpha;
		ColorVertex		= True;
		SpecularEnable		= False;
		NormalizeNormals	= False;
		CullMode		= None;
		Lighting		= False;
		FillMode		= Wireframe;
		ShadeMode		= Gouraud;
		DitherEnable		= False;
		ZEnable			= False;
		ZWriteEnable		= False;
		ZFunc			= LessEqual;
		DiffuseMaterialSource	= Color1;
		ClipPlaneEnable		= 0;

		ColorOp[0]		= SelectArg1;
		ColorArg1[0]		= Diffuse;
		AlphaOp[0]		= SelectArg1;
		AlphaArg1[0]		= Diffuse;     
    }
} // technique RenderScene
