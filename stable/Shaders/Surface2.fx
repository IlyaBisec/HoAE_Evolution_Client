//*****************************************************************************
//*	File:	Surface2.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
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
		AlphaOp[0]			= SelectArg2;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Current;
		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		TexCoordIndex[1]			= 1;

	}  //pass P0
}  // technique RenderScene
