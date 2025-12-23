//*****************************************************************************
//*	File:	halfTransparent.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		AlphaTestEnable			= True;
		ColorVertex			= False;
		CullMode			= CW;
		FillMode			= Solid;
		TextureTransformFlags			= Count2;
		ZEnable			= True;
		ZWriteEnable			= True;
		ZFunc			= LessEqual;
		ColorWriteEnable			= 0x0000000F;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Texture;
		ColorArg2[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		TexCoordIndex[0]			= PassThru;

		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;

	}  //pass P0
}  // technique RenderScene
