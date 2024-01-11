float       DistanceScale       = 0.00008f;
float4x4    LightViewTM;
float4x4    LightProjTM;
float4x4    WorldTM;
float4x4    ViewProjTM;

struct VS_OUTPUT 
{
   float4 Pos:      POSITION;
   float3 LightVec: TEXCOORD0;
   float2 Tex:      TEXCOORD1;
}; // struct VS_OUTPUT

VS_OUTPUT MainVS( float4 Pos: POSITION, float2 Tex: TEXCOORD0 )
{
    VS_OUTPUT Out;
    Out.Pos      = mul( WorldTM, Pos );
    Out.Pos      = mul( LightViewTM, Out.Pos );
    Out.LightVec = DistanceScale * Out.Pos;
    Out.Pos      = mul( LightProjTM, Out.Pos );
    Out.Tex      = Tex;
    return Out;
} // MainVS

sampler DiffuseMap = sampler_state
{
   AddressU     = Clamp;
   AddressV     = Clamp;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler DiffuseMap

float4 MainPS( float3 LightVec: TEXCOORD0, float2 Tex: TEXCOORD1 ) : COLOR 
{
    float4 dif  = tex2D( DiffuseMap, Tex );
    float  len  = length( LightVec );
    dif.rgb     = len;
    return dif;
} // MainPS

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
		CullMode			= None;			
		FillMode			= Solid;		
		ShadeMode			= Gouraud;		
		DitherEnable		= False;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		ClipPlaneEnable     = 0;
				
		VertexShader		= compile vs_1_1 MainVS();  
		PixelShader		    = compile ps_2_0 MainPS();     
    }
} // technique RenderScene