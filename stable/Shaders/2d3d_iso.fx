float4x4 WorldViewProjTM;

float ShaderConst0 = 5000.0;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   if(Pos.z>ShaderConst0)Pos.z=ShaderConst0;
   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.UV = UV;
   Out.D=D;
   Out.D.xyz=float3(1,1,1);
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
		AlphaRef			= 0x01;
		DitherEnable		= False;    
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= CCW;

		ColorOp[0]			= Modulate2x;
		ColorArg1[0]		= TFactor;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0]		= TFactor;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Point;
		MagFilter[0]		= Point;
		MipFilter[0]		= None;
		MipMapLodBias[0]	= 0;

		ColorOp[1]			= Disable;
		AlphaOp[1]			= Disable;

		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
