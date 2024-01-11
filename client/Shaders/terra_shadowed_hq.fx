//*****************************************************************************
//*	File:	terra_shadowed.fx
//*	Desc:	Legacy shader
//*	Author:	Andrew Shpagin
//*	Date:	10.6.2005
//*****************************************************************************

float4x4 WorldViewProjTM;
float4x4 WorldViewTM;
float4x4 TextureTM1;
float FarPlane;
float4   ViewPos;

float4 LDir=float4(-0.866,-0.43,-0.43,0);

float Time;
float4 TerraFogColor;
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;//ANISOTROPIC;
   MINFILTER        = LINEAR;//ANISOTROPIC;
   MAXANISOTROPY    = 4;
   MIPFILTER        = LINEAR;//ANISOTROPIC;
   MIPMAPLODBIAS    = -0.65;
};

sampler Shadows :register(s1) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 5;
};
sampler NMap :register(s2) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;//ANISOTROPIC;
   MINFILTER        = LINEAR;//ANISOTROPIC;
   MAXANISOTROPY    = 4;
   MIPFILTER        = LINEAR;//ANISOTROPIC;
   MIPMAPLODBIAS    = -0.65;
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
struct VS_OUTPUT2
{
	float4 pos      :POSITION;
	float2 uv	:TEXCOORD0;//texture
	float3 uv2	:TEXCOORD1;//shadow
	float2 uv3	:TEXCOORD2;//texture + shift for emboss
        float2 uv4      :TEXCOORD3;//fow
	float3 Light	:TEXCOORD4;
        float3 View	:TEXCOORD2;
	float4 diffuse	:COLOR0;
	float4 fog	:COLOR1;
};

VS_OUTPUT2 VS_Main2( float4 pos: POSITION, float2 uv: TEXCOORD0, float4 diffuse:COLOR0, float4 specular:COLOR1)
{
   VS_OUTPUT2 Out;   
   Out.pos      = mul( WorldViewProjTM, pos );
   Out.uv.xy       = uv;
   float3 View   = normalize(ViewPos.xyz-pos.xyz);   

   //  calculate shadow map uv coordinates
   float4 shUV;
   Out.uv4 = pos.xy/16384.0f;
   shUV = mul( WorldViewTM, pos );
   shUV = mul( TextureTM1, shUV );
   //shUV.xy /= shUV.w;
   //Out.uv2.xyz = shUV.xyw;
   Out.uv2.xy = shUV.xy;
   Out.uv2.z=shUV.w;
   
   Out.diffuse  = diffuse;
   Out.fog      = TerraFogColor;
   if (pos.z < 0)
   {
        Out.fog.w = -pos.z/250;// + 
                    //(cos(Time+pos.x) + cos(Time+pos.y) + cos(-Time+pos.z/30))/10;
	//Out.fog.r = -pos.z/20;
   }else 
   {
        Out.fog.w = 0;
	Out.fog.r = 0;
   }
   float w = specular.w*64+0.125;//1.0/8.0;
   float3 T=specular.zyx*2-1;
   float3 B=color2.zyx*2-1;
   float3 N=normalize(cross(B,T)*(2*color2.w)-1);
   Out.uv3.xy = uv+(specular.z*2+1)*(specular.xy*2-1)/256.0/3.0;

   Out.Light=float3(-dot(T,LDir),-dot(B,LDir),dot(N,LDir));
   Out.View =float3(-dot(T,View),-dot(B,View),dot(N,View));
   
   Out.diffuse.w*=(1.5-pow(Out.pos.z/FarPlane,8)*2);
   Out.fog.y=pos.z/768.0;
   Out.fog.z=specular.w;
   Out.fog.x=Out.pos.z/Out.pos.w;
   Out.diffuse.w-=1-clamp((1.5-pow(Out.pos.z/FarPlane,8)*2),0,1);
   //Out.uv3.z = w;
   //Out.uv.z = w;
   return Out;
} // VS_Main

struct PS_OUTPUT
{
    float4 Color[4]  : COLOR0;
    float  Depth  : DEPTH;
};

float4 PSMain2( float2 uv1:TEXCOORD0, 
                float4 uv2:TEXCOORD1, 
		float2 uv4:TEXCOORD3, 
		float3 Light:TEXCOORD4,
                float3 View:TEXCOORD2,
                float4 Diffuse:COLOR0, 
                float4 fog:COLOR1 ) : COLOR
{ 
   float4 C1 = tex2D(Texture,uv1);
   float4 C2 = tex2D(Texture,uv3);
   float4 CF = tex2D(FogOfWar,uv4);
   uv2/=uv2.w;
   C2.w-=C1.w;
   C2.w=1+C2.w*4;//*fog.r;///(1+C2.w);
   
   uv2.xy/=uv2.z;
   float c=tex2D( Shadows, uv2.xy );//(tex2D( Shadows, uv2.xy )+tex2D( Shadows, uv2.xy+0.002)+tex2D( Shadows, uv2.xy+float2(0.002,-0.002))+tex2D( Shadows, uv2.xy+float2(-0.002,0.002)))/4;
   float4 shColor = clamp(c+fog.x,0,1); 
      float3  N = tex2D(NMap,uv1);//normalize(float3(CR-CL,(CR+CL)/2-C1.w,1/32.0));
   float sp=N.z;
   N.z=1;                     
   N=2*N-1;
   N=normalize(N);

   float  L    = dot(N,Light);
   float3 refl = Light-2*N*L;
   float  S    = max(dot(refl,View),0);
   //if(L<0)S=0;
   
   float sh = 1;//(L+1)/2;
   
   
   
   float  c  = (1-c4.r)/fog.z/1.5;
   float  dr = c4.w-fog.y-0.005;
   if(dr<0)c=1;
   
   sh *= clamp(c,0,1); 

   float4 C3;      
   
   C3.xyz = C2.w*shColor.xyz*Diffuse.xyz*C1.xyz*2;
   C3.xyz = (1-CF.w)*lerp(C3.xyz,TerraFogColor.xyz,fog.w);   
   //C3.xyz = lerp(C3.xyz,fog.xyz,fog.w);
   C3.w = 2.0*Diffuse.w;//(Diffuse.w;//*(2+fog.r/2);   
   //C3.xyz = (1-CF.w)*lerp(C3.xyz,TerraFogColor.xyz,fog.w);
   return C3;
}

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= True;
		AlphaRef			= 0x08;
		SrcBlend				= SrcAlpha;
		DestBlend				= InvSrcAlpha;
		ColorVertex				= True;
		SpecularEnable			= False;
		NormalizeNormals		= False;
		CullMode			    = CCW;
		Lighting			    = False;
		FillMode			    = Solid;
		ShadeMode			    = Gouraud;
		DitherEnable			= True;
		ZEnable			        = True;
		ZWriteEnable			= True;
		ZFunc			        = LessEqual;
		
		FogEnable			= True;		
		
		ColorOp[0]			= Modulate2x;
		ColorArg1[0]			= Diffuse;
		ColorArg2[0]			= Texture;
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0]			= Diffuse;
		AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= Linear;
 		MipMapLodBias[0]		= -0.6;
		
		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Texture;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Current;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;
		

		//DiffuseMaterialSource	= Color1;
		//ClipPlaneEnable         = 1;
		//TexCoordIndex[0]		= 0;
		
		PixelShader			    = compile ps_2_0 PSMain2();
		VertexShader		    = compile vs_1_1 VS_Main2();

	}  //pass P0
}  // technique RenderScene
