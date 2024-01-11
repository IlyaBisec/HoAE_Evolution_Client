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
		AlphaBlendEnable		= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZWriteEnable			= True;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable			= False;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;

	}  //pass P0
}  // technique RenderScene
