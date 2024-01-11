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

float Time;
float4 TerraFogColor;
struct VS_OUTPUT2
{
	float4 pos      :POSITION;
	float2 uv	:TEXCOORD0;
	float2 uv2	:TEXCOORD1;
	float2 uv3	:TEXCOORD2;
        float2 uv4	:TEXCOORD3;
	float4 diffuse	:COLOR0;
	float4 fog	:COLOR1;
};

VS_OUTPUT2 VS_Main2( float4 pos: POSITION, float2 uv: TEXCOORD0, float4 diffuse:COLOR0, float4 specular:COLOR1)
{
   VS_OUTPUT2 Out;   
   Out.pos      = mul( WorldViewProjTM, pos );
   Out.uv.xy       = uv;
   
   //  calculate shadow map uv coordinates
   Out.uv4 = pos.xy/16384.0f;
   float4 shUV;
   shUV = mul( WorldViewTM, pos );
   shUV = mul( TextureTM1, shUV );
   //shUV.xy /= shUV.w;
   //Out.uv2.xyz = shUV.xyw;
   Out.uv2.xy = shUV.xy/shUV.w;
   
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
	//Out.fog.r = 0;
   }
   float w = specular.w*64+0.125;//1.0/8.0;
   Out.uv3.xy = uv+(specular.z*2+1)*(specular.xy*2-1)/256.0/3.0;
   
   Out.diffuse.w*=(1.5-pow(Out.pos.z/FarPlane,8)*2);
   //Out.uv3.z = w;
   //Out.uv.z = w;
   return Out;
} // VS_Main
technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable		= True;
		AlphaTestEnable			= False;
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
		AlphaOp[0]			= SelectArg1;//Modulate2x;
		AlphaArg1[0]			= Specular;
		//AlphaArg2[0]			= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]			= Linear;
		MagFilter[0]			= Linear;
		MipFilter[0]			= Linear;
 		MipMapLodBias[0]		= -0.6;		

		ColorOp[1]			= Modulate;
		ColorArg1[1]			= Current;
		ColorArg2[1]			= Complement|Texture;
		AlphaOp[1]			= SelectArg1;
		AlphaArg1[1]			= Specular;
		AddressU[1]			= Clamp;
		AddressV[1]			= Clamp;
		MinFilter[1]			= Linear;
		MagFilter[1]			= Linear;

		ColorOp[2]			= BlendCurrentAlpha;
		ColorArg2[2]			= Current;
		ColorArg1[2]			= Specular;
		AlphaOp[2]			= Add;
		AlphaArg1[2]			= Diffuse;
		AlphaArg2[2]			= Diffuse;
		AddressU[2]			= Wrap;
		AddressV[2]			= Wrap;
		MinFilter[2]			= Linear;
		MagFilter[2]			= Linear;

		ColorOp[3]			= BlendTextureAlpha;
		ColorArg2[3]			= Current;
		ColorArg1[3]			= Texture;
		AlphaOp[3]			= SelectArg1;
		AlphaArg1[3]			= Current;
		AddressU[3]			= Wrap;
		AddressV[3]			= Wrap;
		MinFilter[3]			= Linear;
		MagFilter[3]			= Linear;
		

		//DiffuseMaterialSource	= Color1;
		//ClipPlaneEnable         = 1;
		TextureFactor			= 0xFFFFFFFF;		
		//TexCoordIndex[0]		= 0;
		
		//PixelShader			    = compile ps_2_0 PSMain2();
		VertexShader		    = compile vs_1_1 VS_Main2();

	}  //pass P0
}  // technique RenderScene
