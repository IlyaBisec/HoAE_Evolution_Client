//*****************************************************************************
//*	File:	units_shadow.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= Less;
		AlphaRef			= 0xA0;
		DitherEnable		= False;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= False;
		FillMode			= Solid;
		CullMode			= None;
		DepthBias           = -0.0002;

		ColorOp[0]			= Modulate2X;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Point;
		MagFilter[0]		= Linear;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
