technique RenderScene
{
    pass P0
    {          
                AlphaBlendEnable    = True;
				SrcBlend		    = SrcAlpha;
				DestBlend		    = InvSrcAlpha;
				AlphaTestEnable     = True;
				AlphaRef            = 0x01;
				DitherEnable	    = True;
				Lighting		    = False;
				SpecularEnable	    = False;
				ColorVertex		    = True;
				ZEnable			    = True;
				ZFunc			    = LessEqual;
				ZWriteEnable	    = True;
				FillMode		    = Solid;
				CullMode		    = None;
				
				ColorOp[0]		    = Modulate;
				ColorArg1[0]	    = Diffuse;
				ColorArg2[0]	    = Texture;
				AlphaOp[0]		    = Modulate;
				AlphaArg1[0]	    = Diffuse;
				AlphaArg2[0]	    = Texture;
				AddressU[0]		    = Wrap;
				AddressV[0]		    = Wrap;
				MinFilter[0]	    = Point;
				MagFilter[0]	    = Point;
				
				ColorOp[1]		    = Disable;
				AlphaOp[1]		    = Disable;
				ColorOp[2]		    = Disable;
				AlphaOp[2]		    = Disable;
    }
} // technique RenderScene
