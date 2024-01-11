//*****************************************************************************
//*	File:	vertex_lit_shiny_layer.fx
//*	Desc:	Legacy shader, used for FFP, smooth-shaded vertex-lit models
//*	Author:	Ruslan Shestopalyuk
//*	Date:	15.11.2004
//***************************************************************************** 

sampler DiffuseSampler :register(s0) = sampler_state
{
   ADDRESSU         = WRAP;
   ADDRESSV         = WRAP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = -0.3;
};

sampler SpecularSampler :register(s1) = sampler_state
{
   ADDRESSU         = CLAMP;
   ADDRESSV         = CLAMP;
   MAGFILTER        = LINEAR;
   MINFILTER        = LINEAR;
   MIPFILTER        = LINEAR;
   MIPMAPLODBIAS    = 0;
};

float4 PSMain(  float2 uv1:TEXCOORD0, 
                float2 uv2:TEXCOORD1, 
                float4 diff:COLOR0,
                float4 spec:COLOR1 ) : COLOR 
{
   float4 d = tex2D(DiffuseSampler,  uv1);
   float4 s = tex2D(SpecularSampler, uv1);
   float4 c = d + spec*s;
   return c;
}

technique RenderScene
{
    pass P0
    {          
		MaterialAmbient 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialDiffuse 	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialSpecular	= {1.0, 1.0, 1.0, 1.0}; 
		MaterialPower		= 5.0f;
		
		LightType[0]      	= DIRECTIONAL; 
		LightDiffuse[0]   	= {1.0, 1.0, 1.0, 1.0}; 
		LightSpecular[0]  	= {0.8, 0.8, 0.8, 1.0};
		LightAmbient[0]   	= {0.5, 0.5, 0.5, 1.0};
		LightDirection[0] 	= {0.577, -0.577, 0.577};  
		LightRange[0]     	= 100000.0; 
		LightEnable[0]		= True; 

		Lighting			= True; 
		SpecularEnable		= True; 
		
		AlphaBlendEnable	= True; 
		AlphaTestEnable		= True;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x80; 
		ColorVertex			= True;
		NormalizeNormals	= True; 
		CullMode			= CCW;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= False; 
		ZEnable				= True; 
		ZWriteEnable		= True; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 0; 
		
		PixelShader			= compile ps_1_4 PSMain();				 
    }
} // technique RenderScene
