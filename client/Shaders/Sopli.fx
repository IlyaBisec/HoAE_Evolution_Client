//*****************************************************************************
//*	File:	Sopli.fx
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
		AlphaRef			= 16;
		FillMode			= Solid;
		ZEnable			= True;
		ZWriteEnable			= False;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Diffuse;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorArg1[1]			= Current;
		ColorOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		AlphaOp[1]			= SelectArg1;

	}  //pass P0
}  // technique RenderScene
