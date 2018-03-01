Shader "II/Cel_dissolve" 
{

	// TODO : REFLECTION RIPPLE SPLASH SHADOW   
	Properties
	{
        [KeywordEnum(KEEP, REPLACE, APPEAR, DISAPPEAR)] _ReplacementStyle("Replacement Style", Float) = 1
        _ReplacementTimer("Replacement Timer", Range(0,10.0)) = 0
         
        [Header(Style Light)]
        _ReplacementTex("Texture", 2D) = "white" {}
        [KeywordEnum(ALPHA,MULTIPLY, ADD)] _TextureBlendMode("Texture Blend Mode", float) = 0
        _TextureAlpha("Texture Alpha", Range(0,1)) = 0
        _ReSpecColor("Specular", Color) = (1.0, 1.0, 1.0, 1.0)
        _ReDiffuseColor("Diffuse", Color) = (0.5, 0.5, 0.5, 1.0)
        _ReShadowColor("Shadow", Color) = (0.0, 0.0, 0.0, 1.0)

        [Header(Style Dark)]
        _MainTex("Texture", 2D) = "white" {}
        _SpecColor("Specular", Color) = (0.6, 0.6, 0.6, 1.0)
        _DiffuseColor("Diffuse", Color) = (0.2, 0.2, 0.2, 1.0)
        _ShadowColor("Shadow", Color) = (0.0, 0.0, 0.0, 1.0)

        [Header(Threshold)]
        _ShadowThreshold("Shadow Threshold", Range(0,0.5)) = 0.3
        _SpecThreshold("Specular Threshold", Range(0.5,1)) = 0.85
        _SoftRange("Soft Range", Range(0,0.5)) = 0.05

        [Header(Dissolve)]
        _DissolveTimer("Dissolve Timer", Range(0, 1.0)) = 0
        _EdgeSpeedRate("Edge Speed Rate", Range(0, 1.0)) = 0.8
        _EdgeColor("Edge Color", Color) = (1.0, 1.0, 1.0, 1.0)
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

				// tone lightings (diffuse only for now)
				float4 lightingColor;
				float4 reLightingColor;
				float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
				if (ramp < _ShadowThreshold)
				{   
                    if(ramp>_ShadowThreshold-_SoftRange){
                        lightingColor = _ShadowColor*0.75+_DiffuseColor*0.25;
                        reLightingColor = _ReShadowColor*0.75+_ReDiffuseColor*0.25;;
                    }else{
                        lightingColor = _ShadowColor;
                        reLightingColor =_ReShadowColor;
                    }

				}
				else
                if (ramp > _SpecThreshold)
                {   
                    if(ramp<_SpecThreshold+_SoftRange){
                        lightingColor = _SpecColor*0.75+_DiffuseColor*0.25;
                        reLightingColor =_ReSpecColor*0.75+_ReDiffuseColor*0.25;
                    }else{
                        lightingColor = _SpecColor;
                        reLightingColor = _ReSpecColor;
                    }
                }
				else
				{   
                    if(ramp<_ShadowThreshold+_SoftRange){
                        lightingColor = _ShadowColor*0.25+_DiffuseColor*0.75;
                        reLightingColor =_ReShadowColor*0.25+_ReDiffuseColor*0.75;
                    }else if(ramp>_SpecThreshold-_SoftRange){
                        lightingColor = _SpecColor*0.25+_DiffuseColor*0.75;
                        reLightingColor =_ReSpecColor*0.25+_ReDiffuseColor*0.75;
                    }else{
                        reLightingColor = _ReDiffuseColor;
                        lightingColor =  _DiffuseColor;
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
				if (_ReplacementStyle == 1){
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
					if (dis <= _ReplacementTimer)
						clip(-1);
				}else{
					if (dis > _ReplacementTimer)
						clip(-1);
				}

				// dissolve
				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
				col = onEdge * _EdgeColor + (1 - onEdge) * col;
				clip(noiseSample - _DissolveTimer);

				return col;
			}
			ENDCG
		}
		
        Pass
        {           
            Name "OtherLights"
            Tags 
            { 
                "LightMode" = "ForwardAdd"
                "RenderType" = "Opaque"  
            }
            Blend One One
           
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdadd

            #include "AutoLight.cginc"
            #include "UnityCG.cginc"

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
            uniform float4 _ReShadowColor;
            uniform float4 _ReDiffuseColor;
            uniform float4 _ReSpecColor;
            uniform float _ShadowThreshold;
            uniform float _SpecThreshold;
            uniform float _SoftRange;
            uniform float _TextureAlpha;
            uniform float _TextureBlendMode;

            sampler2D _CameraDepthTexture;
            

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
                float atten = LIGHT_ATTENUATION(i);
                // Directional light
                if (_WorldSpaceLightPos0.w == 0.0)
                {
                    //atten = 1.0;
                    lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                }
                // Point light
                else
                {
                    float3 fragmentToLightSource = _WorldSpaceLightPos0.xyz - i.posWorld.xyz;
                    float distance = length(fragmentToLightSource);
                    //atten = 1.0 / distance;
                    lightDirection = normalize(fragmentToLightSource);
                }
                
                // tone lightings (diffuse only for now)
                float4 lightingColor;
                float4 reLightingColor;
                float ramp = clamp(dot(normalDirection, lightDirection), 0, 1.0) * atten;
                if (ramp < _ShadowThreshold)
                {   
                    if(ramp>_ShadowThreshold-_SoftRange){
                        lightingColor = _ShadowColor*0.75+_DiffuseColor*0.25;
                        reLightingColor = _ReShadowColor*0.75+_ReDiffuseColor*0.25;;
                    }else{
                        lightingColor = _ShadowColor;
                        reLightingColor =_ReShadowColor;
                    }

                }
                else
                if (ramp > _SpecThreshold)
                {   
                    if(ramp<_SpecThreshold+_SoftRange){
                        lightingColor = _SpecColor*0.75+_DiffuseColor*0.25;
                        reLightingColor =_ReSpecColor*0.75+_ReDiffuseColor*0.25;
                    }else{
                        lightingColor = _SpecColor;
                        reLightingColor = _ReSpecColor;
                    }
                }
                else
                {   
                    if(ramp<_ShadowThreshold+_SoftRange){
                        lightingColor = _ShadowColor*0.25+_DiffuseColor*0.75;
                        reLightingColor =_ReShadowColor*0.25+_ReDiffuseColor*0.75;
                    }else if(ramp>_SpecThreshold-_SoftRange){
                        lightingColor = _SpecColor*0.25+_DiffuseColor*0.75;
                        reLightingColor =_ReSpecColor*0.25+_ReDiffuseColor*0.75;
                    }else{
                        reLightingColor = _ReDiffuseColor;
                        lightingColor =  _DiffuseColor;
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
                if (_ReplacementStyle == 1){
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
                    if (dis <= _ReplacementTimer)
                        clip(-1);
                }else{
                    if (dis > _ReplacementTimer)
                        clip(-1);
                }

                // dissolve
                float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
                float onEdge = step(noiseSample, _DissolveTimer / _EdgeSpeedRate);
                col = onEdge * _EdgeColor + (1 - onEdge) * col;
                clip(noiseSample - _DissolveTimer);

                return col;
            }
            ENDCG
        }
		
	}
	Fallback "Diffuse"
}
