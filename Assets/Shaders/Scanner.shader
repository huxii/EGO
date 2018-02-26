// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "II/Postprocess/Scanner" 
{
	Properties
	{
		_Timer("Timer", Range(0, 1.0)) = 0
		_Center("Center", Vector) = (0.0, 0.0, 0.0, 0.0)
		_MainTex("Main Texture", 2D) = "white" {}
		_EdgeWidth("Edge Width", float) = 1
		_EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_EdgeTex("Edge Texture", 2D) = "white" {}
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
			uniform float4 _Center;
			uniform sampler2D _MainTex;
			uniform float _EdgeWidth;
			uniform float4 _EdgeColor;
			uniform sampler2D _EdgeTex;
			uniform float4 _EdgeTex_ST;

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 posWorld : TEXCOORD0;
				float4 screenPos : TEXCOORD1;
			};

			//Vertex Shader
			vertexOutput vert (appdata_base v)
			{
			   vertexOutput o;
			   o.pos = UnityObjectToClipPos (v.vertex);
			   o.posWorld = mul(unity_ObjectToWorld, v.vertex);
			   o.screenPos = ComputeScreenPos(o.pos);
			   //for some reason, the y position of the depth texture comes out inverted
			   //o.scrPos.y = 1 - o.scrPos.y;
			   return o;
			}

			//Fragment Shader
			half4 frag (vertexOutput i) : COLOR
			{
				fixed4 color = tex2Dproj(_MainTex, i.screenPos);
				float depthValue = 1 - Linear01Depth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.screenPos / i.screenPos.w))).r;

				// too far
				if (depthValue < 0.1f)
				{
					return color;
				}

				// the screen center depth
				float4 centerObj = mul(unity_WorldToObject, _Center);
				float4 centerPos = UnityObjectToClipPos (centerObj);
				float4 centerScreen = ComputeScreenPos(centerPos);
				centerScreen /= centerScreen.w;
				float centerDepth = 1 - Linear01Depth(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(centerScreen))).r;
				centerDepth = pow(centerDepth, 4);
				//return float4(centerDepth, centerDepth, centerDepth,1);

				float verticalDepth = abs(depthValue - 0.5);
				float horizontalDepth = abs(i.screenPos.x / i.screenPos.w - 0.5);
				depthValue = pow(pow(verticalDepth, 0.5) + pow(horizontalDepth, 6), 0.5);
				float4 depth = float4(depthValue, depthValue, depthValue, 1);

				//return depth;

				if (depthValue > _Timer)
				{
					return color;
				}
				else
				if (depthValue > _Timer - _EdgeWidth / 10)
				{
					// change degree based on the vector from center to here
					float edgeRampValue = (depthValue - _Timer + _EdgeWidth / 10) / (_EdgeWidth / 10);
					float2 edgeCoord = float2(edgeRampValue, i.posWorld.x);
					float4 edgeRamp = tex2D(_EdgeTex, edgeCoord * _EdgeTex_ST.xy + _EdgeTex_ST.zw);
					if (edgeRamp.a == 0)
					{
						return color;
					}
					else
					{
						return edgeRamp * _EdgeColor;
					}
					//return float4(1.0, 0, 0, 1.0);
				}
				else
				{
					return color * 1.2f;	
				}
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}