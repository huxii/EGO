Shader "II/Cel_dissolve" 
{
	Properties
	{
        [KeywordEnum(KEEP, REPLACE, APPEAR, DISAPPEAR)] _ReplacementStyle("Replacement Style", Float) = 1
        _ReplacementTimer("Replacement Timer", Range(0,20.0)) = 0
        [Toggle]_ReplacementInverted("Replacement Inverted", float) = 0

        [Header(Style Light)]
        _ReplacementTex("Texture", 2D) = "white" {}
        [KeywordEnum(ALPHA,MULTIPLY, ADD)] _TextureBlendMode("Texture Blend Mode", float) = 0
        _TextureAlpha("Texture Alpha", Range(0,1)) = 0
        [HDR]_ReSpecColor("Specular", Color) = (1.0, 1.0, 1.0, 1.0)
        [HDR]_ReDiffuseColor("Diffuse", Color) = (0.5, 0.5, 0.5, 1.0)
        [HDR]_ReShadowColor("Shadow", Color) = (0.0, 0.0, 0.0, 1.0)

        [Header(Style Dark)]
        _MainTex("Texture", 2D) = "white" {}
        [HDR]_SpecColor("Specular", Color) = (0.6, 0.6, 0.6, 1.0)
        [HDR]_DiffuseColor("Diffuse", Color) = (0.2, 0.2, 0.2, 1.0)
        [HDR]_ShadowColor("Shadow", Color) = (0.0, 0.0, 0.0, 1.0)

        [Header(Threshold)]
        _ShadowThreshold("Shadow Threshold", Range(0,0.5)) = 0.3
        _SpecThreshold("Specular Threshold", Range(0.5,1)) = 0.85
        _SoftRange("Soft Range", Range(0,0.5)) = 0.05

		[Header(Outline)]
		[Toggle] _ColoredOutline("Colored Outline", Float) = 0 
		_OutlineColor("Outline Color", Color) = (0.0, 0.0, 0.0, 1.0)
		_OutlineThickness("Outline Thickness", Range(0, 0.5)) = 0

        [Header(Dissolve)]
        _DissolveTimer("Dissolve Timer", Range(0, 1.0)) = 0
        _EdgeSpeedRate("Edge Speed Rate", Range(0, 1.0)) = 0.8
        [HDR]_EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
        _NoiseTex("Noise Texture", 2D) = "white" {}
	}

	SubShader
	{	
		
		Pass
		{
			Name "AmbientLights"
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
                "RenderType" = "Opaque" 
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma exclude_renderers flash
			#pragma multi_compile_fwdbase
			#pragma multi_compile_fog

			#include "AutoLight.cginc"
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _ShadowColor;
            float4 _DiffuseColor;
            float4 _SpecColor;
            float _DissolveTimer;
            uniform float _EdgeSpeedRate;
            uniform float4 _EdgeColor;
            uniform sampler2D _NoiseTex;
            uniform float4 _NoiseTex_ST;
            uniform float _ReplacementStyle;
            uniform float _ReplacementTimer;
            uniform sampler2D _ReplacementTex;
            uniform float4 _ReplacementTex_ST;
			uniform float _ReplacementInverted;
            uniform float4 _ReShadowColor;
            uniform float4 _ReDiffuseColor;
            uniform float4 _ReSpecColor;
            uniform float _ShadowThreshold;
            uniform float _SpecThreshold;
            uniform float _SoftRange;
            uniform float _TextureAlpha;
            uniform float _TextureBlendMode;

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
				UNITY_FOG_COORDS(4)
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
				UNITY_TRANSFER_FOG(o, o.pos);

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

				float4 specColor;
				float4 diffuseColor;
				float4 shadowColor;
				float4 reSpecColor;
				float4 reDiffuseColor;
				float4 reShadowColor;

				if (!_ReplacementInverted)
				{
					specColor = _SpecColor;
					diffuseColor = _DiffuseColor;
					shadowColor = _ShadowColor;
					reSpecColor = _ReSpecColor;
					reDiffuseColor = _ReDiffuseColor;
					reShadowColor = _ReShadowColor;
				}
				else
				{					
					specColor = _ReSpecColor;
					diffuseColor = _ReDiffuseColor;
					shadowColor = _ReShadowColor;
					reSpecColor = _SpecColor;
					reDiffuseColor = _DiffuseColor;
					reShadowColor = _ShadowColor;
				}

				// tone lightings (diffuse only for now)
				float4 lightingColor;
				float4 reLightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
				if (ramp < _ShadowThreshold)
				{   
                    if(ramp > _ShadowThreshold-_SoftRange){
                        lightingColor = shadowColor * 0.75 + diffuseColor * 0.25;
                        reLightingColor = reShadowColor * 0.75 + reDiffuseColor * 0.25;
                    }else{
                        lightingColor = shadowColor;
                        reLightingColor = reShadowColor;
                    }

				}
				else
                if (ramp > _SpecThreshold)
                {   
                    if(ramp < _SpecThreshold + _SoftRange){
                        lightingColor = specColor * 0.75 + diffuseColor * 0.25;
                        reLightingColor = reSpecColor * 0.75 + reDiffuseColor * 0.25;
                    }else{
                        lightingColor = specColor;
                        reLightingColor = reSpecColor;
                    }
                }
				else
				{   
                    if(ramp < _ShadowThreshold + _SoftRange){
                        lightingColor = shadowColor * 0.25 + diffuseColor * 0.75;
                        reLightingColor = reShadowColor * 0.25 + reDiffuseColor * 0.75;
                    }else if(ramp > _SpecThreshold-_SoftRange){
                        lightingColor = specColor * 0.25 + diffuseColor * 0.75;
                        reLightingColor = reSpecColor * 0.25 + reDiffuseColor * 0.75;
                    }else{
                        reLightingColor = reDiffuseColor;
                        lightingColor =  diffuseColor;
                    }

				}

				float4 tex = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				float4 reTex = tex2D(_ReplacementTex, i.tex.xy * _ReplacementTex_ST.xy + _ReplacementTex_ST.zw);

				// replacement
				float4 col;
				float3 dir = i.posWorld - _Center.xyz;
				float dis = length(dir);
                    //by default set reTex
                if(_TextureBlendMode ==0){
                    col = reTex*_TextureAlpha + reLightingColor*(1-_TextureAlpha);
                }else if(_TextureBlendMode ==1){
                    col = (1-_TextureAlpha)+reTex*_TextureAlpha;
                    col = col*reLightingColor;
                    col.a = reLightingColor.a;
                }else if(_TextureBlendMode ==2){
                    col = reTex*_TextureAlpha + reLightingColor;
                }else{
                    col = reTex*_TextureAlpha + reLightingColor*(1-_TextureAlpha);
                }
                    //special cases
                if (_ReplacementStyle == 0){
                    //pass    
                }else if (_ReplacementStyle == 1){
					if (dis > _ReplacementTimer){
						if(_TextureBlendMode ==0){
                            col = tex*_TextureAlpha + lightingColor*(1-_TextureAlpha);
                        }else if(_TextureBlendMode ==1){
                           col = (1-_TextureAlpha)+tex*_TextureAlpha;
                           col = col*lightingColor;
                           col.a = lightingColor.a;
                        }else if(_TextureBlendMode ==2){
                            col = tex*_TextureAlpha + lightingColor;
                        }else{
                            col = tex*_TextureAlpha + lightingColor*(1-_TextureAlpha);
                        }
					}
				}else if (_ReplacementStyle == 3){
					if (dis <= _ReplacementTimer){
                        clip(-1);
                    }else{
                        col = (1-_TextureAlpha)+tex*_TextureAlpha;
                        col = col*lightingColor;
                        col.a = lightingColor.a;
                    }	
				}else{
					if (dis > _ReplacementTimer)
						clip(-1);
				}

				// dissolve
				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
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
		
        Pass
        {           			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma exclude_renderers flash
			#pragma multi_compile_fwdbase
			#pragma multi_compile_fog

			#include "AutoLight.cginc"
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float4 _ShadowColor;
            float4 _DiffuseColor;
            float4 _SpecColor;
            float _DissolveTimer;
            uniform float _EdgeSpeedRate;
            uniform float4 _EdgeColor;
            uniform sampler2D _NoiseTex;
            uniform float4 _NoiseTex_ST;
            uniform float _ReplacementStyle;
            uniform float _ReplacementTimer;
            uniform sampler2D _ReplacementTex;
            uniform float4 _ReplacementTex_ST;
			uniform float _ReplacementInverted;
            uniform float4 _ReShadowColor;
            uniform float4 _ReDiffuseColor;
            uniform float4 _ReSpecColor;
            uniform float _ShadowThreshold;
            uniform float _SpecThreshold;
            uniform float _SoftRange;
            uniform float _TextureAlpha;
            uniform float _TextureBlendMode;

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
				UNITY_FOG_COORDS(4)
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
				UNITY_TRANSFER_FOG(o, o.pos);

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

				float4 specColor;
				float4 diffuseColor;
				float4 shadowColor;
				float4 reSpecColor;
				float4 reDiffuseColor;
				float4 reShadowColor;

				if (!_ReplacementInverted)
				{
					specColor = _SpecColor;
					diffuseColor = _DiffuseColor;
					shadowColor = _ShadowColor;
					reSpecColor = _ReSpecColor;
					reDiffuseColor = _ReDiffuseColor;
					reShadowColor = _ReShadowColor;
				}
				else
				{					
					specColor = _ReSpecColor;
					diffuseColor = _ReDiffuseColor;
					shadowColor = _ReShadowColor;
					reSpecColor = _SpecColor;
					reDiffuseColor = _DiffuseColor;
					reShadowColor = _ShadowColor;
				}

				// tone lightings (diffuse only for now)
				float4 lightingColor;
				float4 reLightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
				if (ramp < _ShadowThreshold)
				{   
                    if(ramp > _ShadowThreshold-_SoftRange){
                        lightingColor = shadowColor * 0.75 + diffuseColor * 0.25;
                        reLightingColor = reShadowColor * 0.75 + reDiffuseColor * 0.25;
                    }else{
                        lightingColor = shadowColor;
                        reLightingColor = reShadowColor;
                    }

				}
				else
                if (ramp > _SpecThreshold)
                {   
                    if(ramp < _SpecThreshold + _SoftRange){
                        lightingColor = specColor * 0.75 + diffuseColor * 0.25;
                        reLightingColor = reSpecColor * 0.75 + reDiffuseColor * 0.25;
                    }else{
                        lightingColor = specColor;
                        reLightingColor = reSpecColor;
                    }
                }
				else
				{   
                    if(ramp < _ShadowThreshold + _SoftRange){
                        lightingColor = shadowColor * 0.25 + diffuseColor * 0.75;
                        reLightingColor = reShadowColor * 0.25 + reDiffuseColor * 0.75;
                    }else if(ramp > _SpecThreshold-_SoftRange){
                        lightingColor = specColor * 0.25 + diffuseColor * 0.75;
                        reLightingColor = reSpecColor * 0.25 + reDiffuseColor * 0.75;
                    }else{
                        reLightingColor = reDiffuseColor;
                        lightingColor =  diffuseColor;
                    }

				}

				lightingColor *= atten;
				reLightingColor *= atten;

				float4 tex = tex2D(_MainTex, i.tex.xy * _MainTex_ST.xy + _MainTex_ST.zw);
				float4 reTex = tex2D(_ReplacementTex, i.tex.xy * _ReplacementTex_ST.xy + _ReplacementTex_ST.zw);

				// replacement
				float4 col;
				float3 dir = i.posWorld - _Center.xyz;
				float dis = length(dir);
                    //by default set reTex
                if(_TextureBlendMode ==0){
                    col = reTex*_TextureAlpha + reLightingColor*(1-_TextureAlpha);
                }else if(_TextureBlendMode ==1){
                    col = (1-_TextureAlpha)+reTex*_TextureAlpha;
                    col = col*reLightingColor;
                    col.a = reLightingColor.a;
                }else if(_TextureBlendMode ==2){
                    col = reTex*_TextureAlpha + reLightingColor;
                }else{
                    col = reTex*_TextureAlpha + reLightingColor*(1-_TextureAlpha);
                }
                    //special cases
                if (_ReplacementStyle == 0){
                    //pass    
                }else if (_ReplacementStyle == 1){
					if (dis > _ReplacementTimer){
						if(_TextureBlendMode ==0){
                            col = tex*_TextureAlpha + lightingColor*(1-_TextureAlpha);
                        }else if(_TextureBlendMode ==1){
                           col = (1-_TextureAlpha)+tex*_TextureAlpha;
                           col = col*lightingColor;
                           col.a = lightingColor.a;
                        }else if(_TextureBlendMode ==2){
                            col = tex*_TextureAlpha + lightingColor;
                        }else{
                            col = tex*_TextureAlpha + lightingColor*(1-_TextureAlpha);
                        }
					}
				}else if (_ReplacementStyle == 3){
					if (dis <= _ReplacementTimer){
                        clip(-1);
                    }else{
                        col = (1-_TextureAlpha)+tex*_TextureAlpha;
                        col = col*lightingColor;
                        col.a = lightingColor.a;
                    }	
				}else{
					if (dis > _ReplacementTimer)
						clip(-1);
				}

				// dissolve
				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG
        }
		
		/*
		Pass
		{
			Name "Outline"
			Tags {"LightMode" = "ForwardBase"}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma exclude_renderers flash

			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform bool _ColoredOutline;
			uniform float4 _OutlineColor;
			uniform float _OutlineThickness;

			struct vertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 texColor : TEXCOORD0;
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;

				// scale up the whole mesh
				float4 newPos = v.vertex;
				float3 normal = normalize(v.vertex);
				newPos += float4(normal, 0.0) * _OutlineThickness;

				o.pos = UnityObjectToClipPos(newPos);
				o.texColor = tex2Dlod(_MainTex, float4(v.texcoord.xy, 0, 0));

				return o;	
			}

			float4 frag(vertexOutput i) : COLOR
			{
				float4 col;
				if (_ColoredOutline)
				{
					col = i.texColor * _OutlineColor;
				}
				else
				{
					col = _OutlineColor;
				}

				return col;
			}

			ENDCG

			//Cull OFF
			//ZWrite OFF
			ZTest ON
			Stencil
			{
				Ref 4
				Comp notequal
				Fail keep
				Pass replace
			}
		}
		*/
	}
	Fallback "Diffuse"
}
