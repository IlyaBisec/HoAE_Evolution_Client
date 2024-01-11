//*****************************************************************************
//*	File:	smoothShaded.fx
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
		ColorVertex			= True;
		SpecularEnable			= False;
		DitherEnable			= True;
		CullMode			= None;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		ZEnable			= True;
		ZBias			= 0;
		ZWriteEnable			= True;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		Ambient			= ambColor;

		LightEnable[0]			= True;
		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 1000.000000;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;

		LightEnable[1]			= True;
		LightType[1]			= Directional;
		LightDiffuse[1]			= difColor;
		LightAmbient[1]			= ambColor;
		LightDirection[1]			= lightDir1;
		LightRange[1]			= 1000.000000;
		ColorOp[1]			= Disable;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Disable;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Diffuse;
		MinFilter[1]			= None;
		MagFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
