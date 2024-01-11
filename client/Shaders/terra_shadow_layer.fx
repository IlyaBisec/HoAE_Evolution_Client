//*****************************************************************************
//*	File:	terra_shadow_layer.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Texture;
		ColorArg2[1]			= Current;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Texture;
		AlphaArg2[1]			= Current;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		MipFilter[1]			= None;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		TexCoordIndex[1]			= CameraSpacePosition;
		TextureTransformFlags[1]			= Count2;

	}  //pass P0
}  // technique RenderScene
