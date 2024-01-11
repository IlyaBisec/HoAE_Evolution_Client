float ShaderConst1 = 1;
float Time;
float4x4	WorldViewTM;
float4x4	WorldTM;
float4x4	ProjTM;

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 Diffuse	: COLOR0;
   float2 UV3: TEXCOORD3;
   //float  Fog		: FOG;
   float2 Tex		: TEXCOORD0;
};

float  FogDensity	= 0.00002f;

VS_OUTPUT MainVS(float4 Pos: POSITION, float4 Diffuse: COLOR0, float2 Tex: TEXCOORD0, float2 Center: TEXCOORD1)
{
	VS_OUTPUT Out;	
        Out.UV3 = mul(WorldTM, Pos).xy/16384;
	Out.Pos		= mul( WorldViewTM, Pos );	
	Center *= WorldTM._m00*1.5*ShaderConst1*ShaderConst1;
	Out.Pos.xy += Center+float2(cos(Pos.x+Time*1.3),cos(Pos.y+Time*1.1));
	Out.Pos		= mul( ProjTM, Out.Pos );
	Out.Diffuse = Diffuse*1.2;
	Out.Tex		= Tex;	
	//Out.Fog		= 1.f/exp( Out.Pos.z*FogDensity );
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
		AlphaRef			= 0x38; 
		ColorVertex			= False;
		SpecularEnable		= False; 
		CullMode			= None;			
		FillMode			= Solid;
		ShadeMode			= Gouraud;		
		DitherEnable		= True;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		FogEnable = true;	
		
		
		ColorOp[0]			= Modulate2x;
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0] 		= Diffuse; 
		AlphaArg2[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		
		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= Disable;

		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;
		
		VertexShader		= compile vs_1_1 MainVS();       
    }
} // technique RenderScene