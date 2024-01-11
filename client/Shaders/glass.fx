//--------------------------------------------------------------//
// Glass Effect 
//--------------------------------------------------------------//
float4x4 WorldViewProjTM;

float4 ViewPos : ViewPosition;
struct VS_OUTPUT 
{
   float4 Pos:     POSITION;
   float3 normal:  TEXCOORD0;
   float3 viewVec: TEXCOORD1;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float3 normal: NORMAL)
{
   VS_OUTPUT Out;

   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.normal = normal;
   Out.viewVec = ViewPos - Pos;

   return Out;
}

float Rainbowiness = 0.50;
sampler Environment = sampler_state
{
   ADDRESSU = CLAMP;
   ADDRESSV = CLAMP;
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
};


sampler Rainbow = sampler_state
{
   ADDRESSU = CLAMP;
   ADDRESSV = CLAMP;
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
};

float4 PSMain(float3 normal: TEXCOORD0, float3 viewVec: TEXCOORD1) : COLOR 
{
   normal = normalize(normal);

   float v = dot(normalize(viewVec), normal);
   // Map a rainbowish color
   float3 rainbow = tex1D(Rainbow, v);

   // Find the reflection
   float3 reflVec = reflect(-viewVec, normal);
   float3 refl = texCUBE(Environment, reflVec);

   float3 color = lerp(refl, rainbow, Rainbowiness * v);
   return float4(color, 1 - v);
}

technique SimpleGlass
{
   pass Crystal
   {
      ZWRITEENABLE = TRUE;
      SRCBLEND = SRCALPHA;
      DESTBLEND = INVSRCALPHA;
      CULLMODE = CCW;
      ALPHABLENDENABLE = TRUE;

      VertexShader = compile vs_1_1 VSMain();
      PixelShader = compile ps_2_0 PSMain();
   }

}

