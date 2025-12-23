//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
float4 		c_MaterialAmbient;	// Material's ambient color
float4 		c_MaterialDiffuse;	// Material's diffuse color

// This effect file uses a single directional light
float3 		c_LightDir		= normalize(float3(1.0f, 1.0f, 1.0f));	// Light's direction in world space
float4 		c_LightAmbient	= { 1.0f, 1.0f, 1.0f, 1.0f };			// Light's ambient color
float4 		c_LightDiffuse	= { 1.0f, 1.0f, 1.0f, 1.0f };			// Light's diffuse color

float	 	c_Time;					// App's time in seconds
float4x4 	c_WorldTM;				// World matrix for object
float4x4 	c_WorldViewProjTM;		// World * View * Projection matrix

//-----------------------------------------------------------------------------
// Texture samplers
//-----------------------------------------------------------------------------
sampler MeshTextureSampler = 
sampler_state
{   
    MipFilter = Point;
    MinFilter = Point;
    MagFilter = Point;
};

//-----------------------------------------------------------------------------
// Vertex shader output structure
//-----------------------------------------------------------------------------
struct VS_OUTPUT
{
    float4 Position   : POSITION;   // vertex position 
    float4 Diffuse    : COLOR0;     // vertex diffuse color
    float2 TextureUV  : TEXCOORD0;  // vertex texture coords 
};

//-----------------------------------------------------------------------------
// Name: RenderSceneVS
// Type: Vertex shader                                      
// Desc: This shader computes standard transform and lighting
//-----------------------------------------------------------------------------
VS_OUTPUT RenderSceneVS( float3 vPos : POSITION, 
                         float3 vNormal : NORMAL,
                         float2 vTexCoord0 : TEXCOORD0 )
{
    VS_OUTPUT Output;
    float3 vNormalWorldSpace;
  
	// Animation the vertex based on time and the vertex's object space position
    float4 vAnimatedPos = float4( vPos.x + sin(c_Time*10.0f)*vPos.x/2, vPos.y, vPos.z, 1 );
    
    // Transform the position from object space to homogeneous projection space
    Output.Position = mul(vAnimatedPos, c_WorldViewProjTM);
    
    // Transform the normal from object space to world space	
    vNormalWorldSpace = normalize(mul(vNormal, (float3x3)c_WorldTM)); // normal (world space)
    
    // Compute simple directional lighting equation
    Output.Diffuse.rgb = c_MaterialDiffuse * c_LightDiffuse * 
						 max(0,dot(vNormalWorldSpace, c_LightDir)) + 
                         c_MaterialAmbient * c_LightAmbient;   
    Output.Diffuse.a = 1.0f; 
    
    // Just copy the texture coordinate through
    Output.TextureUV = vTexCoord0; 
    
    return Output;    
} // RenderSceneVS

//-----------------------------------------------------------------------------
// Pixel shader output structure
//-----------------------------------------------------------------------------
struct PS_OUTPUT
{
    float4 RGBColor : COLOR0;  // Pixel color    
};

//-----------------------------------------------------------------------------
// Name: RenderScenePS                                        
// Type: Pixel shader
// Desc: This shader outputs the pixel's color by modulating the texture's
//		 color with diffuse material color
//-----------------------------------------------------------------------------
PS_OUTPUT RenderScenePS( VS_OUTPUT In ) 
{ 
    PS_OUTPUT Output;

    // Lookup mesh texture and modulate it with diffuse
    Output.RGBColor = tex2D(MeshTextureSampler, In.TextureUV)*In.Diffuse;
    return Output;
} // RenderScenePS

//-----------------------------------------------------------------------------
// Name: RenderScene
// Type: Technique                                     
// Desc: Renders scene to render target
//-----------------------------------------------------------------------------
technique RenderScene
{
    pass P0
    {          
        VertexShader = compile vs_1_1 RenderSceneVS();
        PixelShader  = compile ps_1_1 RenderScenePS(); 
    }
} // technique RenderScene
