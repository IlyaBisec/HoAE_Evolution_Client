/***********************************************/
/***                                         ***/
/***   GPU-based skinning main include file  ***/
/***                                         ***/
/***********************************************/

float4   TFactor;
float4x4 ViewProjTM;
float4x4 WorldTM;
float    Time;
float3   ViewPos;
float4   LDir=float4(-0.866,-0.43,-0.43,0);
float4   LightDiffuse=float4(0.6,0.6,0.6,1.0);
float4   LightAmbient=float4(0.2,0.2,0.2,1.0);
float4   BonesArray[210];

sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MAXANISOTROPY    = 0;
   MIPFILTER        = LINEAR;
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
   float4 Pos : POSITION;
   float2 UV  : TEXCOORD0;
   float2 UV1 : TEXCOORD1;
   float2 UV3 : TEXCOORD3;
   float3 LocV: TEXCOORD2;  
   float3 N   : TEXCOORD4;
   float3 T   : TEXCOORD5;
   float3 B   : TEXCOORD6;
   float4 D   : COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION, float4 D:COLOR0,float4 S:COLOR1, float4 C:COLOR2,float2 UV: TEXCOORD0)
{
   VS_OUTPUT Out;
   
   float3 T=D.xyz*2-1;
   float3 N=S.xyz*2-1;   

   int4 idx=D3DCOLORtoUBYTE4(C);
   float4x4 m;
   
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

   float4x4 m2;
   m2=mul(m,WorldTM); 
   
   Out.Pos = mul(m2,Pos);
   Out.N = (mul(m2,N));
   Out.T = (mul(m2,T));
   Out.B = -(cross(Out.N,Out.T)*(S.w*2-1));

   Out.LocV=normalize(ViewPos-Out.Pos);   

   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.UV  = UV;
   Out.UV1 = UV;

   Out.D = (LightAmbient-clamp(LightDiffuse*dot(Out.N,LDir),-1,0));
   return Out;
}

//pixel shader with bump and displacement(optional)

float4 brightPS(VS_OUTPUT v):COLOR{

#ifdef RANDOMLIGHT
   //use this define to test light
   float4 LDir=float4(cos(Time*2),sin(Time*2),cos(Time*1.4),0);
#endif //RANDOMLIGHT

   float3 VDir=v.LocV;

#ifdef DISPLACEMENT
   float4 Bump0=tex2Dbias(Texture,float4(v.UV,0,1));
   v.UV= v.UV HSIGN float2(dot(v.B,VDir),dot(v.T,VDir))*(0.5-Bump0.HEIGHTSRC)*DISPLACEMENT/120;
#endif
     
   float4 tex=tex2D(Texture,v.UV);
   float  dT=(tex2D(Texture,v.UV+float2(0,1/TEXSIZE)).HEIGHTSRC-tex2D(Texture,v.UV+float2(0,-1/TEXSIZE)).HEIGHTSRC)*BUMPSTRENGTH;
   float  dB=(tex2D(Texture,v.UV+float2(1/TEXSIZE,0)).HEIGHTSRC-tex2D(Texture,v.UV+float2(1/-TEXSIZE,0)).HEIGHTSRC)*BUMPSTRENGTH;
   float3 DN=v.N HSIGN v.T*dT HSIGN v.B*dB;
   float3 nn=normalize(DN);

   float3 refl=VDir-2*nn*dot(VDir,nn);
   float  S=max(0,dot(refl,LDir));

   float D=(LightAmbient-clamp(LightDiffuse*dot(nn,LDir),-1,0));
   float4 fog=tex2D(FogOfWar,v.UV3);
   float4 c1=tex*D*TFactor*3;//+S*S*S*clamp(tex.b+tex.g-tex.r,0,1)*2;
   c1.w=TFactor.w;
   //c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,4)*clamp(tex.r-tex.b,0,1);
   
#if SPECULARTYPE == 1
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,4)*tex.r;
#elif SPECULARTYPE == 2
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,4)*tex.g;
#elif SPECULARTYPE == 3
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,4)*(tex.b-0.5);
#elif SPECULARTYPE == 4
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,4)*clamp(tex.b+tex.g-tex.r,0,1)*2;
#endif  
    
   return c1;
}

//------------------- shadows skinning ----------------------//

struct VS_OUTPUT_SHADOW 
{
   float4 Pos: POSITION;
   float2 UV : TEXCOORD0;
   float2 UV3: TEXCOORD3;
   float4 D  : COLOR0;
   float4 S  : COLOR1;
};

VS_OUTPUT_SHADOW VSMainShadow(float4 Pos: POSITION, float4 D:COLOR0, float4 S:COLOR1, float4 C:COLOR2, float2 UV: TEXCOORD0)
{
   VS_OUTPUT_SHADOW Out;   
   
   int4 idx=D3DCOLORtoUBYTE4(C);
   float4x4 m;
   
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

   float4x4 m2;
   m2=mul(m,WorldTM); 
   
   Out.Pos = mul(m2,Pos);

   Out.S.w = Out.Pos.z/768.0f;
   Out.S.xyz=0;
   Out.UV3 = Out.Pos.xy/16384.0f;
   Out.Pos = mul(ViewProjTM, Out.Pos);
   Out.UV = UV;
   Out.D=float4(1,1,1,1);
   return Out;
}
