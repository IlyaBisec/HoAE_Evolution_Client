//*****************************************************************************
//*	File:	road3.fx
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
		AlphaRef			= 16;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		FogEnable			= True;		

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]			= TFactor;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Clamp;
		MipFilter[0]			= Linear;

		AlphaOp[1]			= SelectArg2;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Current;
		ColorOp[1]			= SelectArg1;
		ColorArg2[1]			= Texture;
		ColorArg1[1]			= Current;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Wrap;
		AddressV[1]			= Clamp;
		MipFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
