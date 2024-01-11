float ShaderConst0 = 5000.0;
float4x4 ViewProjTM;
float4x4 WorldTM;


struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   if(Pos.z>ShaderConst0)Pos.z=ShaderConst0;
   if(Pos.z<0)Pos.z=0;
   float a=clamp(Pos.z/10,0,1);
   Out.Pos = mul(WorldTM, Pos);
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.UV = UV;
   Out.D=D;
   Out.D.xyz=float3(1,1,1);
   Out.D.w=a;
   return Out;
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x2;
		DitherEnable		= False;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= CCW;

		FogEnable		= True;		

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]		= TFactor;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0]		= TFactor;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= -0.5;

		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]		= Current;
		AlphaArg2[1]		= Diffuse;



		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;

		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
