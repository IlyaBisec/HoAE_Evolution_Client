//*****************************************************************************
//*	File:	NoDepth.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
float4 TFactor;
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = Point;
   MINFILTER        = Point;
   MIPFILTER        = POINT;
};
sampler BloomMap :register(s1) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = POINT;
};
sampler BloomMap2 :register(s2) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = POINT;
};
float Time;
float4 BloomPS(float2 uv:TEXCOORD0,float4 CL:COLOR0) : COLOR
{
   float r=length(uv.xy-0.5);
   r=r*r*2;
   float sc=r/512.0f;
   float sc2=r/1024;

   /*
   float4 c1=(
	 tex2D(Texture,uv+float2(sc,0))
	+tex2D(Texture,uv+float2(-sc,0))
	+tex2D(Texture,uv+float2(0,sc))
	+tex2D(Texture,uv+float2(0,-sc))
	+tex2D(Texture,uv+float2(sc2,sc2))
	+tex2D(Texture,uv+float2(-sc2,-sc2))
	+tex2D(Texture,uv+float2(-sc2,sc2))
	+tex2D(Texture,uv+float2(sc2,-sc2)))/8;
   */	

   float4 c1=tex2D(Texture,uv);
   float4 c=tex2D(BloomMap,uv+1.0/256.0f);
   float4 c2=TFactor*1.2;//tex2D(BloomMap2,uv);   
   c2.xyz=c1+clamp(c.xyz-c2.xyz,0,1)*2;
   //c2.xyz=c.xyz-c2.xyz;//+clamp(c.xyz-c2.xyz,0,1);

   //float4 c1=tex2D(Texture,uv);
   //c=clamp(c-0.3,0,1);
   c2.w=CL.w;
   return c2;//c1+c2;//c+c1;
}
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= False;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;
		ZWriteEnable			= False;
		FillMode			= Solid;
		CullMode			= None;

		ColorOp[0]			= Modulate;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= TFactor;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= None;

		ColorOp[1]			= AddSigned;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Disable;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		MipFilter[1]			= None;

		PixelShader = compile ps_2_0 BloomPS();


	}  //pass P0
}  // technique RenderScene
