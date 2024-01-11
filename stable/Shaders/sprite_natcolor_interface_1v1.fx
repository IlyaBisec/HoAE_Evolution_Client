//*****************************************************************************
//*	File:	hud.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000001;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZFunc				= LessEqual;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;
		DepthBias           = -0.002;
		FogEnable			= False;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= AddSigned2x;
		AlphaArg1[0]			= Specular;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= BlendCurrentAlpha;
		ColorArg1[1]			= Specular;
		ColorArg2[1]			= Current;
		AlphaOp[1]			= Modulate2x;
		AlphaArg1[1]			= Diffuse;
		AlphaArg2[1]			= Texture;
		TexCoordIndex[1]		= 0;
		MinFilter[1]			= Point;
		MagFilter[1]			= Point;

		ColorOp[2]			= Disable;
		AlphaOp[2]			= Disable;		

	}  //pass P0	
}  // technique RenderScene
