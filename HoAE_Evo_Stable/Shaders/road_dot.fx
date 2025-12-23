//*****************************************************************************
//*	File:	road.fx
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
float4x4 ProjTM;
float4x4 ViewTM;
float FarPlane;
//float4x4 WorldTM;


struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
   float4 S  : COLOR1;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float2 UV: TEXCOORD0,float2 UV1: TEXCOORD1,float4 D:COLOR0)
{
   VS_OUTPUT Out;
   //Out.Pos = mul(WorldTM, Pos);
   Out.UV3 = Pos.xy/16384.0f;
   Out.Pos = mul(ViewTM, Pos);
   Out.Pos.z -= 32;
   Out.Pos = mul(ProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV1;
   Out.D = D;
   Out.D.w*=(1-pow(Out.Pos.z/FarPlane,2));
   Out.S = float4(0.5,0.5,0.5,1);
   return Out;
}
technique RenderScene
{
    pass P0
    {          
		SrcBlend			= DestColor;
		DestBlend			= SrcColor;
		
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
		DepthBias           = -0.003;

		FogEnable			= False;		
		
		ColorOp[0]			= DotProduct3;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg2;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0] 		= Texture; 

		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		MipMapLodBias[0]        = 0;
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;  
		MipMapLodBias[0]=0;

		ColorOp[1]			= Modulate2x;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= Texture; 
		AlphaOp[1]			= SelectArg1;//Modulate;
		AlphaArg1[1]		= Diffuse;
		AlphaArg2[1] 		= Texture; 

		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		MipMapLodBias[1]        = 0;
		AddressU[1]			= Wrap;  
		AddressV[1]			= Wrap;  

		ColorOp[2]			= BlendCurrentAlpha;  
		ColorArg1[2]		= Current; 
		ColorArg2[2]		= Specular;//TFactor; 
		AlphaOp[2]			= SelectArg1;
		AlphaArg1[2]		= Diffuse;//Current;
		
		//ColorOp[3]			= BlendTextureAlpha;
		//ColorArg1[3]			= TFactor;
		//ColorArg2[3]			= Current;
		//MinFilter[3]			= Linear;
		//MagFilter[3]			= Linear;
		//AlphaOp[3]			= BlendTextureAlpha;
		//AlphaArg1[3]			= TFactor;
		//AlphaArg2[3]			= Current;
 
		VertexShader = compile vs_1_1 VSMain();
    }
} // technique RenderScene
