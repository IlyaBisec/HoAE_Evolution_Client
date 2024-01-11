float4x4	WorldViewProjTM;
float4		ViewPos;

struct VS_OUTPUT {
	float4 Pos		: POSITION;
	float4 Diffuse	: COLOR0;
	float2 Tex		: TEXCOORD0;
};

VS_OUTPUT MainVS(float4 Pos : POSITION, float4 Diffuse : COLOR0, float2 Tex : TEXCOORD0) {
	VS_OUTPUT Out;
	Out.Pos = mul(WorldViewProjTM, Pos);
	Out.Pos.z = clamp(Out.Pos.z, -1.0f, 1.0f);
	Out.Diffuse = Diffuse;
	Out.Tex = Tex;
	return Out;
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable			= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x00000004;
		DitherEnable			= True;
		Lighting			= False;
		SpecularEnable			= False;
		ZEnable				= False;//True;
		ZFunc				= LessEqual;
		ZWriteEnable			= False;//True;
		FillMode			= Solid;
		CullMode			= None;
		FogEnable 			= true;

		ColorOp[0]			= SelectArg1;
		ColorArg1[0]			= Diffuse;
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0]			= Diffuse;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Point;
		MagFilter[0]			= Point;

		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		
		VertexShader = compile vs_1_1 MainVS();	  		
	}
}
