float4x4 ViewProjTM;
float4x4 WorldTM;


struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
   float4 S  : COLOR1;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float4 D:COLOR0)
{
   VS_OUTPUT Out;   
   Out.Pos = mul(WorldTM, Pos);
   Out.S.w = Out.Pos.z/768.0f;
   Out.S.xyz = 0;
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.Pos/=Out.Pos.w;
   Out.Pos.z=0.5f;
   Out.UV = UV;
   Out.D=float4(1,1,1,1);
   return Out;
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	= True;
		SrcBlend			= SrcColor;
		DestBlend			= DestColor;
		BlendOp			= Max;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual;
		AlphaRef		= 0x01;
		DitherEnable		= False;
		Lighting		= False;
		SpecularEnable		= False;
		ZEnable			= True;
		ZFunc			= LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= None;
		ClipPlaneEnable             = 0;

		FogEnable		= True;	

		ColorOp[0]		= SelectArg1;
		ColorArg1[0]		= TFactor;
		AlphaOp[0]		= Add;
		AlphaArg1[0]		= Texture;
		AlphaArg2[0]		= Texture;	

		ColorOp[1]		= BlendCurrentAlpha;
		ColorArg1[1]		= TFactor;
		ColorArg2[1]		= Specular;
		AlphaOp[1]		= SelectArg1;
		AlphaArg1[1]		= Specular;
		AlphaArg2[1]		= Texture;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		MipFilter[1]		= Linear;

		//ColorOp[1]			= SelectArg1;
		//ColorArg1[1]			= Current;
		//AlphaOp[1]			= Modulate;
		//AlphaArg1[1]		= Current;
		//AlphaArg2[1]		= Diffuse;		

		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
