//*****************************************************************************
//*	File:	Evo_Ocean.fx
//*	Desc:	Max shader for dx9
//*	Author:	Ilya Bisec
//*	Date:	26.06.2026
//*****************************************************************************

//--------------------------------------------------------------
// Evo Ocean 2.0 (DX9 modernized upgrade)
//--------------------------------------------------------------


float4x4 WorldViewProjTM;
float4x4 WorldViewTM;
float4x4 TextureTM1;
float4x4 TextureTM2;

float4 ViewPos;
float3 lDir;

float Time;

float4 WaterColor = { 0.02, 0.10, 0.14, 0.65 }; // 🔥 darker ocean base

float WaveSpeed;
float NoiseSpeed;
float Waterline;
float BoilingCoef;

//--------------------------------------------------------------
sampler Noise : register(s0) =
sampler_state
{
    AddressU = Wrap;
    AddressV = Wrap;
    MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
};

//--------------------------------------------------------------
sampler ReflectionMap : register(s1);
sampler ShadowMap     : register(s2);
sampler FogMap        : register(s3);

//--------------------------------------------------------------
struct VSOutput
{
    float4 Pos:     POSITION;
    float4 clWater: COLOR0;
    float4 pos:     TEXCOORD0;
    float3 normal:  TEXCOORD1;
    float3 vVec:    TEXCOORD2;
    float2 reflUV:  TEXCOORD3;
    float2 shUV:    TEXCOORD4;
    float2 fogUV:   TEXCOORD6;
    float4 Waves:   TEXCOORD7;
    float4 Waves2:  TEXCOORD5;
};

//--------------------------------------------------------------
VSOutput OceanVS(float4 Pos: POSITION, float4 diffuse: COLOR0)
{
    VSOutput Out;

    Out.fogUV = Pos.xy / 16384;

    const float TimeScale = 3;

    // Boiling (kept)
    Pos.z += Waterline / 1000.0f * BoilingCoef *
        (cos(Time*3*TimeScale+(Pos.y+Pos.x)*0.021)
       + cos(Time*1.3*TimeScale+Pos.x*0.024-Pos.y*0.023)
       + cos(Time*1.76*TimeScale+Pos.y*0.025-Pos.x*0.020)) * 15;

    // Flow movement
    float2 flowDir = float2(0.6, 0.35);
    Pos.xz += flowDir * Time * 0.25;

    Out.pos = Pos;
    Out.pos.z += Waterline;

    Out.vVec = normalize(Out.pos - ViewPos);

    Out.Pos = mul(WorldViewProjTM, Out.pos);

    // normal (soft animated)
    float2 nUV = Out.pos.xz * 0.01 + Time * 0.05;
    float3 n = tex2D(Noise, nUV).xyz * 2 - 1;
    Out.normal = normalize(float3(n.x, n.y, 1));

    // UVs
    float4 shUV = mul(WorldViewTM, Out.pos);
    float4 reflUV = shUV;

    shUV = mul(TextureTM2, shUV);
    shUV.xy /= shUV.w;
    Out.shUV = shUV.xy;

    reflUV = mul(TextureTM1, reflUV);
    reflUV.xy /= reflUV.w;
    Out.reflUV = reflUV.xy;

    Out.clWater = diffuse;
    Out.clWater.xyz = WaterColor.xyz;

    // wave system (kept original style)
    const float NoiseCoordScale = 0.003f;

    Out.pos *= NoiseCoordScale;

    Out.pos.z =
        Out.pos.z
        - NoiseSpeed * Time
        - Out.pos.x * 0.127f
        + Out.pos.y * 0.111f
        - NoiseCoordScale * Waterline;

    float y0 = Out.pos.y;

    Out.pos.y = Out.pos.y + Out.pos.x + WaveSpeed * Time;
    Out.pos.x = Out.pos.x - y0;

    Out.Waves  = float4(Pos.x/2524, Pos.y/2302, diffuse.w + Time/16, 1-diffuse.w);
    Out.Waves2 = float4(Pos.x/2024, Pos.y/2512, diffuse.w - Time/16, 1-diffuse.w);

    return Out;
}

//--------------------------------------------------------------
float4 OceanPS(
    float4 clWater: COLOR0,
    float3 pos:     TEXCOORD0,
    float3 normal:  TEXCOORD1,
    float3 vVec:    TEXCOORD2,
    float3 reflUV:  TEXCOORD3,
    float3 shUV:    TEXCOORD4,
    float  shZ:     TEXCOORD5,
    float2 fogUV:   TEXCOORD6,
    float4 Waves:   TEXCOORD7,
    float4 Waves2:  TEXCOORD5
) : COLOR
{
    float3 noisy = tex2D(Noise, pos.xy);

    float w = tex2D(Noise, Waves.xy);
    w = abs(w - 0.5) * 2 * Waves.w;

    float da = 0.85 - pow(Waves.w, 8) * 1.15;

    float2 bump = (noisy.xy * 2 - 1 + w * 3) * float2(0.005, 0.2);

    float4 refl = tex2D(ReflectionMap, reflUV + bump);

    // -----------------------------
    // 🌊 DEPTH (real ocean darkening)
    // -----------------------------
    float depth = saturate(1.0 - length(vVec) * 0.10);

    float3 deepColor    = float3(0.001, 0.02, 0.04);
    float3 shallowColor = float3(0.03, 0.12, 0.16);

    float3 waterBase = lerp(deepColor, shallowColor, depth);

    // -----------------------------
    // reflection control (critical fix)
    // -----------------------------
    refl.rgb *= 0.50;

    float3 color = refl.rgb;

    float a = 0.5 - (noisy.x - noisy.y) * 0.7;

    // base blend (NO plastic look anymore)
    color = lerp(waterBase, color, 0.55 * a);

    // -----------------------------
    // fresnel (soft highlight only)
    // -----------------------------
    float fresnel = 1.0 - saturate(dot(normalize(vVec), normal));
    fresnel = pow(fresnel, 2.5);

    color += fresnel * 0.10;

    // -----------------------------
    // fog (soft)
    // -----------------------------
    float4 fogC = tex2D(FogMap, fogUV);
    color *= (1.0 - fogC.w * 0.35);

    float4 finalColor;
    finalColor.rgb = color;

    finalColor.w = da * 0.3 + 1.3 * clWater.a;

    // -----------------------------
    // foam (subtle)
    // -----------------------------
    float d = clamp(w*w*w*26*da, -0.98, 0.98);
    d *= step(1.0, BoilingCoef);

    finalColor.rgb += d * float3(0.9, 0.95, 1.0) * 0.15;

    // -----------------------------
    // final tone control
    // -----------------------------
    finalColor.rgb *= 0.80;

    return finalColor;
}

//--------------------------------------------------------------
technique Ocean
{
    pass Water
    {
        ZWriteEnable = True;
        ZEnable = True;

        SrcBlend = SrcAlpha;
        DestBlend = InvSrcAlpha;

        CullMode = CCW;

        AlphaBlendEnable = True;

        FogEnable = True;
        AlphaTestEnable = True;
        AlphaFunc = GreaterEqual;
        AlphaRef = 10;

        VertexShader = compile vs_1_1 OceanVS();
        PixelShader  = compile ps_2_0 OceanPS();
    }
}