Shader "II/Cel_silhouetted" 
{
	Properties
	{
		_MainTex("Diffuse Texture", 2D) = "white" {}
		[HDR]_ShadowColor("Shadow Color", Color) = (0.0, 0.0, 0.0, 1.0)
		[HDR]_SpecColor("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
		[HDR]_SilhouettedColor("Silhouetted Color", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader
	{
		LOD 200
		Tags 
		{ 
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType"="Transparent"
		}

		Pass 
		{
			Cull Off

			Name "SILHOUETTED"
			Tags 
			{ 
				"LightMode" = "Always" 
			}

			ZTest Always
			ZWrite Off
			// you can choose what kind of blending mode you want for the outline
			Blend SrcAlpha OneMinusSrcAlpha // Normal
			//Blend One One // Additive
			//Blend One OneMinusDstColor // Soft Additive
			//Blend DstColor Zero // Multiplicative
			//Blend DstColor SrcColor // 2x Multiplicative
 
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			uniform float4 _SilhouettedColor;

			struct appdata 
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};
 
			struct v2f {
				float4 pos : POSITION;
				float4 color : COLOR;
			};
 
 			v2f vert(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);

				return o;	
			}

			half4 frag(v2f i) : COLOR 
			{
				return _SilhouettedColor;
			}
			ENDCG

			Stencil
			{
				Ref 1
				Comp Always
				Pass Replace
			}
		}

		Pass
		{
			Name "BASE"
			Blend SrcAlpha OneMinusSrcAlpha

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
				float4 final = lightingColor * tex;

				return final;
				
			}

			ENDCG

			Stencil
			{
				Ref 0
				Comp NotEqual
				Pass keep
			}
		}
	}
	FallBack "Diffuse"
}
