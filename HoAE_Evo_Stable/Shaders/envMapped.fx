//*****************************************************************************
//*	File:	envMapped.fx
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
		SpecularEnable			= False;
		NormalizeNormals			= True;
		CullMode			= CW;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= True;
		Ambient			= ambColor;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		MaterialSpecular			= spColor;
		MaterialPower			= 0.500000;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;

		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightSpecular[0]			= spColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 1000;
		LightEnable[0]			= True;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= Linear;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Diffuse;
		TexCoordIndex[1]			= CameraSpaceReflectionVector;
		MipFilter[1]			= Linear;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
