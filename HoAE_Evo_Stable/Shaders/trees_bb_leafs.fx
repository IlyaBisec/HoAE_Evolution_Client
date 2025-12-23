float4x4 WorldViewTM;
float4x4 ProjTM;
float4x4 WorldTM;
float Time;
float FarPlane;
float4 ColorConst;

struct VS_OUTPUT 
{
   float4 Pos:     POSITION;
   float2 UV:      TEXCOORD0;
   float4 Diffuse: COLOR0;
};
float4 Light=float4(-0.816,-0.4,-2,0);
VS_OUTPUT MainVS(float4 Pos: POSITION, float4 Diffuse: COLOR0, float2 Tex: TEXCOORD0, float2 Center: TEXCOORD1)
{
   VS_OUTPUT Out;	
   Out.Pos     = mul( WorldViewTM, Pos );   
   Center *= WorldTM._m22;
   Center/=2;
   Out.Pos.xy -= Center + float2(cos(Time*4+Pos.x),cos(Time*5.1+Pos.x))/4;
   Out.Pos.z+=cos(Center.x)*40;
   float ph = Pos.x+Pos.z*3.12+Tex.x*123+Tex.y*234;
   Out.Pos = mul( ProjTM, Out.Pos );
   Diffuse-=0.5;//+Center.x/300;
   
   Out.Diffuse = 0.7*clamp(0.5-dot(Light,Diffuse)*0.7,0.35,0.7)+float4(cos(ph)/24,cos(ph*1.1)/24,cos(ph*1.091)/24,1);
   Out.Diffuse.y*=1.3;
   Out.Diffuse.w=(1-pow(Out.Pos.z/FarPlane,4));
   Out.Diffuse*=ColorConst;
   Out.UV      = Tex;	
   return Out;
} // MainVS


technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	= True;
		SrcBlend		= SrcAlpha;
		DestBlend		= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual;
		AlphaRef		= 0xA0;
		DitherEnable		= False;
		Lighting		= False;
		SpecularEnable		= False;
		ZEnable			= True;
		ZFunc			= LessEqual;
		ZWriteEnable		= True;
		FillMode		= Solid;
		CullMode		= None;//CCW;

		FogEnable		= True;		

		ColorOp[0]		= Modulate4x;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]		= Modulate2x;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]		= Wrap;
		AddressV[0]		= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= 0;


		ColorOp[1]		= SelectArg1;
		ColorArg1[1]		= Current;
		AlphaOp[1]		= Modulate;
		AlphaArg1[1]		= Current;
		AlphaArg2[1]		= TFactor;
		AddressU[1]		= Wrap;
		AddressV[1]		= Wrap;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		MipFilter[1]		= Point;

		VertexShader = compile vs_1_1 MainVS();

	}  //pass P0
	pass P1
	{
		AlphaBlendEnable	= True;
		SrcBlend		= SrcAlpha;
		DestBlend		= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual;
		AlphaRef		= 0x10;
		DitherEnable		= False;
		Lighting		= False;
		SpecularEnable		= False;
		ZEnable			= True;
		ZFunc			= Less;
		ZWriteEnable		= False;
		FillMode		= Solid;
		CullMode		= None;//CCW;
		DepthBias		= 0.01;

		FogEnable		= True;		

		ColorOp[0]		= Modulate4x;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]		= Wrap;
		AddressV[0]		= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Point;
		MipMapLodBias[0]	= 0;


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

		VertexShader = compile vs_1_1 MainVS();

	}  //pass P1
}  // technique RenderScene
