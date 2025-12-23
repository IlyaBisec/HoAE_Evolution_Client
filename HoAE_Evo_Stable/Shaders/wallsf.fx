//*****************************************************************************
//*	File:	wallsf.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		AlphaTestEnable			= False;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		ColorVertex			= True;
		NormalizeNormals			= True;
		CullMode			= None;
		Lighting			= True;
		FillMode			= Solid;
		ShadeMode			= Gouraud;
		DitherEnable			= False;
		Ambient			= ambColor;
		MaterialDiffuse			= difColor;
		MaterialAmbient			= ambColor;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;

		LightType[0]			= Directional;
		LightDiffuse[0]			= difColor;
		LightAmbient[0]			= ambColor;
		LightDirection[0]			= lightDir;
		LightRange[0]			= 10000;
		LightEnable[0]			= True;
		TextureTransformFlags[0]			= Count2;
		TexCoordIndex[0]			= 0;
		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Disable;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		TexCoordIndex[1]			= 0;
		ColorOp[1]			= BlendDiffuseAlpha;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Tfactor;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;

	}  //pass P0
}  // technique RenderScene
