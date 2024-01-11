//*****************************************************************************
//*	File:	wireSprite.fx
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
		AlphaRef			= 0x00000004;
		DitherEnable			= False;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable			= True;
		ZWriteEnable			= True;
		FillMode			= Wireframe;
		CullMode			= None;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		AddressU[0]			= Mirror;
		AddressV[0]			= Mirror;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
