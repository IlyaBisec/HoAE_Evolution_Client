//*****************************************************************************
//*	File:	smoothWire.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= False;
		AlphaTestEnable			= False;
		ColorVertex			= False;
		SpecularEnable			= True;
		NormalizeNormals			= True;
		CullMode			= CCW;
		Lighting			= True;
		FillMode			= WireFrame;
		ShadeMode			= Gouraud;
		DitherEnable			= True;
		Ambient			= ambColor;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;

		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightSpecular[0]			= difColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 10000;
		LightEnable[0]			= True;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= None;
		MagFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
