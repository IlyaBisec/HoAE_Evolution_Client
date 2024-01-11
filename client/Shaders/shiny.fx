//*****************************************************************************
//*	File:	shiny.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= False;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= False;
		AlphaFunc			= Greater;
		AlphaRef			= 0x00000000;
		ColorVertex			= False;
		SpecularEnable			= True;
		ZEnable			= True;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= True;
		Ambient			= ambColor;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		MaterialSpecular			= spColor;
		MaterialPower			= 0.300000;

		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightSpecular[0]			= spColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 10000;
		LightEnable[0]			= True;
		LightAttenuation0[0]			= 1.000000;
		LightAttenuation1[0]			= 0.000000;
		LightAttenuation2[0]			= 0.000000;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		LightType[1]			= Directional;
		LightDiffuse[1]			= difColor;
		LightAmbient[1]			= ambColor;
		LightSpecular[1]			= spColor;
		LightDirection[1]			= lightDir;
		LightRange[1]			= 10000;
		LightEnable[1]			= True;
		LightAttenuation0[1]			= 1.000000;
		LightAttenuation1[1]			= 0.000000;
		LightAttenuation2[1]			= 0.000000;
		ColorOp[1]			= Disable;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Disable;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Diffuse;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
