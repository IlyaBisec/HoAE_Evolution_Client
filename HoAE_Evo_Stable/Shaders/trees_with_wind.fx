//*****************************************************************************
//*	File:	trees_with_wind.fx
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 

float4x4	WorldTM;
float4x4	ViewProjTM;
float		Time;

float3		WindDir = { 2.0f, 1.0f, 0.0f };

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 Diffuse	: COLOR0;
   float  Fog		: FOG;
   float2 Tex		: TEXCOORD0;
};

float  FogDensity	= 0.00002f;

VS_OUTPUT MainVS(float4 Pos: POSITION, float4 Diffuse: COLOR0, float2 Tex: TEXCOORD0)
{
	VS_OUTPUT Out;	
	float d = (Pos.z - WorldTM._m23);
	Pos.xy  += WindDir*d*d*sin((Time*0.4f-(Pos.x+Pos.y)*0.003f)*0.8f)*0.00005f;
	Out.Pos		= mul( ViewProjTM, Pos );
	Out.Diffuse = Diffuse;
	Out.Tex		= Tex;	
	Out.Fog		= 1.f/exp( Out.Pos.z*FogDensity );
	return Out;
} // MainVS

technique RenderScene
{
    pass P0
    {          
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		
		AlphaBlendEnable	= True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0xA0; 
		ColorVertex			= True;
		CullMode			= None;
		Lighting			= False; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		
		FogEnable			= True;		
		
		ColorOp[0]			= SelectArg2;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0] 		= Texture; 

		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;  
		
		ColorOp[1]			= Disable;  
		AlphaOp[1] 			= Disable;          
		AddressU[1]			= Wrap;            
		AddressV[1]			= Wrap;      
		
		VertexShader		= compile vs_1_1 MainVS();      
    }
} // technique RenderScene
