technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= False;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  // pass P0
}  // technique RenderScene
