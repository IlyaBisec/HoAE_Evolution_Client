float4x4 WorldViewProjTM;
float4 ViewPos;
float Time;
float FarPlane;
float NearPlane;
struct VS_OUTPUT 
{
   float4 Pos:     POSITION;
   float2 UV:      TEXCOORD0;
   float2 UV2:     TEXCOORD3;
   //float2 UV2:     TEXCOORD1;
   float4 Blend:   COLOR0;
};

VS_OUTPUT VSMain(float4 Pos: POSITION,
                 float2 UV: TEXCOORD0,
                 float2 UV2: TEXCOORD1,
                 float4 Diffuse:COLOR0)
{
   VS_OUTPUT Out;
   float4 iPos;
   Out.UV2=Pos.xy/16384;
   iPos.w=Pos.w;  
   iPos.y=UV2.x;
   iPos.z=(modf(UV2.y/2048.0f,iPos.x)*2048.0f)-512.0f;
   iPos.x-=256.0f;
   float2 dp=iPos.xy-ViewPos.xy;
   float c=1.0+(Pos.x-iPos.x)/5;
   float2 nxy=float2(Diffuse.x-0.5,Diffuse.y-0.5)*2;   
   //Out.UV2.y=Pos.z/16;
   //Out.UV2.x=(Pos.x*nxy.y-Pos.y*nxy.x)/16;
   Pos.x+=(Pos.z-iPos.z)*cos(iPos.x+Time)/50;
   float2 zw=mul(WorldViewProjTM,iPos).zw;
   Out.Pos = mul(WorldViewProjTM,Pos);   
   Out.Pos.zw=zw;
   Out.UV = UV;   
   nxy=normalize(nxy);
   dp=normalize(dp); 
   Out.Blend=float4(Diffuse.b,Diffuse.b,Diffuse.b,Diffuse.w);
   Out.Blend.rgb*=clamp(c,0.65,1.4)*clamp(1-dp.x/2,0.6,1.4)*1;
   Out.Blend.w=dot(dp,nxy);
   Out.Blend.w=Out.Blend.w*Out.Blend.w*1.4-0.5;
   Out.Blend.w*=Diffuse.w;
   //if(Out.Blend.w<0.5)Out.Pos=float4(10000,10000,10000,1);
   //Out.Blend.w*=1-pow(Out.Pos.z/(FarPlane+1),8);
   //Out.Blend.w*=clamp((Out.Pos.z-NearPlane)/75,0,1);   
   //Out.Pos.z-=0.5;
   return Out;
}
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = -0.2;
};
sampler Texture2 :register(s1) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0;
};
/*
float4 LeafPS(VS_OUTPUT In):COLOR
{
   float4 C1=tex2D(Texture,In.UV);
   float4 C2=tex2D(Texture2,In.UV2);
   float w=clamp((C1.g-C1.r)*2,0,1);
   //C2=lerp(C2,float4(0.5,0.5,0.5,1),w); 
   C1.a-=C2.r-0.3;
   C1.a*=3*w;
   C1.rgb*=C2.rgb*8;   
   
   return C1*In.Blend;
}
*/

technique RenderScene
{
	pass P0
	{
		AlphaBlendEnable	= True;
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual;
		AlphaRef			= 0x20;
		DitherEnable		= False;
		Lighting			= False;
		SpecularEnable		= False;
		ZEnable			    = True;
		ZFunc			    = LessEqual;
		ZWriteEnable		= True;
		FillMode			= Solid;
		CullMode			= None;

		FogEnable			= True;		

		ColorOp[0]			= Modulate4x;
		ColorArg1[0]		= Diffuse;
		ColorArg2[0]		= Texture;
		AlphaOp[0]			= Modulate;
		AlphaArg1[0]		= Diffuse;
		AlphaArg2[0]		= Texture;
		AddressU[0]			= Wrap;
		AddressV[0]			= Wrap;
		MinFilter[0]		= Linear;
		MagFilter[0]		= Linear;
		MipFilter[0]		= Linear;
		MipMapLodBias[0]	= -0.4;


		ColorOp[1]		= SelectArg1;
		ColorArg1[1]		= Current;
		AlphaOp[1]		= Modulate2x;
		AlphaArg1[1]		= Current;
		AlphaArg2[1]		= Diffuse;
		AddressU[1]			= Wrap;
		AddressV[1]			= Wrap;
		MinFilter[1]		= Linear;
		MagFilter[1]		= Linear;
		MipFilter[1]		= Linear;

		ColorOp[2]		= SelectArg1;
		ColorArg1[2]		= Current;
		AlphaOp[2]		= SelectArg1;
		AlphaArg1[2]		= Current;

			
                ColorOp[3]		= BlendTextureAlpha;
		ColorArg2[3]		= Current;
 		ColorArg1[3]		= Texture;
		AlphaOp[3]		= SelectArg1;
		AlphaArg1[3]		= Current;
		AddressU[3]		= Wrap;
		AddressV[3]		= Wrap;
		MinFilter[3]		= Linear;
		MagFilter[3]		= Linear;
		MipFilter[3]		= Linear;

		VertexShader = compile vs_1_1 VSMain();
//  		PixelShader  = compile ps_2_0 LeafPS();

	}  //pass P0
}  // technique RenderScene
