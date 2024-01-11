float ShaderConst1 = 1;
float Time;
float4x4	WorldViewTM;
float4x4	WorldTM;
float4x4	ProjTM;

struct VS_OUTPUT 
{
   float4 Pos		: POSITION;
   float4 Diffuse	: COLOR0;
   float2 UV2: TEXCOORD1;
   float2 UV3: TEXCOORD3;
   //float  Fog		: FOG;
   float2 Tex		: TEXCOORD0;
};

float  FogDensity	= 0.00002f;

VS_OUTPUT MainVS(float4 Pos: POSITION, float4 Diffuse: COLOR0, float2 Tex: TEXCOORD0, float2 Center: TEXCOORD1)
{
	VS_OUTPUT Out;	
        //float s=0.5;//1.0+cos(Pos.x)*0.005;
        Out.UV2 = Out.UV3 = mul(WorldTM, Pos).xy/16384;

	Out.Pos	= mul( WorldViewTM, Pos );	
	//Center *= WorldTM._m00*1.5;
	Out.Pos.x += cos(Pos.x+Time*1.3)*Center.x*0.03;        
        Out.Pos.xy += Center.yx;//*0.7;
        //Out.Pos.y += Center.x;//*0.7;
	Out.Pos	= mul( ProjTM, Out.Pos );
        //Out.Pos.z += Center.x*Center.y;
	Out.Diffuse = Diffuse*3;//float4(1.0+cos(Pos.x)*0.2,1.0+cos(Pos.y)*0.1,1.0+cos(Pos.x*2)*0.1,1);//Diffuse*2.2;
	Out.Diffuse.w=Center.x/20;
	Out.Tex	= Tex;	
	//Out.Fog = 1.f/exp( Out.Pos.z*FogDensity );
	return Out;
} // MainVS
sampler Texture :register(s0) = sampler_state
{
   ADDRESSU         = Clamp;
   ADDRESSV         = Clamp;
   MAGFILTER        = LINEAR;//ANISOTROPIC;
   MINFILTER        = LINEAR;//ANISOTROPIC;
   MAXANISOTROPY    = 4;
   MIPFILTER        = LINEAR;//ANISOTROPIC;
   MIPMAPLODBIAS    = -0.5;
};
sampler Texture1 :register(s1) = sampler_state
{
   ADDRESSU         = Clamp;
   ADDRESSV         = Clamp;
   MAGFILTER        = LINEAR;//ANISOTROPIC;
   MINFILTER        = LINEAR;//ANISOTROPIC;
   MAXANISOTROPY    = 4;
   MIPFILTER        = LINEAR;//ANISOTROPIC;
   MIPMAPLODBIAS    = -0.5;
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
float4 pix(VS_OUTPUT v):COLOR
{
  float4 T1=tex2D(Texture,v.Tex);
  float4 T2=tex2D(Texture1,v.Tex);
  float4 T3=T1*v.Diffuse*2;
   
  return lerp(T3,T1,T2.y);
}
technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= True; 
		SrcBlend			= SrcAlpha;
		DestBlend			= InvSrcAlpha;
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x40; 
		ColorVertex			= False;
		SpecularEnable		= False; 
		CullMode			= None;			
		FillMode			= Solid;
		ShadeMode			= Gouraud;		
		DitherEnable		= True;			
		ZEnable				= True;			
		ZWriteEnable		= True;			
		ZFunc				= LessEqual;	
		FogEnable = true;	
		
		
		ColorOp[0]			= SelectArg2;//Modulate2x;
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate2x;
		AlphaArg1[0] 		= Diffuse; 
		AlphaArg2[0] 		= Texture; 
		MipFilter[0] 		= Point;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= CLAMP;  
		AddressV[0]			= CLAMP;  
                MipMapLodBias[0]=0.1;
		
		ColorOp[2]		= SelectArg1;//Modulate2x;
		ColorArg1[2]		= Current;
		ColorArg2[2]		= TFactor;
		AlphaOp[2]		= Disable;
		//AlphaArg1[2]		= Current;
		
		ColorOp[1]		= BlendCurrentAlpha;  
		ColorArg1[1]		= Current; 
		ColorArg2[1]		= Specular; 
		AlphaOp[1]		= Disable;
		//AlphaArg1[1] 		= Current; 
		MipFilter[1] 		= Linear;  
		MinFilter[1] 		= Linear;  
		MagFilter[1] 		= Linear;  
		AddressU[1]		= Wrap;  
		AddressV[1]		= Wrap;  		

		ColorOp[3]		= BlendTextureAlpha;
		ColorArg1[3]		= Texture;
		ColorArg2[3]		= Current;
		MinFilter[3]		= Linear;
		MagFilter[3]		= Linear;
		AlphaOp[1]		= Disable;
		VertexShader		= compile vs_1_1 MainVS();       
    }
} // technique RenderScene