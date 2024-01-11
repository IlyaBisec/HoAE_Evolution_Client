//*****************************************************************************
//*	File:	vertex_lit_natcolor.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 
float4  TFactor;
float4x4 ViewProjTM;
float4x4 WorldTM;
float Time;
float3 ViewPos;

float4 LDir=float4(-0.866,-0.43,-0.43,0);

float4 LightDiffuse=float4(0.6,0.6,0.6,1.0);
float4 LightAmbient=float4(0.2,0.2,0.2,1.0);
float4 BonesArray[210];

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;//ANISOTROPIC;
   MINFILTER        = LINEAR;//ANISOTROPIC;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;//ANISOTROPIC;
   MIPMAPLODBIAS    = 0.0;
};

sampler FogOfWar :register(s3) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0;
};

struct VS_OUTPUT 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV1: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   float3 LocV:TEXCOORD2; 
  
   float3 N  : TEXCOORD4;
   float3 T  : TEXCOORD5;
   float3 B  : TEXCOORD6;

   //float4 D  : COLOR0;
   //float4 S  : COLOR1;
};



VS_OUTPUT VSMain(float4 Pos: POSITION, float4 D:COLOR0,float4 S:COLOR1, float4 C:COLOR2,float2 UV: TEXCOORD0)
{
   VS_OUTPUT Out;
   
   float3 T=D.xyz*2-1;
   float3 B=S.xyz*2-1;   

   int4 idx=D3DCOLORtoUBYTE4(C);
   float4x4 m;

   //float4 LDir=float4(cos(Time*2),sin(Time*2),cos(Time*1.4),0);
   //D.w=1;
   //C.w=0;
   
   m._m00_m01_m02_m03=BonesArray[idx.x  ]*D.w;
   m._m10_m11_m12_m13=BonesArray[idx.x+1]*D.w;
   m._m20_m21_m22_m23=BonesArray[idx.x+2]*D.w;

   m._m00_m01_m02_m03+=BonesArray[idx.y  ]*C.w;
   m._m10_m11_m12_m13+=BonesArray[idx.y+1]*C.w;
   m._m20_m21_m22_m23+=BonesArray[idx.y+2]*C.w;

   C.w=1-C.w-D.w;

   m._m00_m01_m02_m03+=BonesArray[idx.z  ]*C.w;
   m._m10_m11_m12_m13+=BonesArray[idx.z+1]*C.w;
   m._m20_m21_m22_m23+=BonesArray[idx.z+2]*C.w;

   m._m30_m31_m32_m33=float4(0,0,0,1);
   

   /*
   m._m00_m10_m20_m30=BonesArray[idx.x  ]*D.w;
   m._m01_m11_m21_m31=BonesArray[idx.x+1]*D.w;
   m._m02_m12_m22_m32=BonesArray[idx.x+2]*D.w;

   m._m00_m10_m20_m30+=BonesArray[idx.y  ]*C.w;
   m._m01_m11_m21_m31+=BonesArray[idx.y+1]*C.w;
   m._m02_m12_m22_m32+=BonesArray[idx.y+2]*C.w;

   C.w=1-C.w-D.w;

   m._m00_m10_m20_m30+=BonesArray[idx.z  ]*C.w;
   m._m01_m11_m21_m31+=BonesArray[idx.z+1]*C.w;
   m._m02_m12_m22_m32+=BonesArray[idx.z+2]*C.w;

   m._m03_m13_m23_m33=float4(0,0,0,1);
   */
   

   float4x4 m2;
   m2=m;//WorldTM;//mul(WorldTM,m); 
   
   Out.Pos = mul(m2,Pos);
   //Out.N = mul(m2,N);
   Out.B = mul(m2,B);
   Out.T = mul(m2,T);
   Out.N = -normalize(cross(Out.B,Out.T)*(S.w*2-1));

   Out.LocV=normalize(ViewPos-Out.Pos);   

   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV;
   return Out;
}
float4 brightPS(VS_OUTPUT v):COLOR{

   //float3 LDir=float3(cos(Time*2),sin(Time*2),0);   
   //float4 LDir=float4(cos(Time*2),sin(Time*2),cos(Time*1.4),0);
   float3 VDir=v.LocV;
     
   float4 tex=tex2D(Texture,v.UV);
   //float4 tex2=tex2D(Texture,v.UV+v.LD/512.0);
   float dT=(tex2D(Texture,v.UV+float2(0,1/256.0)).r-tex2D(Texture,v.UV+float2(0,-1/256.0)).r)*2.0;
   float dB=(tex2D(Texture,v.UV+float2(1/256.0,0)).r-tex2D(Texture,v.UV+float2(1/-256.0,0)).r)*2.0;
   float3 DN=v.N-v.T*dT-v.B*dB;
   float3 nn=normalize(DN);

   float3 refl=VDir-2*nn*dot(VDir,nn);
   float  S=max(0,dot(refl,LDir));


   float D=(LightAmbient-clamp(LightDiffuse*dot(nn,LDir),-1,0));
   float4 fog=tex2D(FogOfWar,v.UV3);
   float4 c1=1;//lerp(float4(2,2,2,0),v.D,tex.w);
   c1*=tex*D*TFactor*3;
   c1.w=TFactor.w;
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+S*S*S*S*S*S*S*tex.r;
   return c1;
}
technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialPower		= 40.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.3, 1.3, 1.3, 1.0}; 
		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[0]   	= {0.3, 0.3, 0.3, 1.0};
		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
		LightRange[0]     	= 100000.0; 

//		LightType[0]      	= DIRECTIONAL; 
//		LightDiffuse[0]   	= {4.3, 4.3, 4.3, 1.0}; 
//		LightSpecular[0]  	= {1.0, 1.0, 1.0, 1.0};
//		LightAmbient[0]   	= {0.2, 0.2, 0.2, 1.0};
//		LightDirection[0] 	= {-0.816, -0.408, -0.408};  
//		LightRange[0]     	= 100000.0; 
		
		LightType[1]      	= DIRECTIONAL; 
		LightDiffuse[1]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[1]  	= {1.0, 1.0, 1.0, 1.0};
		LightAmbient[1]   	= {0.2, 0.2, 0.2, 1.0};
		LightDirection[1] 	= {-0.0, -0.2, -1.0};  
		LightRange[1]     	= 100000.0; 

		LightEnable[0]		= True;
		LightEnable[1]		= False;
		
		Lighting		    = True; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= True; 
		SrcBlend            = SrcAlpha;
		DestBlend           = InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x01; 
		ColorVertex			= True;
		SpecularEnable		= False; 
		NormalizeNormals	= True; 
		CullMode			= CCW;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 2; 
		
		FogEnable			= True;
		
		ColorOp[0]			= SelectArg2;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= SelectArg1;
		AlphaArg1[0] 		= Texture; 
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;   
                MipMapLodBias[0]        = -0.2;
		
		ColorOp[1]			= BlendCurrentAlpha;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= TFactor; 
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1] 		= TFactor; 
		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]			= Wrap;  
		AddressV[1]			= Wrap;  
		
		ColorOp[1]			= SelectArg1;
		ColorArg1[1]			= Current;
		AlphaOp[1]			= Disable;

		ColorOp[2]			= SelectArg1;
		ColorArg1[2]			= Current;
		AlphaOp[2]			= Disable;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg1[3]			= Texture;
		ColorArg2[3]			= Current;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		AlphaOp[3]			= Disable;
		VertexShader = compile vs_2_0 VSMain();
  		PixelShader = compile ps_2_0 brightPS();
    }
} // technique RenderScene
