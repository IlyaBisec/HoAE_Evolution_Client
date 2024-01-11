//*****************************************************************************
//*	File:	terrain_patch_mul.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend			    = SrcAlpha;
		DestBlend			    = InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			    = GreaterEqual;
		AlphaRef			    = 0x00000004;
		DitherEnable			= False;
		Lighting			    = False;
		SpecularEnable			= False;
		ZEnable			        = False;
		ZWriteEnable			= False;
		ZFunc			        = Less;
		FillMode			    = Solid;
		CullMode			    = None;

		ColorOp[0]			    = Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			    = Modulate;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			    = Mirror;
		AddressV[0]			    = Mirror;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]		= Linear;

		ColorOp[1]			    = Disable;
		AlphaOp[1]			    = Disable;

	}  //pass P0
}  // technique RenderScene
