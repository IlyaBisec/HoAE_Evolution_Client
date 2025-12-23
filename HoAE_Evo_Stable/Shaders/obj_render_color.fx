struct VS_OUTPUT 
{
   float4 Pos   : POSITION;
   float4 Color : COLOR0;
};

VS_OUTPUT VSMain(float2 UV:TEXCOORD0,float4 Color: COLOR0)
{
   VS_OUTPUT Out;
   Out.Pos.xy = UV*2-1;
   Out.Pos.z = 0;
   Out.Pos.w=1;
   Out.Color  = Color;
   return Out;
}
float4 ps(VS_OUTPUT v) : COLOR
{
  return v.Color;
}
technique RenderScene
{
    pass P0
    {          
		AlphaBlendEnable	= False; 
		AlphaTestEnable		= True;
		AlphaRef		= 0x00; 
		CullMode		= None;
		FillMode		= Solid; 
		ShadeMode		= Gouraud; 
		DitherEnable		= True; 
		ZEnable			= False; 
		ZWriteEnable		= False; 
		ZFunc			= LessEqual; 
		FogEnable		= False;
 		ColorOp[0]		= SelectArg1;
		ColorArg1[0]		= Diffuse;
		VertexShader 		= compile vs_1_1 VSMain();
                PixelShader		= compile ps_1_1 ps();
    }
} // technique RenderScene
