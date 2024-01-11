//*****************************************************************************
//*	File:	Lines.fx
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
		AlphaTestEnable			= False;
		Lighting			    = False;
		SpecularEnable			= False;
		ZEnable			        = False;
		ZWriteEnable			= False;
		FogEnable			= False;		

		ColorOp[0]			    = SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			    = SelectArg1;
		AlphaArg1[0]			= Diffuse;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

	}  //pass P0
}  // technique RenderScene
