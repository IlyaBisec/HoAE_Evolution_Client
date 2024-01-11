//*****************************************************************************
//*	File:	bump_default.fx
//*	Author:	Andrew Shpagin
//*	Date:	22.09.2006
//***************************************************************************** 

//#define RANDOMLIGHT
#define DISPLACEMENT  1.0
#define TEXSIZE       1024.0
#define BUMPSTRENGTH  0.0
#define SPECULARTYPE  1
#define HEIGHTSRC r

#define HSIGN -

#include "include\skinning_base.fx"

technique RenderScene
{
    pass P0
    {   

#include "Include\skinning_renderstates.fx"

		VertexShader = compile vs_2_0 VSMain();
  		PixelShader = compile ps_2_0 PS_bumpspec();
    }
} // technique RenderScene
