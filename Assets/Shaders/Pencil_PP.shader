Shader "II/Postprocess/Pencil" 
{ 
	Properties
	{
		_Color("Base Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_LineColor("Line Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_MainTex("Main Texture", 2D) = "white" {}
		_AngleStep("Angle Step", int) = 4
		_Range("Range", float) = 1.0
		_RangeStep("Range Step", int) = 10
		_GradientThreshold("Gradient Threshold", range(0.000001, 0.01)) = 0.01
		_ColorThreshold("Color Threshold", range(0.0, 1)) = 0.5
		_Sensitivity("Sensitivity", float) = 10
	}

	SubShader
	{			
		Tags { "RenderType" ="Opaque" }
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "AutoLight.cginc"
			#include "UnityCG.cginc"

			uniform float4 _Color;
			uniform float4 _LineColor;
			uniform sampler2D _MainTex;
			uniform int _AngleStep;
			uniform float _Range;
			uniform int _RangeStep;
			uniform float _GradientThreshold;
			uniform float _ColorThreshold;
			uniform float _Sensitivity;
			
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
				float4 screenCoord : TEXCOORD1;
				float4 tex : TEXCOORD2;
				float3 normalDir : TEXCOORD3;
			};

			float2 Rotate(float2 f, float deg)
			{
				float angle = deg / 180 * 3.1415926;
				float cosAngle = cos(angle);
				float sinAngle = sin(angle);
				float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);

				return mul(rot, f);
			}

			float4 GetColorSample(float2 screenPos)
			{
				return tex2Dlod(_MainTex, float4(screenPos / _ScreenParams.xy, 0, 0));
			}

			float GetValue(float2 screenPos)
			{
				float4 col = GetColorSample(screenPos);
				return dot(col.xyz, float3(0.2126, 0.7152, 0.0722));
			}

			float2 GetGrad(float2 screenPos, float delta)
			{
				float2 d = float2(delta, 0);
				float col0 = GetValue(screenPos + d.xy);
				float col1 = GetValue(screenPos - d.xy);
				float col2 = GetValue(screenPos + d.yx);
				float col3 = GetValue(screenPos - d.yx);
				return float2((col0 - col1), (col2 - col3)) / (2 * delta);
			}

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				o.tex = v.texcoord;
				o.normalDir = normalize( mul(float4(v.normal, 0.0f), unity_WorldToObject).xyz );	
				o.screenCoord = ComputeScreenPos(o.pos);

				return o;	
			}

			float4 frag(vertexOutput i) : COLOR
			{
				float2 screenPos = float2(i.screenCoord.x * _ScreenParams.x, i.screenCoord.y * _ScreenParams.y);
				float rangeInterval = 2 * _Range / _RangeStep;
				float weight = 0;
				
				for (int k = 0; k < _AngleStep; ++k)
				{
					float angle = k * 180.0 / _AngleStep;
					float2 dir = Rotate(float2(1, 0), angle);
					float2 grad = float2(-dir.y, dir.x);
					dir = normalize(dir);

					float range = -_Range;
					for (int j = 0; j < _RangeStep; ++j)
					{
						float2 newScreenPos = screenPos + range * dir;
						range += rangeInterval;
						
						if (newScreenPos.x > _ScreenParams.x || newScreenPos.x < 0 || newScreenPos.y > _ScreenParams.y || newScreenPos.y < 0)
						{
							continue;
						}
					
						float delta = 1.0;
						float2 newGrad = GetGrad(newScreenPos, delta);
						if (dot(newGrad, newGrad) < _GradientThreshold * _GradientThreshold)
						{
							continue;
						}

						float sense = pow( abs(dot(normalize(newGrad), normalize(grad))), _Sensitivity);
						weight += sense / (_AngleStep * _RangeStep);
					}
				}
				
				float4 col = GetColorSample(screenPos);
				col = lerp(col, float4(1.0, 1.0, 1.0, 1.0), _ColorThreshold);

				return lerp(col, _LineColor, weight);
			}
			ENDCG
		}

	}
	//FallBack Off
}
