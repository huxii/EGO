Shader "II/Cel_silhouetted" 
{
	Properties
	{
		_MainTex("Diffuse Texture", 2D) = "white" {}
		_ShadowColor("Shadow Color", Color) = (0.0, 0.0, 0.0, 1.0)
		_SpecColor("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader
	{
		LOD 200
		Tags { "RenderType" = "Opaque" }
		Pass
		{
			Lighting On
			Tags {"LightMode" = "ForwardBase"}

			CGPROGRAM
			#include "AutoLight.cginc"
			#include "UnityCG.cginc"
			#pragma multi_compile_fwdbase

			#pragma vertex vert
			#pragma fragment frag
			#pragma exclude_renderers flash

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _ShadowColor;
			uniform float4 _SpecColor;

			struct vertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 tex : TEXCOORD0;
				float4 posWorld : TEXCOORD1;
				float3 normalDir : TEXCOORD2;
				LIGHTING_COORDS(4, 5)
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				o.normalDir = normalize( mul(float4(v.normal, 0.0f), unity_WorldToObject).xyz );	
				o.tex = v.texcoord;

				TRANSFER_VERTEX_TO_FRAGMENT(o);

				return o;	
			}

			float antialias(float radius, float dist, float width)
			{
				return smoothstep(radius - width, radius + width, dist);
			}

			float4 frag(vertexOutput i) : COLOR
			{
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
				float3 normalDirection = i.normalDir;
				float3 lightDirection;
				
				// Directional light
				if (_WorldSpaceLightPos0.w == 0.0)
				{
					lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				}
				// Point light
				else
				{
					float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
					lightDirection = normalize(fragmentToLightSource);
				}

				float atten = LIGHT_ATTENUATION(i);
			
				float4 lightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0);
				if (ramp < 0.25)
				{
					lightingColor = _ShadowColor;	
				}
				else
				if (ramp < 0.5)
				{
					lightingColor = _SpecColor * 0.25 + _ShadowColor * 0.75;
				}
				else
				if (ramp < 0.85)
				{
					lightingColor =  _SpecColor * 0.5 + _ShadowColor * 0.5;
				}
				else
				{
					lightingColor = _SpecColor;
				}

				float4 tex = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				float4 final = float4(lightingColor * tex.rgb, 1.0);

				return final;
				
			}

			ENDCG

			Stencil
			{
				Ref 4
				Comp always
				Pass replace
				ZFail keep
			}
		}
	}
	FallBack "Diffuse"
}
