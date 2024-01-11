//*****************************************************************************
//*	File:	dot3specular.fx
//*	Desc:	Legacy shader
//*	Author:	Andrew Shpagin
//*	Date:	30.05.2005
//*****************************************************************************
texture tex0;
texture tex1;
texture tex2;
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU  = WRAP;
   ADDRESSV  = WRAP;
   MAGFILTER = LINEAR;
   MINFILTER = POINT;
   MIPFILTER = LINEAR;
   MIPMAPLODBIAS = -0.5;
};
sampler Shadows :register(s1) = sampler_state
{
   ADDRESSU  = CLAMP;
   ADDRESSV  = CLAMP;
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = NONE;
   MIPMAPLODBIAS = 0;
};
sampler NormalMap :register(s2) = sampler_state
{
   ADDRESSU  = WRAP;
   ADDRESSV  = WRAP;
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MIPMAPLODBIAS = -0.5;
};

float4 PS_Main(float2 uv_tex:TEXCOORD0,float2 uv_shadow:TEXCOORD1,float4 color:COLOR0,float3 norm:COLOR1):COLOR
{
	float4 shadow = tex2D(Shadows,uv_shadow);	
	float2 tn=tex2D(NormalMap,uv_tex).xy-float2(0.5,0.5);
	norm.xy-=float2(0.5,0.5);
	color.xyz*=2+dot(norm.xy,tn)*16*shadow.x;	
	return float4(tex2D(Texture,uv_tex).xyz*color.xyz,color.w*2);
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend				= SrcAlpha;
		DestBlend				= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc				= GreaterEqual;
		AlphaRef				= 0x00000001;
		ColorVertex				= True;
		SpecularEnable			= False;
		ZEnable					= True;
		ZWriteEnable			= True;
		Lighting				= False;
		FillMode				= Solid;
		CullMode				= None;
		SpecularMaterialSource	= Color2;
		
		PixelShader				= compile ps_2_0 PS_Main();		

	}  //pass P0
}  // technique RenderScene
