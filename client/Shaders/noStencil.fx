//*****************************************************************************
//*	File:	noStencil.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************

technique RenderScene
{
	pass P0
	{
		StencilEnable			= False;

	}  //pass P0
}  // technique RenderScene
