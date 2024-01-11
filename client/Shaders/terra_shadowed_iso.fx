//*****************************************************************************
//*	File:	terra_shadowed.fx
//*	Desc:	Legacy shader
//*	Author:	Andrew Shpagin
//*	Date:	10.6.2005
//*****************************************************************************

float4x4 WorldViewProjTM;
float4x4 WorldViewTM;
float4x4 TextureTM1;

float Time;
float4 TerraFogColor;


struct VS_OUTPUT
{
	float4 pos      :POSITION;
	float2 uv		:TEXCOORD0;
	float2 uv2		:TEXCOORD1;
	float4 diffuse	:COLOR0;
	float4 fog		:COLOR1;
};

VS_OUTPUT VS_Main( float4 pos: POSITION, float2 uv: TEXCOORD0, float4 diffuse:COLOR0 )
{
   VS_OUTPUT Out;   
   Out.pos      = mul( WorldViewProjTM, pos );
   Out.uv       = uv;
   
   //  calculate shadow map uv coordinates
   float4 shUV;
   shUV = mul( WorldViewTM, pos );
   shUV = mul( TextureTM1, shUV );
   shUV.xy /= shUV.w;
   Out.uv2 = shUV.xy;
   
   Out.diffuse  = diffuse;
   Out.fog      = TerraFogColor;
   if (pos.z < 0)
   {
        Out.fog.w = -pos.z/350 + 
                    (cos(Time+pos.x) + cos(Time+pos.y) + cos(-Time+pos.z/30))/10;
   }else 
   {
        Out.fog.w = 0;
   }
   return Out;
} // VS_Main

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = POINT;
   MINFILTER        = POINT;
   MIPFILTER        = NONE;
   MIPMAPLODBIAS    = -0.8;
};

sampler Shadows :register(s1) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = POINT;
   MINFILTER        = POINT;
   MIPFILTER        = NONE;
   MIPMAPLODBIAS    = 0;
};



float4 PSMain(  float2 uv1:TEXCOORD0, 
                float2 uv2:TEXCOORD1, 
                float4 Diffuse:COLOR0, 
                float4 fog:COLOR1 ) : COLOR 
{ 
   float4 C1 = tex2D(Texture,uv1);
   
   float4 shColor = tex2D( Shadows, uv2 ); 
   //float4 shColor = SampleBilinear( Shadows, uv2, 1.0f/256.0f ); 
   
   float4 C3;
   //C3.xyz = lerp(float3(0.5,0.5,0.5),Diffuse.xyz,C1.w);
   //C3.xyz *= shColor.xyz;
   //C3.xyz *= C1.xyz*2;
   //C3.w = Diffuse.w*2;   
   //C3.xyz = lerp(C3.xyz,fog.xyz,fog.w);
   
   C3.xyz = shColor.xyz*Diffuse.xyz*C1.xyz*2;
   C3.w = Diffuse.w*2;   
   C3.xyz = lerp(C3.xyz,fog.xyz,fog.w);
   return C3;
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= False;
		SrcBlend				= SrcAlpha;
		DestBlend				= InvSrcAlpha;
		ColorVertex				= True;
		SpecularEnable			= False;
		NormalizeNormals		= False;
		CullMode			    = None;
		Lighting			    = False;
		FillMode			    = Solid;
		ShadeMode			    = Gouraud;
		DitherEnable			= True;
		ZEnable			        = True;
		ZWriteEnable			= True;
		ZFunc			        = LessEqual;
		DiffuseMaterialSource	= Color1;
		//ClipPlaneEnable         = 1;
		TexCoordIndex[0]		= 0;
		
		PixelShader			    = compile ps_1_1 PSMain();
		VertexShader		    = compile vs_1_1 VS_Main();

	}  //pass P0
}  // technique RenderScene

