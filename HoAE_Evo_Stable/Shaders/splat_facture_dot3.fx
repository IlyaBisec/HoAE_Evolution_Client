//*****************************************************************************
//*	File:	dot3.fx
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
		AlphaTestEnable			= False;
		ColorVertex			= True;
		SpecularEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		Lighting			= False;
		FillMode			= Solid;
		CullMode			= CCW;
		SpecularMaterialSource			= Color2;

		ColorOp[0]			= DotProduct3;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= None;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		TexCoordIndex[1]			= 0;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		MipFilter[1]			= None;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;

		ColorOp[2]			= BlendDiffuseAlpha;
		ColorArg2[2]			= TFactor;
		ColorArg1[2]			= Current;
		TexCoordIndex[2]			= 0;
		AlphaOp[2]			= SelectArg1;
		AlphaArg1[2]			= Diffuse;
		MipFilter[2]			= None;

	}  //pass P0
}  // technique RenderScene
