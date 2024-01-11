//*****************************************************************************
//*	File:	navimesh.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		CullMode			= None;
		FillMode			= Solid;
		ZEnable			= True;
		ZWriteEnable			= False;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Tfactor;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Tfactor;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

	}  //pass P0
}  // technique RenderScene
