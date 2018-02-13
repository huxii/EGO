Shader "II/Dissolve" 
{

	// TODO : REFLECTION RIPPLE SPLASH SHADOW   
	Properties
	{
		[Header(Base)]
		_Color("Base Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_MainTex("Main Texture", 2D) = "white" {}

		[Header(Dissolve)]
		_DissolveSpeed("Dissolve Speed", float) = 1.0
		_EdgeSpeed("Edge Speed", float) = 1.0
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

			uniform float4 _Color;
			uniform sampler2D _MainTex;
			uniform float _DissolveSpeed;
			uniform float _EdgeSpeed;
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
				float4 tex = tex2D(_MainTex, i.tex.xy);
				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				
				float4 col = tex;
				float onEdge = step(noiseSample, _Time * _EdgeSpeed);
				col = onEdge * _EdgeColor + (1 - onEdge) * tex;
				clip(noiseSample - _Time * _DissolveSpeed);

				return col;
			}
			ENDCG
		}
	}
}
