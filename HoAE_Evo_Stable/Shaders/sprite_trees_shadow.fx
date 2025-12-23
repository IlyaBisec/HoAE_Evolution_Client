//*****************************************************************************
//*	Author:	Ruslan Shestopalyuk
//*	Date:	28.03.2005
//*****************************************************************************
float4x4 WorldViewProjTM;
float FarPlane;
float4x4 ProjTM;
float4x4 ViewTM;
float4x4 WorldTM;
struct VS_OUTPUT
{
	float4 pos      :POSITION;
	float2 uv	:TEXCOORD0;
	float4 diffuse	:COLOR0;
	float4 s	:COLOR1;
	float2 UV3	:TEXCOORD3;
};

VS_OUTPUT VS_Main( float4 pos: POSITION, float2 uv: TEXCOORD0, float4 diffuse:COLOR0 )
{
   VS_OUTPUT Out;   
   Out.UV3 	= pos.xy/16384.0f;
   Out.pos = mul(WorldTM, pos);
   Out.pos = mul(ViewTM, Out.pos);
   Out.pos.z-=16;
   Out.pos = mul(ProjTM, Out.pos);
   Out.uv       = uv;   
   Out.diffuse  = diffuse;
   Out.diffuse.xyz/=2;
   Out.diffuse.w*=(1-pow(Out.pos.z/FarPlane,8));
   Out.s=1;
   return Out;
} // VS_Main
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable			= True;
		SrcBlend			        = SrcAlpha;
		DestBlend			        = InvSrcAlpha;
		
		AlphaTestEnable		        = True;
		AlphaFunc			        = GreaterEqual;
		AlphaRef			        = 0x01;
		
		DitherEnable			    = True;
		Lighting			        = False;
		SpecularEnable			    = False;
		ZEnable			            = True;
		ZWriteEnable			    = False;
		FillMode			        = Solid;
		CullMode			        = None;
//		DepthBias           = -0.002;
		FogEnable			= True;

		ColorOp[0]			        = SelectArg1;
		ColorArg1[0]			    = Diffuse;
		AlphaOp[0]			        = Modulate4x;
		AlphaArg1[0]			    = Specular;
		AlphaArg2[0]			    = Texture;
		AddressU[0]			        = Mirror;
		AddressV[0]			        = Mirror;
		MinFilter[0]			    = Linear;
		MagFilter[0]			    = Linear;

		ColorOp[1]			        = SelectArg1;
		ColorArg1[1]			    = Current;
 
		AlphaOp[1]			        = Modulate;
		AlphaArg1[1]			    = Current;
		AlphaArg2[1]			    = Diffuse;

		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;

		VertexShader		    = compile vs_1_1 VS_Main();
    

	}  //pass P0
}  // technique RenderScene
