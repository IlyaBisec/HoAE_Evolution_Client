//--------------------------------------------------------------//
// Ocean
//--------------------------------------------------------------//

//  Constants
float4x4		WorldViewProjTM;
float4x4		WorldViewTM;
float4x4        	TextureTM1;
float4x4        	TextureTM2;
float4			ViewPos;
float3          	lDir            = { -1, -1, -1 };
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
    float4 clWater: COLOR0;
    float4 pos:     TEXCOORD0;
    float2 sky:     TEXCOORD1;  
    float2 shUV:    TEXCOORD2;
    float2 fogUV:   TEXCOORD3;
    
}; // struct VSOutput 

VSOutput OceanVS( float4 Pos: POSITION, float4 diffuse: COLOR0 )
{
    VSOutput Out;
    Out.fogUV=Pos.xy/16384;

    Out.pos        = Pos;
    //Out.vVec     = normalize(Out.pos - ViewPos);
	
    Out.Pos      = mul( WorldViewProjTM, Out.pos );
	
    float4 shUV = mul( WorldViewTM, Out.pos );
    float4 reflUV = shUV;
    shUV = mul( TextureTM2, shUV );
    shUV.xy /= shUV.w;
    Out.shUV = shUV.xy;
    
    reflUV = mul( TextureTM1, reflUV );
    reflUV.xy /= reflUV.w;
    Out.sky   = reflUV.xy-float2(0.05,0.1);
    Out.clWater.a  = clamp(diffuse.a*2,0,0.85);
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
sampler FogMap :register( s3 ) = sampler_state
{
   AddressU     = Wrap;
   AddressV     = Wrap;
   MagFilter    = Linear;
   MinFilter    = Linear;
   MipFilter    = Linear;
}; // sampler ReflectionMap

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

      ColorOp[0]			        = BumpEnvMap;
		ColorArg1[0]			    = Texture;
		ColorArg2[0]			    = Diffuse;
		AlphaOp[0]			        = Disable;
		AlphaArg1[0]			    = Diffuse;
		AlphaArg2[0]			    = Texture;
		MinFilter[0]			    = Linear;
		MagFilter[0]			    = Linear;
		AddressU[0]			        = Wrap;
		AddressV[0]			        = Wrap;
		MipFilter[0]			    = Linear;
		
		BumpEnvMat00[0]			    = 0.1000000;
		BumpEnvMat01[0]			    = 0.000000;
		BumpEnvMat10[0]			    = 0.000000;
		BumpEnvMat11[0]			    = 0.2000000;
		TEXCOORDINDEX[0]			= 0;
		BUMPENVLSCALE[0]			= 0.000000;
		BUMPENVLOFFSET[0]			= 0.000000;
		TEXTURETRANSFORMFLAGS[0]	= Disable;

		ColorOp[1]			        = SelectArg1;
		ColorArg1[1]			    = Texture;
		ColorArg2[1]			    = Current;
		AlphaOp[1]			        = SelectArg1;
		AlphaArg1[1]			    = Diffuse;
		AlphaArg2[1]			    = Texture;
		MinFilter[1]			    = Linear;
		MagFilter[1]			    = Linear;
		AddressU[1]			        = Wrap;
		AddressV[1]			        = Wrap;
		MipFilter[1]			    = Linear;

		ColorOp[2]			    = Modulate;
		ColorArg1[2]			    = Diffuse;
		ColorArg2[2]			    = Current;
      
      VertexShader      = compile vs_1_1 OceanVS();
      //PixelShader       = compile ps_2_0 OceanPS();
   }
} // technique Ocean

