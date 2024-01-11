//*****************************************************************************
//*	File:	shadows_common.fx
//*	Desc:	
//*	Author:	Ruslan Shestopalyuk
//*****************************************************************************

float4 SampleBilinear( sampler texMap, float2 uv, float texelSide )
{
    float2 uvOffs = uv.xy - 0.5f*texelSide;
    
    float4 s1 = tex2D( texMap, uvOffs );
    float4 s2 = tex2D( texMap, float2( uvOffs.x + texelSide,   uvOffs.y ) );
    float4 s3 = tex2D( texMap, float2( uvOffs.x,               uvOffs.y + texelSide ) );
    float4 s4 = tex2D( texMap, float2( uvOffs.x + texelSide,   uvOffs.y + texelSide ) );

    float2 fpos = frac( uv/texelSide );
    float4 r1   = lerp( s1, s2, fpos.x );
    float4 r2   = lerp( s3, s4, fpos.x );
    
    return lerp( r1, r2, fpos.y );
} // SampleBilinear