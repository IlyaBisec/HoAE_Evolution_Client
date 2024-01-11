//--------------------------------------------------------------//
// Ocean
//--------------------------------------------------------------//

//  Constants
float4x4		c_ViewProjTM;
float4			c_ViewPos;
float			c_Time;
float4			c_Scale				= { 0.01, 0.01, 0.01, 1.00 };
float    		c_WaveSpeed			= 0.34;
float    		c_NoiseSpeed		= 0.18;
float    		c_FadeBias			= 0.30;
float    		c_FadeExp			= 6.08;
float4   		c_WaterColor		= { 0.20, 0.35, 0.68, 1.00 };

struct VSOutput 
{
   float4 Pos:    POSITION;
   float3 pos:    TEXCOORD0;
   float3 normal: TEXCOORD1;
   float3 vVec:   TEXCOORD2;
}; // struct VSOutput 

VSOutput OceanVS( float4 Pos: POSITION, float3 normal: NORMAL )
{
   VSOutput Out;

   // Get some size on the water
   //Pos.xy		*= 1000;
   //Pos.z		= -30;

   Out.Pos      = mul( c_ViewProjTM, Pos );
   Out.pos      = Pos.xyz * c_Scale;
   Out.vVec     = Pos - c_ViewPos;
   Out.normal   = normal;

   return Out;
} // OceanVS 

sampler Noise = sampler_state
{
   AddressU     = Wrap;
   AddressV     = Wrap;
   AddressW     = Wrap;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler Noise

sampler SkyBox = sampler_state
{
   AddressU     = Clamp;
   AddressV     = Clamp;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler SkyBox

float4 OceanPS( float3 pos: TEXCOORD0, float3 normal: TEXCOORD1, float3 vVec: TEXCOORD2 ) : COLOR 
{
   pos.x += c_WaveSpeed  * c_Time*0.3;
   pos.z += c_NoiseSpeed * c_Time*0.3;

   float4 noisy = tex3D( Noise, pos );

   // Signed noise 
   float3 bump = 2 * noisy - 1;
   bump.xy *= 0.15;
   // Make sure the normal always points upwards
   bump.z = 0.8 * abs( bump.z ) + 0.2;
   // Offset the surface normal with the bump
   bump = normalize( normal + bump );

   // Find the reflection vector
   float3 reflVec   = reflect( vVec, bump );
   float4 refl      = texCUBE( SkyBox, reflVec.yzx );
   float  lrp		= 1 - dot( -normalize( vVec ), bump );

   //  interpolate between the water color and reflection
   return lerp( c_WaterColor, refl, saturate( c_FadeBias + pow( lrp, c_FadeExp ) ) );
} // OceanPS

//--------------------------------------------------------------//
// Technique Section for Ocean
//--------------------------------------------------------------//
technique Ocean
{
   pass Water
   {
      ZEnable        = True;
      CullMode       = None;
      
      VertexShader   = compile vs_1_1 OceanVS();
      PixelShader    = compile ps_2_0 OceanPS();
   }
} // technique Ocean

