
float4 		LightAmbient        = { 0.3f, 0.3f, 0.3f, 1.0f };    
float4 		LightDiffuse        = { 1.0f, 1.0f, 1.0f, 1.0f };    
float4 		LightSpecular       = { 1.0f, 1.0f, 1.0f, 1.0f };   

// material reflectivity
float4 		MaterialAmbient     = { 1.0f, 1.0f, 1.0f, 1.0f };   
float4 		MaterialDiffuse     = { 1.0f, 1.0f, 1.0f, 1.0f };   
float4 		MaterialSpecular    = { 1.0f, 1.0f, 1.0f, 1.0f };  
float  		MaterialPower       = 32.0f;                        

float4x4	WorldViewProjTM;
float4x4	WorldViewTM;
float4x4	ViewProjTM;
float4x4	WorldTM;
float4		ViewPos;
float4x4    LightViewTM;
float4x4    LightProjTM;

float       ShadowBias          = 0.003f;
float       DistanceScale       = 0.00008f;

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 pos		: TEXCOORD0;
   float4 Diffuse	: TEXCOORD1;
   float2 Tex		: TEXCOORD2;
   float4 ShadowUV  : TEXCOORD3;
}; // struct VS_OUTPUT 

VS_OUTPUT MainVS(float4 Pos: POSITION, float3 Normal: NORMAL, float2 Tex: TEXCOORD0)
{
	VS_OUTPUT Out;

	float3 L        = float3( -LightViewTM._m02, -LightViewTM._m12, -LightViewTM._m22 );
    float3 N        = normalize( mul( (float3x3)WorldTM, Normal ) ); 
	Out.Diffuse     = LightDiffuse*MaterialDiffuse*max( 0, dot( N, L ) );
	Out.Tex		    = Tex;
	Out.pos         = mul( WorldTM, Pos );
	Out.ShadowUV    = mul( LightViewTM, Out.pos );
	Out.ShadowUV    = mul( LightProjTM, Out.ShadowUV );
	Out.Pos         = mul( WorldViewProjTM, Pos );
	Out.ShadowUV.x  = Out.ShadowUV.x*0.5f + 0.5f;
	Out.ShadowUV.y  = 0.5f - Out.ShadowUV.y*0.5f;
	return Out;
} // MainVS

sampler DiffuseMap = sampler_state
{
   AddressU     = Wrap;
   AddressV     = Wrap;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler DiffuseMap

sampler ShadowMap = sampler_state
{
   AddressU     = Clamp;
   AddressV     = Clamp;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler ShadowMap

const float HalfPixel  = 0.5f/512.0f;
const float SampleStep = 1.0f/512.0f;

float4 MainPS(  float4 pos:         TEXCOORD0, 
                float4 Diffuse:     TEXCOORD1, 
                float2 Tex:         TEXCOORD2,
                float4 ShadowUV:    TEXCOORD3 ) : COLOR 
{
   float4 diffuseMap    = tex2D     ( DiffuseMap, Tex );
   float  depth         = length    ( mul( LightViewTM, pos ) )*DistanceScale;
   
   float2 c = float2( ShadowUV.x - HalfPixel, ShadowUV.y - HalfPixel );
   float  shC           = tex2D     ( ShadowMap, c );
   shC = (depth > shC - ShadowBias);
   
   float4 res = (LightAmbient*MaterialAmbient + Diffuse*shC)*diffuseMap;
   res.a = diffuseMap.a;
   return res;
} // MainPS

float4 Sample5PS(   float4 pos:         TEXCOORD0,
                    float4 Diffuse:     TEXCOORD1,
                    float2 Tex:         TEXCOORD2,
                    float4 ShadowUV:    TEXCOORD3 ) : COLOR 
{
   float4 diffuseMap    = tex2D     ( DiffuseMap, Tex );
   float  depth         = length    ( mul( pos, LightViewTM ) )*DistanceScale;
   
   float2 c = float2( ShadowUV.x - HalfPixel, ShadowUV.y - HalfPixel );
   
   float  shC           = tex2D     ( ShadowMap, ShadowUV );
   float  shL           = tex2D     ( ShadowMap, float2( c.x - SampleStep, c.y ) );
   float  shR           = tex2D     ( ShadowMap, float2( c.x + SampleStep, c.y ) );
   float  shT           = tex2D     ( ShadowMap, float2( c.x, c.y - SampleStep ) );
   float  shB           = tex2D     ( ShadowMap, float2( c.x, c.y + SampleStep ) );
   
   shC = (depth > shC - ShadowBias);
   shL = (depth > shL - ShadowBias);
   shR = (depth > shR - ShadowBias);
   shT = (depth > shT - ShadowBias);
   shB = (depth > shB - ShadowBias);
   
   shC = (shC + shL + shT + shB + shR)/5.0f;
   
   float4 res = (LightAmbient*MaterialAmbient + Diffuse*shC)*diffuseMap;
   res.a = diffuseMap.a;
   return res;
} // Sample5PS

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
		CullMode			= CW;			
		FillMode			= Solid;		
		ShadeMode			= Gouraud;		
		DitherEnable		= True;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		ClipPlaneEnable     = 0;
		
		VertexShader		= compile vs_1_1 MainVS();  
		PixelShader		    = compile ps_2_0 Sample5PS();     
    }
} // technique RenderScene