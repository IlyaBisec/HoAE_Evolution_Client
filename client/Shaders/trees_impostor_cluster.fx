
float4x4	ViewProjTM;

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 Diffuse	: COLOR0;
   float  Fog		: FOG;
   float2 Tex		: TEXCOORD0;
};

float  FogDensity	= 0.00002f;

VS_OUTPUT MainVS(float4 Pos: POSITION, float4 Diffuse: COLOR0, float2 Tex: TEXCOORD0, float2 Center: TEXCOORD1)
{
	VS_OUTPUT Out;	
	Out.Pos		= mul( ViewProjTM, Pos );
	Out.Pos.xy += Center;
	Out.Diffuse = Diffuse;
	Out.Tex		= Tex;	
	Out.Fog		= 1.f/exp( Out.Pos.z*FogDensity );
	return Out;
} // MainVS

technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True; 
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0xA0; 
		ColorVertex			= False;
		SpecularEnable		= False; 
		CullMode			= None;			
		FillMode			= Solid;		
		ShadeMode			= Gouraud;		
		DitherEnable		= True;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		
		FogEnable			= True;
		FogColor			= 0xFFFFFFFF;
		FogTableMode		= None;
		RangeFogEnable		= True;	
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0] 		= Diffuse; 
		AlphaArg2[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Point;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		
		ColorOp[1]			= Disable;  
		AlphaOp[1]			= Disable;
		
		VertexShader		= compile vs_1_1 MainVS();       
    }
} // technique RenderScene