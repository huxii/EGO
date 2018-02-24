Shader "II/Cel_dissolve" 
{

	// TODO : REFLECTION RIPPLE SPLASH SHADOW   
	Properties
	{
		[Header(Base)]
		_MainTex("Main Texture", 2D) = "white" {}
		_ShadowColor("Shadow Color", Color) = (0.0, 0.0, 0.0, 1.0)
		_SpecColor("Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)

		[Header(Dissolve)]
		_DissolveTimer("Dissolve Timer", float) = 0
		_EdgeSpeedRate("Edge Speed Rate", Range(0, 1.0)) = 0.8
		_EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_NoiseTex("Noise Texture", 2D) = "white" {}
	}

	SubShader
	{	
		Pass
		{
			LOD 200
			//Cull Off

			Blend SrcAlpha OneMinusSrcAlpha
			Lighting On
			Tags 
			{ 
				//"Queue" = "AlphaTest"   // Transparent cant receive shadow
				//"RenderType" = "Transparent" 
				//"IgnoreProjector"="True"
				"LightMode" = "ForwardBase" 
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma exclude_renderers flash
			#pragma multi_compile_fwdbase

			#include "AutoLight.cginc"
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;

			uniform sampler2D _MainTex;
			uniform float4 _ShadowColor;
			uniform float4 _SpecColor;
			uniform float _DissolveTimer;
			uniform float _EdgeSpeedRate;
			uniform float4 _EdgeColor;
			uniform sampler2D _NoiseTex;
			uniform float4 _NoiseTex_ST;

			struct vertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD1;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 posWorld : TEXCOORD0;
				float4 screenPos : TEXCOORD1;
				float4 tex : TEXCOORD2;
				float3 normalDir : TEXCOORD3;
				LIGHTING_COORDS(4, 5)
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				o.tex = v.texcoord;
				o.normalDir = normalize( mul(float4(v.normal, 0.0f), unity_WorldToObject).xyz );	

				o.screenPos = ComputeScreenPos(o.pos);
				TRANSFER_VERTEX_TO_FRAGMENT(o);

				return o;	
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

				float4 tex = tex2D(_MainTex, i.tex.xy);
				float4 col = tex * lightingColor;

				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				return col;
			}
			ENDCG
		}
	}
}
