//*****************************************************************************
//*	File:	Stones2.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= One;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 2;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= Linear;

		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Current;
		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		MipFilter[1]			= Linear;
		TexCoordIndex[1]			= 1;

	}  //pass P0
}  // technique RenderScene
