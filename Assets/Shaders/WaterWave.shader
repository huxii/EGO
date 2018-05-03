// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33852,y:32688,varname:node_4013,prsc:2|diff-7225-OUT,transm-9350-OUT,lwrap-9350-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33331,y:32687,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4,c2:0.6,c3:0.8,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1450,x:32157,y:32684,varname:_Noise_copy,prsc:2,tex:565fc40206fc2fe4e9b677b33cea5ce4,ntxv:0,isnm:False|UVIN-5251-OUT,TEX-681-TEX;n:type:ShaderForge.SFN_Tex2d,id:2314,x:32157,y:32890,varname:_Noise_copy_copy,prsc:2,tex:565fc40206fc2fe4e9b677b33cea5ce4,ntxv:0,isnm:False|UVIN-8221-OUT,TEX-681-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:681,x:31953,y:32789,ptovrint:False,ptlb:Noise,ptin:_Noise,varname:node_681,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:565fc40206fc2fe4e9b677b33cea5ce4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:6119,x:31391,y:32950,ptovrint:False,ptlb:U Speed 1,ptin:_USpeed1,varname:node_1769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.25;n:type:ShaderForge.SFN_ValueProperty,id:4063,x:31391,y:33038,ptovrint:False,ptlb:V Speed 1,ptin:_VSpeed1,varname:_USpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.2;n:type:ShaderForge.SFN_Multiply,id:4278,x:31772,y:32980,varname:node_4278,prsc:2|A-844-OUT,B-8823-T;n:type:ShaderForge.SFN_Time,id:8823,x:31559,y:33131,varname:node_8823,prsc:2;n:type:ShaderForge.SFN_Add,id:5251,x:31947,y:32980,varname:node_5251,prsc:2|A-4278-OUT,B-7415-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7415,x:31780,y:33121,varname:node_7415,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_ValueProperty,id:1527,x:31391,y:33398,ptovrint:False,ptlb:V Speed 2,ptin:_VSpeed2,varname:_VSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-0.3;n:type:ShaderForge.SFN_Append,id:8331,x:31559,y:33340,varname:node_8331,prsc:2|A-7959-OUT,B-1527-OUT;n:type:ShaderForge.SFN_Multiply,id:7164,x:31772,y:33340,varname:node_7164,prsc:2|A-8331-OUT,B-8823-T;n:type:ShaderForge.SFN_Add,id:8221,x:31980,y:33340,varname:node_8221,prsc:2|A-7164-OUT,B-7415-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2629,x:32519,y:32710,varname:node_2629,prsc:2|A-1450-R,B-2314-G;n:type:ShaderForge.SFN_Append,id:844,x:31559,y:32980,varname:node_844,prsc:2|A-6119-OUT,B-4063-OUT;n:type:ShaderForge.SFN_RemapRange,id:7897,x:32746,y:32710,varname:node_7897,prsc:2,frmn:0,frmx:0.3,tomn:-1,tomx:1|IN-2629-OUT;n:type:ShaderForge.SFN_Add,id:7225,x:33630,y:32687,varname:node_7225,prsc:2|A-1304-RGB,B-9488-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7959,x:31391,y:33287,ptovrint:False,ptlb:U Speed 2,ptin:_USpeed2,varname:node_7959,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_OneMinus,id:4432,x:32258,y:33118,varname:node_4432,prsc:2|IN-7415-V;n:type:ShaderForge.SFN_Power,id:9011,x:32469,y:33118,varname:node_9011,prsc:2|VAL-4432-OUT,EXP-3351-OUT;n:type:ShaderForge.SFN_Vector1,id:3351,x:32232,y:33286,varname:node_3351,prsc:2,v1:1.4;n:type:ShaderForge.SFN_Multiply,id:412,x:32683,y:33118,varname:node_412,prsc:2|A-9011-OUT,B-4184-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4184,x:32469,y:33286,ptovrint:False,ptlb:Center Glow,ptin:_CenterGlow,varname:node_4184,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Multiply,id:9449,x:32902,y:32878,varname:node_9449,prsc:2|A-7897-OUT,B-412-OUT;n:type:ShaderForge.SFN_Clamp01,id:9488,x:33096,y:32878,varname:node_9488,prsc:2|IN-9449-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9350,x:33605,y:32926,ptovrint:False,ptlb:Light,ptin:_Light,varname:node_9350,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.95;proporder:1304-681-6119-4063-1527-7959-4184-9350;pass:END;sub:END;*/

Shader "II/WaterWave" {
    Properties {
        _Color ("Color", Color) = (0.4,0.6,0.8,1)
        _Noise ("Noise", 2D) = "white" {}
        _USpeed1 ("U Speed 1", Float ) = -0.25
        _VSpeed1 ("V Speed 1", Float ) = -0.2
        _VSpeed2 ("V Speed 2", Float ) = -0.3
        _USpeed2 ("U Speed 2", Float ) = 0.1
        _CenterGlow ("Center Glow", Float ) = 3
		_CenterFallOff ("Center Falloff", Float) = 1.4
        _Light ("Light", Float ) = 0.95
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog

            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float _USpeed1;
            uniform float _VSpeed1;
            uniform float _VSpeed2;
            uniform float _USpeed2;
			uniform float _CenterGlow;
            uniform float _CenterFallOff;
            uniform float _Light;
			half _Cutoff;

            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 w = float3(_Light,_Light,_Light)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(_Light,_Light,_Light);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 node_8823 = _Time;
                float2 node_5251 = ((float2(_USpeed1,_VSpeed1)*node_8823.g)+i.uv0);
                float4 _Noise_copy = tex2D(_Noise,TRANSFORM_TEX(node_5251, _Noise));
                float2 node_8221 = ((float2(_USpeed2,_VSpeed2)*node_8823.g)+i.uv0);
                float4 _Noise_copy_copy = tex2D(_Noise,TRANSFORM_TEX(node_8221, _Noise));
                float3 diffuseColor = (_Color.rgb+saturate((((_Noise_copy.r*_Noise_copy_copy.g)*6.666667+-1.0)*(pow((1.0 - i.uv0.g),_CenterFallOff)*_CenterGlow))));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
				clip(diffuseColor.r - _Cutoff);
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
		/*
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog

            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float _USpeed1;
            uniform float _VSpeed1;
            uniform float _VSpeed2;
            uniform float _USpeed2;
            uniform float _CenterGlow;
            uniform float _Light;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 w = float3(_Light,_Light,_Light)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * float3(_Light,_Light,_Light);
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float4 node_8823 = _Time;
                float2 node_5251 = ((float2(_USpeed1,_VSpeed1)*node_8823.g)+i.uv0);
                float4 _Noise_copy = tex2D(_Noise,TRANSFORM_TEX(node_5251, _Noise));
                float2 node_8221 = ((float2(_USpeed2,_VSpeed2)*node_8823.g)+i.uv0);
                float4 _Noise_copy_copy = tex2D(_Noise,TRANSFORM_TEX(node_8221, _Noise));
                float3 diffuseColor = (_Color.rgb+saturate((((_Noise_copy.r*_Noise_copy_copy.g)*6.666667+-1.0)*(pow((1.0 - i.uv0.g),1.4)*_CenterGlow))));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
		*/

		Pass 
		{
            Name "Caster"
            Tags 
			{ 
				"LightMode" = "ShadowCaster" 
				"Queue"="AlphaTest" 
				"IgnoreProjector"="True" 
				"RenderType"="TransparentCutout"
			}
            Offset 1, 1
           
            Fog {Mode Off}
            ZWrite On ZTest LEqual Cull Off
   
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"

			uniform float _ReplacementStyle;
			uniform float _ReplacementTimer;
			float4 _Center;
			float _DissolveTimer;
			uniform sampler2D _NoiseTex;
			uniform float4 _NoiseTex_ST;
			uniform sampler2D _MainTex;
			uniform float4 _MainTex_ST;

            struct v2f 
			{
				V2F_SHADOW_CASTER;
				float4 posWorld : TEXCOORD0;
                float2 tex : TEXCOORD1;					
            };
               
            v2f vert( appdata_base v ) 
			{
                v2f o;
                TRANSFER_SHADOW_CASTER(o)
                o.tex = TRANSFORM_TEX(v.texcoord, _MainTex);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                return o;
            }
               
            float4 frag( v2f i ) : COLOR 
			{
				// replacement
				float4 col;
				float3 dir = i.posWorld - _Center.xyz;
				float dis = length(dir);

				//special cases
				if (_ReplacementStyle == 0)
				{
					//pass    
				}
				else 
				if (_ReplacementStyle == 1)
				{
				}
				else 
				if (_ReplacementStyle == 3)
				{
					if (dis <= _ReplacementTimer)
					{
						clip(-1);
					}
				}
				else
				if (_ReplacementStyle == 2)
				{
					if (dis > _ReplacementTimer)
					{
						clip(-1);
					}
				}
				else
				{
					clip(-1);
				}

				// dissolve
				float noiseSample = tex2Dlod(_NoiseTex, float4(i.tex.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw, 0, 0));
				clip(noiseSample - _DissolveTimer);

				SHADOW_CASTER_FRAGMENT(i)
                }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
