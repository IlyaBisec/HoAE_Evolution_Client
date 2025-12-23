//*****************************************************************************
//*	File:	Facture.fx
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
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable			= False;		

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Texture;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MipFilter[0]			= None;

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaArg2[1]			= Diffuse;
		AlphaOp[1]			= SelectArg2;
		MinFilter[1]			= Anisotropic;
		MagFilter[1]			= Anisotropic;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MipFilter[1]			= None;

	}  //pass P0
}  // technique RenderScene
