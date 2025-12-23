//*****************************************************************************
//*	File:	Stones.fx
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
		AlphaRef			= 0x00000001;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= None;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaArg2[1]			= Texture;
		AlphaOp[1]			= SelectArg2;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		MipFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
