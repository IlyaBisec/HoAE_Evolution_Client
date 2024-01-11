//*****************************************************************************
//*	File:	RoadBump2.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= DestColor;
		DestBlend			= SrcColor;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 16;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Clamp;

		AlphaOp[1]			= BlendDiffuseAlpha;
		AlphaArg1[1]			= Tfactor;
		AlphaArg2[1]			= Current;
		ColorOp[1]			= BlendDiffuseAlpha;
		ColorArg2[1]			= Texture;
		ColorArg1[1]			= Tfactor;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Wrap;
		AddressV[1]			= Clamp;

	}  //pass P0
}  // technique RenderScene
