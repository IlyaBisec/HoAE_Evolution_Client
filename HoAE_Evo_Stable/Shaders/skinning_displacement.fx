//pixel shader with bump and displacement(optional)

float4 brightPS(VS_OUTPUT v):COLOR{

#ifdef RANDOMLIGHT
   //use this define to test light
   float4 LDir=float4(cos(Time*2),sin(Time*2),cos(Time*1.4),0);
#endif //RANDOMLIGHT

   float3 VDir=v.LocV;

#ifdef DISPLACEMENT
   float4 Bump0=tex2Dbias(Texture,float4(v.UV,0,1));
   v.UV+=float2(dot(v.B,VDir),dot(v.T,VDir))*(Bump0.r-0.5)*DISPLACEMENT/120;
#endif
     
   float4 tex=tex2D(Texture,v.UV);
   float  dT=(tex2D(Texture,v.UV+float2(0,1/TEXSIZE)).r-tex2D(Texture,v.UV+float2(0,-1/TEXSIZE)).r)*BUMPSTRENGTH;
   float  dB=(tex2D(Texture,v.UV+float2(1/TEXSIZE,0)).r-tex2D(Texture,v.UV+float2(1/-TEXSIZE,0)).r)*BUMPSTRENGTH;
   float3 DN=v.N-v.T*dT-v.B*dB;
   float3 nn=normalize(DN);

   float3 refl=VDir-2*nn*dot(VDir,nn);
   float  S=max(0,dot(refl,LDir));

   float D=(LightAmbient-clamp(LightDiffuse*dot(nn,LDir),-1,0));
   float4 fog=tex2D(FogOfWar,v.UV3);
   c1=tex*D*TFactor*3;
   c1.w=TFactor.w;
   //c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,8)*clamp(tex.r-tex.b,0,1);
   c1.xyz=lerp(c1.xyz,fog.xyz,fog.w)+pow(S,8)*clamp(tex.r-tex.b,0,1);
   return c1;
}