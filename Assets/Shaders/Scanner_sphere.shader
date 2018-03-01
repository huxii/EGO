// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "II/Postprocess/Scanner_sphere" 
{
	Properties
	{
		_Timer("Timer", Range(0, 1.0)) = 0
		_Range("Range", float) = 1
		_Center("Center", Vector) = (0.0, 0.0, 0.0, 0.0)
		_MainTex("Main Texture", 2D) = "white" {}
		_EdgeWidth("Edge Width", float) = 1
		_EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_EdgeTex("Edge Texture", 2D) = "white" {}
		_InnerTex("Inner Texture", 2D) = "white" {}
		_EdgeInnerBlur("Edge Inner Blur", float) = 1
		_EdgeOutterBlur("Edge Outter Blur", float) = 1
	}

	SubShader 
	{
		Tags 
		{ 
			"RenderType" = "Transparent" 
		}

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;

			uniform float _Timer;
			uniform float _Range;
			uniform float4 _Center;
			uniform sampler2D _MainTex;
			uniform float _EdgeWidth;
			uniform float4 _EdgeColor;
			uniform sampler2D _EdgeTex;
			uniform float4 _EdgeTex_ST;
			uniform sampler2D _InnerTex;
			uniform float4 _InnerTex_ST;
			uniform float _EdgeInnerBlur;
			uniform float _EdgeOutterBlur;

			float4x4 _ClipToWorld;

			struct vertexInput
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 dirWorld : TEXCOORD0;
				float4 screenPos : TEXCOORD1;
				float2 uv : TEXCOORD2;
			};

			//Vertex Shader
			vertexOutput vert (vertexInput v)
			{
				vertexOutput o;
				o.pos = UnityObjectToClipPos (v.vertex);
				o.uv = v.uv;
				o.screenPos = ComputeScreenPos(o.pos);
			   
				float4 clip = float4(o.pos.xy, 0.0, 1.0);
				o.dirWorld = float4(mul(_ClipToWorld, clip) - _WorldSpaceCameraPos, 0);

				return o;
			}

			//Fragment Shader
			half4 frag (vertexOutput i) : COLOR
			{
				float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv.xy);
				depth = LinearEyeDepth(depth);
				float3 worldspace = i.dirWorld * depth + _WorldSpaceCameraPos;

				fixed4 color = tex2Dproj(_MainTex, i.screenPos);
				float3 dir = worldspace - _Center.xyz;
				float dis = length(dir);
				if (dis < _Timer * _Range + _EdgeWidth / 2)
				{
					if (dis < _Timer * _Range - _EdgeWidth / 2)
					{
						fixed4 innerTex = tex2D(_InnerTex, i.uv.xy * _InnerTex_ST.xy + _InnerTex_ST.zw);
						return color * innerTex;
					}
					else
					{
						float relativeEdgePos = dis - _Timer * _Range;
						float onEdge = 1 - (abs(relativeEdgePos)) / (_EdgeWidth / 2);
						if (relativeEdgePos < 0)
						{
							onEdge = pow(onEdge, _EdgeInnerBlur);
						}
						else
						{
							onEdge = pow(onEdge, _EdgeOutterBlur);
						}

						fixed4 edgeTex = tex2D(_EdgeTex, i.uv.xy * _EdgeTex_ST.xy + _EdgeTex_ST.zw);
						float4 edgeColor = lerp(color, _EdgeColor * edgeTex, onEdge);
						return edgeColor;
					}
				}
				else
				{
					return color;
				}
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}