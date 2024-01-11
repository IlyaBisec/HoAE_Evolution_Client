//*****************************************************************************
//*	File:	vertex_lit.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
float4x4 WorldViewProjTM;
float4x4 ViewTM;

float4 LDir=float4(-0.866,-0.43,0.43,0);

float4 LightDiffuse=float4(1.0,1.0,1.0,1.0);
float4 LightAmbient=float4(0.2,0.2,0.2,1.0);

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = -10.0;
};
sampler Normals :register(s1) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = -10.0;
};

struct VS_OUTPUT 
{
   float4 Pos : POSITION;
   float2 UV  : TEXCOORD0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float3 N:NORMAL,float2 UV: TEXCOORD0)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldViewProjTM, Pos);
   Out.UV  = UV;
   return Out;
}
float4 PSMain(VS_OUTPUT v) : COLOR
{
   float4  Color;
   float3  VDir = float4(0,0,1,0);     
   //VDir = mul(ViewTM,VDir);
   float3  nrm = tex2D(Normals,v.UV)*2-1;
   float3  N    = normalize(mul(ViewTM,nrm.zyx));
   float4  tex  = tex2D(Texture,v.UV);
   float3  refl = VDir-2*N*dot(VDir,N);
   float   S = max(0,-dot(refl,LDir));
   float   D = (LightAmbient-clamp(LightDiffuse*dot(N,LDir),-1,0));
   Color.xyz = D*tex.xyz+pow(S,1+tex.w*tex.w*64)*tex.w;
   Color.w   = 1;
   return Color;
}
float4 PS2(VS_OUTPUT v) : COLOR
{
   return float4(0,0,1,1);
}
technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= False; 
		SrcBlend            	= SrcAlpha;
		DestBlend           	= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual; 
		AlphaRef		= 0x30; 
		CullMode		= CCW;
//		FillMode		= Wireframe; 
		FillMode		= Solid; 
		ShadeMode		= Gouraud; 
		DitherEnable		= True; 
		ZEnable			= True; 
		ZWriteEnable		= True; 
		ZFunc			= LessEqual; 
		FogEnable		= False;
		VertexShader 		= compile vs_1_1 VSMain();
		PixelShader  		= compile ps_2_0 PSMain();
    }
/*
    pass P1
    {          
		AlphaBlendEnable	= False; 
		SrcBlend            	= SrcAlpha;
		DestBlend           	= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc		= GreaterEqual; 
		AlphaRef		= 0x30; 
		CullMode		= CCW;
		FillMode		= Wireframe; 
//		FillMode		= Solid; 
		ShadeMode		= Gouraud; 
		DitherEnable		= True; 
		ZEnable			= True; 
		ZWriteEnable		= True; 
		ZFunc			= LessEqual; 
		FogEnable		= False;
		VertexShader 		= compile vs_1_1 VSMain();
		PixelShader  		= compile ps_2_0 PS2();
    }
*/
} // technique RenderScene
