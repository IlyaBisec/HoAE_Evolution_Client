float4x4	WorldViewProjTM;
float4		ViewPos;

struct VS_OUTPUT {
	float4 Pos		: POSITION;
	float4 Diffuse	: COLOR0;
	float2 Tex		: TEXCOORD0;
};

VS_OUTPUT MainVS(float4 Pos : POSITION, float2 Tex : TEXCOORD0) {
	VS_OUTPUT Out;
	Out.Pos = mul(WorldViewProjTM, Pos);
	Out.Pos.z = clamp(Out.Pos.z, -1.0f, 1.0f);
	Out.Diffuse = float4(1.0f, 1.0f, 1.0f, 1.0f);
	Out.Tex = Tex;
	return Out;
}

technique RenderScene
{
    pass P0
    {          

		LightEnable[0]		= False;
		LightEnable[1]		= False;
		
		Lighting		    = False; 
		SpecularEnable		= False;
		
		AlphaBlendEnable	= False; 
		SrcBlend            = SrcAlpha;
		DestBlend           = InvSrcAlpha;
		AlphaTestEnable		= False;
		AlphaFunc			= GreaterEqual; 
		AlphaRef			= 0x30; 
		ColorVertex			= True;
		SpecularEnable		= True; 
		NormalizeNormals	= True; 
		CullMode			= None;
		Lighting			= True; 
		FillMode			= Solid; 
		ShadeMode			= Gouraud; 
		DitherEnable		= True; 
		ZEnable				= False; 
		ZWriteEnable		= False; 
		ZFunc				= LessEqual; 
		ClipPlaneEnable		= 0; 
		
		ColorOp[0]			= SelectArg2;  
		ColorArg1[0]		= Diffuse; 
		ColorArg2[0]		= Texture; 
		AlphaOp[0]			= Modulate;
		AlphaArg1[0] 		= Texture; 
		AlphaArg2[0] 		= TFactor;
		MipFilter[0] 		= Linear;  
		MinFilter[0] 		= Linear;  
		MagFilter[0] 		= Linear;  
		AddressU[0]			= Wrap;  
		AddressV[0]			= Wrap;  
		TexCoordIndex[0]	= PassThru;   
		
		ColorOp[1]			= Disable;  
		AlphaOp[1]			= Disable;
        ColorOp[2]			= Disable;  
		AlphaOp[2]			= Disable;
		
		VertexShader = compile vs_1_1 MainVS();	  
    }
}