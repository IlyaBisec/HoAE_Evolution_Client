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
float4   		WaterColor		= { 0.350, 0.50, 0.70, 0.6 };
float Waterline;
float BoilingCoef;

struct VSOutput 
{
    float4 Pos:     POSITION;
    float4 clWater :COLOR0;
    float4 pos:     TEXCOORD0;
    float3 normal:  TEXCOORD1;
    float3 vVec:    TEXCOORD2;    
    float2 reflUV:  TEXCOORD3;
    float2 shUV:    TEXCOORD4;
    float2 fogUV:   TEXCOORD6;    
    float4 Waves:   TEXCOORD7;    
    float4 Waves2:  TEXCOORD5;    
    
}; // struct VSOutput 

VSOutput OceanVS( float4 Pos: POSITION, float4 diffuse: COLOR0 )
{
	VSOutput Out;
	Out.fogUV=Pos.xy/16384;

	// Boiling water:
	const float TimeScale = 3;
	Pos.z += Waterline / 1000.0f * BoilingCoef * (cos(Time*3*TimeScale+(Pos.y+Pos.x)*0.021)+cos(Time*1.3*TimeScale+Pos.x*0.024-Pos.y*0.023)+cos(Time*1.76*TimeScale+Pos.y*0.025-Pos.x*0.020))*15;
	
	Out.pos      = Pos;
	Out.pos.z += Waterline;
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
    
    const float NoiseCoordScale = 0.003f;
    Out.pos *= NoiseCoordScale;//0.003;
    Out.pos.z = Out.pos.z - NoiseSpeed*Time -  Out.pos.x*0.127f + Out.pos.y*0.111f - NoiseCoordScale * Waterline;
    float y0=Out.pos.y;
	Out.pos.y = Out.pos.y + Out.pos.x + WaveSpeed*Time  ;	
	Out.pos.x = Out.pos.x - y0;

   Out.Waves=float4(Pos.x/2524,Pos.y/2302,diffuse.w+Time/16,1-diffuse.w);
   Out.Waves2=float4(Pos.x/2024,Pos.y/2512,diffuse.w-Time/16,1-diffuse.w);
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
sampler FogMap :register( s3 ) = sampler_state
{
   AddressU     = Wrap;
   AddressV     = Wrap;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler ReflectionMap

float4 OceanPS( float4 clWater: COLOR0,
                float3 pos:     TEXCOORD0, 
                float3 normal:  TEXCOORD1, 
                float3 vVec:    TEXCOORD2,
                float3 reflUV:  TEXCOORD3,
                float3 shUV:    TEXCOORD4,
		float  shZ:     TEXCOORD5,
		float2 fogUV:   TEXCOORD6,
                float4 Waves:   TEXCOORD7,
                float4 Waves2:   TEXCOORD5 ) : COLOR 
{
   float3 noisy = tex3D(Noise, pos);
   float w =  tex3D(Noise,Waves.xyz);
   //w+=(tex3D(Noise,Waves.xyz-float3(0,0,0.02))-0.5)/3;
   
   w = abs(w-0.5)*2*Waves.w;
   float da=0.85-pow(Waves.w,8)*1.15;
   float2 bump = 2 * noisy - 1+w*4;
   bump *= float2(0.005,0.2);
   float4 refl = tex2D( ReflectionMap, reflUV + bump );
   float4 shColor = tex2D( ShadowMap, shUV );
   float c=(1+vVec.z)*1.5;
   c=c*c;
   float4 res = refl;//lerp( clWater, refl, c);
   //res*=(4-vVec.z)/4;
   res*=1.1f;
   float a=0.5-(noisy.x-noisy.y)/1.5;
   res*=a*2*clWater;
   float4 fogC=tex2D(FogMap,fogUV);
   res.w=da*0.3+1.3*c*(clWater.a);
   res=lerp(res,fogC,fogC.w);
   float4 f=res;   
   float d=clamp(w*w*w*26*da,-0.98,0.98);

   d *= step(1.0f, BoilingCoef); // When boiling
   f *= (1.0f + d); // we should draw froth.

//   f+=d;
//   f.w-=0.2;
  // f.w*=pow(1-Waves.w,0.001);

   return f;
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
      AlphaTestEnable		= True;
      AlphaFunc			= GreaterEqual;
      AlphaRef			= 10;
      
      VertexShader      = compile vs_1_1 OceanVS();
      PixelShader       = compile ps_2_0 OceanPS();
   }
} // technique Ocean

