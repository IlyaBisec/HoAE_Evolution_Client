float4x4 WorldViewProjTM;
float4x4 WorldTM;
float4 ViewPos;
struct VS_OUTPUT 
{
   float4 Pos:     POSITION;
   float2 UV:      TEXCOORD0;
   float2 UVW:     TEXCOORD1;
   float4 Blend:   COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float3 N:NORMAL0)
{
   VS_OUTPUT Out;
   //Pos.xyz+=N*(10+cos(Time*3-Pos.z/2));
   float4 gp=mul(WorldTM,float4(0,0,0,1));
   float3 gn=mul(WorldTM,N.xyz);
   float3 VD=ViewPos-gp;
   VD.z=0;
   VD=normalize(VD);
   gn=normalize(gn);   
   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.Pos.z=WorldViewProjTM._m23;
   Out.Pos.w=WorldViewProjTM._m33;
   Out.UV = UV;
   Out.UVW = UV*16;//gp.xyz/20;
   Out.Blend=float4(0.05,0.05,1.00,1);
   Out.Blend.w=dot(VD,gn);
   Out.Blend.w=Out.Blend.w*Out.Blend.w*1.7-0.7;
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
		AlphaRef			= 0x20;
		DitherEnable		= False;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= CCW;

		FogEnable			= False;//True;		

		ColorOp[0]			= Modulate4x;
		ColorArg1[0]		= TFactor;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= -0.5;


		ColorOp[1]		= SelectArg1;
		ColorArg1[1]		= Current;
		AlphaOp[1]		= Modulate;
		AlphaArg1[1]		= Current;
		AlphaArg2[1]		= TFactor;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		MipFilter[1]		= Linear;

		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
