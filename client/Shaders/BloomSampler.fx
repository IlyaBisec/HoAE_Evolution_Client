//*****************************************************************************
//*	File:	NoDepth.fx
//*	Desc:	Legacy shader
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = Linear;
   MINFILTER        = Linear;
   MIPFILTER        = LINEAR;
};

float3 duv[16]={
    {0.0259,0.0098,0.4568},
    {-0.0198,-0.0137,0.5533},
    {-0.0063,0.0134,0.7978},
    {-0.0117,-0.0012,0.8675},
    {0.0024,-0.0242,0.5465},
    {0.0100,-0.0059,0.8713},
    {0.0081,0.0271,0.4411},
    {0.0159,-0.0117,0.6713},
    {-0.0105,0.0046,0.8738},
    {-0.0076,-0.0039,0.9284},
    {-0.0022,0.0010,0.9941},
    {0.0117,0.0122,0.7459},
    {-0.0115,-0.0256,0.4459},
    {0.0110,0.0244,0.4800},
    {0.0010,-0.0098,0.9061},
    {0.0032,-0.0044,0.9704}
};
float b_coef=11.55011;

float4 BloomPS(float2 uv:TEXCOORD0) : COLOR
{
   float4 s=0;
   for(int i=0;i<16;i++){
     float4 c=tex2D(Texture,uv+duv[i].xy);
     s+=c*duv[i].z;
   }
   return s/b_coef;
}
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= False;
		SrcBlend			= One;
		DestBlend			= One;
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
		AlphaArg1[0]			= Texture;
		AlphaArg2[0]			= Texture;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;
		AddressU[0]			= Clamp;
		AddressV[0]			= Clamp;
		MipFilter[0]			= None;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

		PixelShader = compile ps_2_0 BloomPS();

	}  //pass P0
}  // technique RenderScene
