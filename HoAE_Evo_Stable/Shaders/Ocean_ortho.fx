//--------------------------------------------------------------//
// Ocean
//--------------------------------------------------------------//

//  Constants
float4x4		WorldViewProjTM;
float4x4		WorldViewTM;
float4x4        TextureTM1;
float4x4        TextureTM2;
float4			ViewPos;
float3          lDir            = { -1, -1, -1 };
float			Time;
float4			Scale			= { 8.0, 8.0, 8.0, 1.00 };
float    		WaveSpeed		= 0.005f;
float    		NoiseSpeed		= 0.06f;
float    		FadeBias		= 0.06f;
float    		FadeExp			= 5.08f;
float4   		WaterColor		= { 0.40, 0.60, 0.80, 0.6 };

struct VSOutput 
{
    float4 Pos:     POSITION;
    float4 clWater :COLOR0;
    float4 pos:     TEXCOORD0;
    float3 normal:  TEXCOORD1;
    float3 vVec:    TEXCOORD2;    
    float2 reflUV:  TEXCOORD3;
    float2 shUV:    TEXCOORD4;
    
}; // struct VSOutput 

VSOutput OceanVS( float4 Pos: POSITION, float4 diffuse: COLOR0 )
{
	VSOutput Out;
	
	Out.pos      = Pos;
	Out.vVec     = normalize(Out.pos - ViewPos);
	
	Out.Pos      = mul( WorldViewProjTM, Out.pos );
	Out.normal   = float3( 0.0f, 0.0f, 1.0f );//normal;
	
	float4 shUV = mul( WorldViewTM, Out.pos );
    float4 reflUV = shUV;
    shUV = mul( TextureTM2, shUV );
    shUV.xy /= shUV.w;
    Out.shUV = shUV.xy;
    
    reflUV = mul( TextureTM1, reflUV );
    reflUV.xy /= reflUV.w;
    Out.reflUV   = reflUV.xy;
    Out.clWater  = diffuse;
    Out.clWater.xyz = WaterColor.xyz;
    
    Out.pos *= 0.003;
    Out.pos.z = Out.pos.z - NoiseSpeed*Time -  Out.pos.x*0.127f + Out.pos.y*0.111f;
    float y0=Out.pos.y;
	Out.pos.y = Out.pos.y + Out.pos.x + WaveSpeed*Time  ;	
	Out.pos.x = Out.pos.x - y0;

   return Out;
} // OceanVS 

sampler Noise :register( s0 ) = sampler_state
{
   AddressU     = Wrap;
   AddressV     = Wrap;
   AddressW     = Wrap;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;   
}; // sampler Noise

sampler ReflectionMap :register( s1 ) = sampler_state
{
   AddressU     = Clamp;
   AddressV     = Clamp;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler ReflectionMap

sampler ShadowMap :register( s2 ) = sampler_state
{
   AddressU     = Clamp;
   AddressV     = Clamp;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler ReflectionMap

float4 OceanPS( float4 clWater: COLOR0,
                float3 pos:     TEXCOORD0, 
                float3 normal:  TEXCOORD1, 
                float3 vVec:    TEXCOORD2,
                float3 reflUV:  TEXCOORD3,
                float3 shUV:    TEXCOORD4 ) : COLOR 
{ 
   
   
   float3 noisy;
   noisy = tex3D(Noise, pos);   
   float2 bump = 2 * noisy - 1;
   bump *= float2(0.005,0.1);
   float4 refl = tex2D( ReflectionMap, reflUV + bump );
   float4 shColor = tex2D( ShadowMap, shUV );
   float c=1;//(1+vVec.z)*1.5;
   c=c*c;
   float3 res = refl;//lerp( clWater, refl, c);
   //res*=(4-vVec.z)/4;
   res*=1.1f;
   float a=0.5-(noisy.x-noisy.y)/1.5;
   res*=a*2*clWater;
   return float4(res.x, res.y, res.z, (0.1+1.3*c*(clWater.a))/*2*(noisy.y)*/ );
} // OceanPS

//--------------------------------------------------------------//
// Technique Section for Ocean
//--------------------------------------------------------------//
technique Ocean
{
   pass Water
   {
	  ZWriteEnable      = True;
	  ZEnable           = True;
      SrcBlend          = SrcAlpha;
      DestBlend         = InvSrcAlpha;
      CullMode          = CCW;
      AlphaBlendEnable	= True;
      FillMode          = Wireframe;//Solid;
      DitherEnable      = True;
      Fillmode          = Solid;
      FogEnable			= True;
      
      VertexShader      = compile vs_1_1 OceanVS();
      PixelShader       = compile ps_2_0 OceanPS();
   }
} // technique Ocean

