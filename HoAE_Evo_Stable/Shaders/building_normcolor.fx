//*****************************************************************************
//*	File:	building_normcolor.fx
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
		AlphaRef			= 0xB0;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		ZFunc			= LessEqual;
		ZWriteEnable			= True;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Tfactor;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= Texture;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;

	}  //pass P0
}  // technique RenderScene
