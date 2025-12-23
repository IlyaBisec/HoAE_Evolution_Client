//*****************************************************************************
//*	File:	Water.fx
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
		ColorVertex			= False;
		Lighting			= False;
		SpecularEnable			= False;
		FillMode			= Wireframe;
		ZEnable			= True;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Current;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]			= Tfactor;
		AlphaArg2[0]			= Diffuse;
		MipFilter[0]			= None;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

	}  //pass P0
}  // technique RenderScene
