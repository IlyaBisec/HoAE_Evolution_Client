float4x4 WorldViewProjTM;
float4x4 WorldTM;

//float RiseStage=1;
//float DeathStage=0.8;
float4 stage=float4(1,1,0,0);

struct VS_OUTPUT 
{
   float4 Pos:     POSITION;
   float2 UV:      TEXCOORD0;
   float2 UVW:     TEXCOORD1;
   float4 Blend:   COLOR0;
};

float4 ViewPos;
float Time;
//float3 LocalViewDir;

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float3 N:NORMAL0)
{
   VS_OUTPUT Out;
   Pos.xyz+=N*(cos(Time*3-Pos.z/2)-(1-stage.x)*12);
   Pos.z*=(sqrt(stage.y)+stage.y)/2;
   float4 gp=mul(WorldTM,Pos);
   float3 gn=mul(WorldTM,N.xyz);
   float3 VD=normalize(ViewPos-gp);
   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.UV = UV;
   Out.UVW = UV*3;//gp.xyz/20;
   Out.Blend=float4(0.5,0.5,0.5,1);
   Out.Blend.w=dot(VD,gn);
   Out.Blend.w=stage.x*stage.y*(Out.Blend.w)*2-0.4;
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
		AlphaRef			= 0x25;
		DitherEnable		= False;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= CCW;

		ColorOp[0]			= SelectArg2;
		ColorArg1[0]		= TFactor;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= SelectArg2;
		AlphaArg1[0]		= TFactor;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= -0.5;

                ColorOp[1]			= SelectArg1;
		ColorArg1[1]		= Current;
		ColorArg2[1]		= Texture;
		AlphaOp[1]			= AddSigned2x;//BlendDiffuseAlpha;
		AlphaArg1[1]		= Diffuse;
		AlphaArg2[1]		= Texture;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		MipFilter[1]		= Linear;
		MipMapLodBias[1]	= -0.3;

		ColorOp[2]			= Modulate2x;
		ColorArg1[2]		= Current;
		ColorArg2[2]		= Diffuse;
		AlphaOp[2]			= Modulate;
		AlphaArg1[2]		= Current;
		AlphaArg2[2]		= TFactor;
		AddressU[2]			= Wrap;
		AddressV[2]			= Wrap;
		MinFilter[2]		= Linear;
		MagFilter[2]		= Linear;
		MipFilter[2]		= None;
		MipMapLodBias[2]	= 0;
		

		VertexShader = compile vs_1_1 VSMain();

	}  //pass P0
}  // technique RenderScene
