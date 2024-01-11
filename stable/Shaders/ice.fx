//*****************************************************************************
//*	File:	ice.fx
//*	Desc:	 
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.01.2005
//***************************************************************************** 
float4x4 ViewProjTM;
float4x4 WorldTM;
float4  TFactor;
float3 ViewPos;

float4 LDir=float4(-0.866,-0.43,-0.43,0);

float4 LightDiffuse=float4(1.0,1.0,1.0,1.0);
float4 LightAmbient=float4(0.2,0.2,0.2,1.0);
//float4 LightSpecular;

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
   //float4 S  : COLOR1;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float3 N:NORMAL,float2 UV: TEXCOORD0,float2 UV1: TEXCOORD1)
{
   VS_OUTPUT Out;
   Out.Pos = mul(WorldTM, Pos);
   float3 NR = mul(WorldTM , N);
   NR=normalize(NR);
   Out.UV3 = Out.Pos.xy/16384.0f;   
   float3 VDir = normalize(ViewPos.xyz-Out.Pos.xyz);
   Out.Pos = mul(ViewProjTM, Out.Pos);
   float3 refl=VDir-2*N.xyz*dot(VDir,N.xyz);
   refl.z=0;
   refl=normalize(refl);
   Out.UV  = -refl.xy+0.5;//UV;
   Out.UV1 = UV;
   Out.D=(LightAmbient-clamp(LightDiffuse*dot(NR,LDir),-1,0))*TFactor*2;
   Out.D.w=TFactor.w;
   return Out;
}
technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 0.6, 1.0}; 
		MaterialPower		= 30.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.45, 0.45, 0.5, 1.0};
		LightDirection[0] 	= {0.577, -0.577, -2.577};  
		LightRange[0]     	= 100000.0; 

		LightEnable[0]		= True; 
		Lighting			= True; 
		SpecularEnable		= True; 
		
		AlphaBlendEnable	= True; 
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= False;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= False;
		SpecularEnable		= True; 
		NormalizeNormals	= True; 
		CullMode			= None;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 0; 
		
		ColorOp[0]			= Modulate;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0] 		= TFactor; 
		AlphaArg2[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;  
		
		ColorOp[1]			= Modulate;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= Texture; 
		AlphaOp[1]			= SelectArg2;
		AlphaArg1[1] 		= Current;
		AlphaArg2[1] 		= Texture; 
		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]			= Wrap;  
		AddressV[1]			= Wrap;  
		TexCoordIndex[1]	= CameraSpaceReflectionVector;      


		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;
		VertexShader = compile vs_1_1 VSMain();
    }
} // technique RenderScene
