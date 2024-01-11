//*****************************************************************************
//*	File:	ps_add.fx
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
float4x4 ViewTM;
float4x4 WorldTM;
float4x4 ProjTM;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float2 UV1: TEXCOORD1,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldTM, Pos);
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewTM, Out.Pos);
   Out.Pos.z -= 24;
   Out.Pos = mul(ProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV1;
   Out.D=D;
   return Out;
}
technique RenderScene
{
    pass P0
    {          
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		
		AlphaBlendEnable	= True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		CullMode			= None;
		Lighting			= False; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= False; 
		DepthBias               = -0.00002;
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0] 		= Texture; 

		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;   

		ColorOp[1]			= Modulate2x;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= Modulate;
		AlphaArg1[1]			= Current;
		AlphaArg2[1]			= Texture;
		
		ColorOp[2]			= SelectArg1;//Modulate;  
		ColorArg1[2]		= Current; 
		ColorArg2[2]		= TFactor; 
		AlphaOp[2]			= SelectArg1;//Modulate;
		AlphaArg1[2]		= Current;
		AlphaArg2[2] 		= TFactor; 

		MipFilter[1] 		= None;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]			= Mirror;  
		AddressV[1]			= Mirror;  

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;           
		VertexShader = compile vs_1_1 VSMain();
    }
} // technique RenderScene
