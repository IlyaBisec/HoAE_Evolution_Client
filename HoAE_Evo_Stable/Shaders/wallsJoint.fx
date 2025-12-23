//*****************************************************************************
//*	File:	wallsJoint.fx
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
		CullMode			= None;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		Ambient			= ambColor;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		MaterialSpecular			= spColor;
		MaterialPower			= 32;
		TextureTransformFlags			= Count2;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;

		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightSpecular[0]			= spColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 10000;
		LightEnable[0]			= True;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

	}  //pass P0
}  // technique RenderScene
