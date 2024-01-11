//*****************************************************************************
//*	File:	Wire.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
technique RenderScene
{
	pass P0
	{
	    AlphaBlendEnable    = False;
	    AlphaTestEnable     = False;
		FillMode			= Wireframe;
		ZEnable			    = True;
		ZWriteEnable		= True;
        DepthBias           = -0.001;
    
		ColorOp[0]			= SelectArg1;
		ColorArg1[0]		= Tfactor;
		AlphaOp[0]			= Disable;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

	}  //pass P0
}  // technique RenderScene
