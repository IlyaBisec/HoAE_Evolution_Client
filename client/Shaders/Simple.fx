
float3		c_LightDir = {0.577, -0.577, 0.577};
float4 		c_LightAmbient = { 0.1f, 0.1f, 0.1f, 1.0f };    
float4 		c_LightDiffuse = { 1.0f, 1.0f, 1.0f, 1.0f };    
float4 		c_LightSpecular = { 1.0f, 1.0f, 1.0f, 1.0f };   

// material reflectivity
float4 		c_MaterialAmbient = { 1.0f, 1.0f, 1.0f, 1.0f };   
float4 		c_MaterialDiffuse = { 1.0f, 1.0f, 1.0f, 1.0f };   
float4 		c_MaterialSpecular = { 1.0f, 1.0f, 1.0f, 1.0f };  
float  		c_MaterialPower   = 32.0f;                        

float4x4	WorldViewProjTM;
float4x4	WorldViewTM;
float4		ViewPos;

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 Diffuse	: COLOR0;
   float2 Tex		: TEXCOORD0;
};

VS_OUTPUT MainVS(float4 Pos: POSITION, float3 Normal: NORMAL, float2 Tex: TEXCOORD0)
{
	VS_OUTPUT Out;

	float3 L = -c_LightDir;
    float3 N = mul( (float3x3)WorldViewTM, Normal ); 
    N = normalize( N );

	Out.Pos		= mul(WorldViewProjTM, Pos);
	Out.Diffuse = c_LightAmbient*c_MaterialAmbient + 
					c_LightDiffuse*c_MaterialDiffuse*max(0, dot(N, L));
	Out.Tex		= Tex;
	return Out;
}

technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True; 
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= False;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= False;
		SpecularEnable		= False; 
		CullMode			= CCW;			
		FillMode			= Solid;		
		ShadeMode			= Gouraud;		
		DitherEnable		= True;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= TFactor; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		
		VertexShader		= compile vs_1_1 MainVS();       
    }
} // technique RenderScene