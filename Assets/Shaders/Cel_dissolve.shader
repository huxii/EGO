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
		_DissolveTimer("Dissolve Timer", Range(0, 1.0)) = 0
		_EdgeSpeedRate("Edge Speed Rate", Range(0, 1.0)) = 0.8
		_EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_NoiseTex("Noise Texture", 2D) = "white" {}

		[Header(Replacement)]
		[KeywordEnum(KEEP, REPLACE, APPEAR, DISAPPEAR)] _ReplacementStyle("Replacement Style", Float) = 0
		_ReplacementTimer("Replacement Timer", float) = 0
		_ReplacementTex("Replacement Texture", 2D) = "white" {}
		_ReShadowColor("Replacement Shadow Color", Color) = (0.0, 0.0, 0.0, 1.0)
		_ReSpecColor("Replacement Specular Color", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader
	{	
		Pass
		{
			LOD 200
			//Cull Off

			//Blend SrcAlpha OneMinusSrcAlpha
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
			uniform float4 _MainTex_ST;
			uniform float4 _ShadowColor;
			uniform float4 _SpecColor;
			uniform float _DissolveTimer;
			uniform float _EdgeSpeedRate;
			uniform float4 _EdgeColor;
			uniform sampler2D _NoiseTex;
			uniform float4 _NoiseTex_ST;
			uniform float _ReplacementStyle;
			uniform float _ReplacementTimer;
			uniform sampler2D _ReplacementTex;
			uniform float4 _ReplacementTex_ST;
			uniform float4 _ReShadowColor;
			uniform float4 _ReSpecColor;

			float4 _Center;

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
				LIGHTING_COORDS(5, 6)
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.tex = v.texcoord;
				o.normalDir = normalize( mul(float4(v.normal, 0.0f), unity_WorldToObject).xyz );	
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);

				o.screenPos = ComputeScreenPos(o.pos);
				TRANSFER_VERTEX_TO_FRAGMENT(o);

				return o;	
			}

			float4 frag(vertexOutput i) : COLOR
			{
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
				float3 normalDirection = i.normalDir;
				float3 lightDirection;
				float atten;

				// Directional light
				if (_WorldSpaceLightPos0.w == 0.0)
				{
					atten = 1.0;
					lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				}
				// Point light
				else
				{
					float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
					float distance = length(fragmentToLightSource);
					atten = 1.0 / distance;
					lightDirection = normalize(fragmentToLightSource);
				}

				float4 lightingColor;
				float4 reLightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
				if (ramp == 0.0)
				{
					lightingColor = _ShadowColor;	
					reLightingColor = _ReShadowColor;
				}
				else
				if (ramp < 0.5)
				{
					lightingColor = _SpecColor * 0.25 + _ShadowColor * 0.75;
					reLightingColor = _ReSpecColor * 0.25 + _ReShadowColor * 0.75;
				}
				else
				if (ramp < 1.0)
				{
					lightingColor =  _SpecColor * 0.75 + _ShadowColor * 0.25;
					reLightingColor = _ReSpecColor * 0.75 + _ReShadowColor * 0.25;
				}
				else
				{
					reLightingColor = _ReSpecColor;
				}

				float4 tex = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				float4 reTex = tex2D(_ReplacementTex, i.tex.xy * _ReplacementTex_ST.xy + _ReplacementTex_ST.zw);

				float4 col;
				float3 dir = i.posWorld - _Center.xyz;
				float dis = length(dir);

				if (_ReplacementStyle == 0)
				{
					col = tex * lightingColor;
				}
				else
				if (_ReplacementStyle == 1)
				{
					if (dis > _ReplacementTimer)
					{
						col = tex * lightingColor;
					}
					else
					{
						col = reTex * reLightingColor;
					}
				}
				else
				if (_ReplacementStyle == 3)
				{
					if (dis > _ReplacementTimer)
					{
						col = tex * lightingColor;
					}
					else
					{
						clip(-1);
					}
				}
				else
				{
					if (dis > _ReplacementTimer)
					{
						clip(-1);
					}
					else
					{
						col = tex * lightingColor;
					}
				}

				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				return col;
			}
			ENDCG
		}
		/*
		Pass
		{
			//LOD 200
			//Cull Off

			//Blend SrcAlpha OneMinusSrcAlpha
			Lighting On
			Blend One One
			Tags 
			{ 
				//"Queue" = "AlphaTest"   // Transparent cant receive shadow
				//"RenderType" = "Transparent" 
				//"IgnoreProjector"="True"
				"LightMode" = "ForwardAdd" 
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "AutoLight.cginc"
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _ShadowColor;
			uniform float4 _SpecColor;
			uniform float _DissolveTimer;
			uniform float _EdgeSpeedRate;
			uniform float4 _EdgeColor;
			uniform sampler2D _NoiseTex;
			uniform float4 _NoiseTex_ST;
			uniform float _ReplacementStyle;
			uniform float _ReplacementTimer;
			uniform sampler2D _ReplacementTex;
			uniform float4 _ReplacementTex_ST;
			uniform float4 _ReShadowColor;
			uniform float4 _ReSpecColor;

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
				float atten;
				// Directional light
				if (_WorldSpaceLightPos0.w == 0.0)
				{
					atten = 1.0;
					lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				}
				// Point light
				else
				{
					float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
					float distance = length(fragmentToLightSource);
					//atten = 1.0 / distance;
					atten = 0.1;
					lightDirection = normalize(fragmentToLightSource);
				}atten = LIGHT_ATTENUATION(i);
				return float4(atten, atten, atten, 0);
				//float atten = LIGHT_ATTENUATION(i);
				float4 lightingColor;
				float4 reLightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
				
				if (ramp == 0.0)
				{
					lightingColor = _ShadowColor;	
					reLightingColor = _ReShadowColor;
				}
				else
				if (ramp < 0.5)
				{
					lightingColor = _SpecColor * 0.25 + _ShadowColor * 0.75;
					reLightingColor = _ReSpecColor * 0.25 + _ReShadowColor * 0.75;
				}
				else
				if (ramp < 1.0)
				{
					lightingColor =  _SpecColor * 0.75 + _ShadowColor * 0.25;
					reLightingColor = _ReSpecColor * 0.75 + _ReShadowColor * 0.25;
				}
				else
				{
					reLightingColor = _ReSpecColor;
				}

				float4 tex = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				float4 reTex = tex2D(_ReplacementTex, i.tex.xy * _ReplacementTex_ST.xy + _ReplacementTex_ST.zw);

				float depthValue = 1 - Linear01Depth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.screenPos / i.screenPos.w))).r;

				// the screen center depth
				float verticalDepth = abs(depthValue - 0.5f);
				float horizontalDepth = abs(i.screenPos.x / i.screenPos.w - 0.5);
				depthValue = pow(pow(verticalDepth, 0.5) + pow(horizontalDepth, 6), 0.5);
				float4 depth = float4(depthValue, depthValue, depthValue, 1);

				float4 col;

				if (_ReplacementStyle == 0)
				{
					col = tex * lightingColor;
				}
				else
				if (_ReplacementStyle == 1)
				{
					if (depthValue > _ReplacementTimer)
					{
						col = tex * lightingColor;
					}
					else
					{
						col = reTex * reLightingColor;
					}
				}
				else
				if (_ReplacementStyle == 3)
				{
					if (depthValue > _ReplacementTimer)
					{
						col = tex * lightingColor;
					}
					else
					{
						clip(-1);
					}
				}
				else
				{
					if (depthValue > _ReplacementTimer)
					{
						clip(-1);
					}
					else
					{
						col = tex * lightingColor;
					}
				}

				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				return col;
			}
			ENDCG
		}
		*/
	}
	Fallback "Diffuse"
}
