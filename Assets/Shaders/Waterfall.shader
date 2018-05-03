// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:34314,y:33000,varname:node_4013,prsc:2|diff-8557-OUT,transm-1799-OUT,lwrap-1799-OUT,voffset-5297-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:33080,y:33006,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4152249,c2:0.6697291,c3:0.8823529,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9561,x:32196,y:33035,ptovrint:False,ptlb:WaterTex,ptin:_WaterTex,varname:node_9561,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6680d6cacc018754581c6f080303995c,ntxv:0,isnm:False|UVIN-8367-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1769,x:31424,y:33005,ptovrint:False,ptlb:U Speed,ptin:_USpeed,varname:node_1769,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:3988,x:31424,y:33093,ptovrint:False,ptlb:V Speed,ptin:_VSpeed,varname:_USpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Append,id:3744,x:31592,y:33035,varname:node_3744,prsc:2|A-1769-OUT,B-3988-OUT;n:type:ShaderForge.SFN_Multiply,id:6338,x:31805,y:33035,varname:node_6338,prsc:2|A-3744-OUT,B-751-T;n:type:ShaderForge.SFN_Time,id:751,x:31592,y:33186,varname:node_751,prsc:2;n:type:ShaderForge.SFN_Add,id:8367,x:31980,y:33035,varname:node_8367,prsc:2|A-6338-OUT,B-1829-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1829,x:31813,y:33176,varname:node_1829,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_Multiply,id:8744,x:33304,y:32823,varname:node_8744,prsc:2|A-1304-RGB,B-9561-R;n:type:ShaderForge.SFN_ValueProperty,id:1799,x:33999,y:33207,ptovrint:False,ptlb:Light,ptin:_Light,varname:node_1799,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.95;n:type:ShaderForge.SFN_OneMinus,id:3206,x:31998,y:33229,varname:node_3206,prsc:2|IN-1829-V;n:type:ShaderForge.SFN_Clamp01,id:7828,x:32179,y:33229,varname:node_7828,prsc:2|IN-3206-OUT;n:type:ShaderForge.SFN_Vector1,id:9478,x:32366,y:33182,varname:node_9478,prsc:2,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:6752,x:32595,y:33214,ptovrint:False,ptlb:Gradient,ptin:_Gradient,varname:node_6752,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-9478-OUT,B-7828-OUT;n:type:ShaderForge.SFN_Multiply,id:9635,x:32785,y:33243,varname:node_9635,prsc:2|A-6752-OUT,B-2354-R;n:type:ShaderForge.SFN_Tex2d,id:2354,x:32595,y:33374,ptovrint:False,ptlb:Water Noise,ptin:_WaterNoise,varname:node_2354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9733f0d7aec8848f08cae3c95b44d3ae,ntxv:2,isnm:False|UVIN-8367-OUT;n:type:ShaderForge.SFN_RemapRange,id:8412,x:32990,y:33286,varname:node_8412,prsc:2,frmn:0,frmx:1,tomn:-5,tomx:10|IN-9635-OUT;n:type:ShaderForge.SFN_Clamp01,id:5802,x:33189,y:33286,varname:node_5802,prsc:2|IN-8412-OUT;n:type:ShaderForge.SFN_Add,id:6692,x:33550,y:32825,varname:node_6692,prsc:2|A-8744-OUT,B-5802-OUT;n:type:ShaderForge.SFN_Clamp01,id:1398,x:33790,y:32825,varname:node_1398,prsc:2|IN-6692-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:8557,x:34013,y:32998,ptovrint:False,ptlb:Splash,ptin:_Splash,varname:node_8557,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-1304-RGB,B-1398-OUT;n:type:ShaderForge.SFN_Multiply,id:39,x:32797,y:33543,varname:node_39,prsc:2|A-2354-R,B-1829-Z;n:type:ShaderForge.SFN_SwitchProperty,id:7824,x:33009,y:33499,ptovrint:False,ptlb:Splash Vertex,ptin:_SplashVertex,varname:node_7824,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-39-OUT,B-9635-OUT;n:type:ShaderForge.SFN_Multiply,id:5297,x:33238,y:33499,varname:node_5297,prsc:2|A-7824-OUT,B-7937-OUT,C-4878-OUT;n:type:ShaderForge.SFN_NormalVector,id:7937,x:33009,y:33633,prsc:2,pt:False;n:type:ShaderForge.SFN_ValueProperty,id:4878,x:33009,y:33810,ptovrint:False,ptlb:Vertex Power,ptin:_VertexPower,varname:node_4878,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1304-9561-1769-3988-1799-6752-2354-8557-7824-4878;pass:END;sub:END;*/

Shader "II/Waterfall" {
    Properties {
        _Color ("Color", Color) = (0.4152249,0.6697291,0.8823529,1)
        _WaterTex ("WaterTex", 2D) = "white" {}
        _USpeed ("U Speed", Float ) = 0
        _VSpeed ("V Speed", Float ) = 0.5
        _Light ("Light", Float ) = 0.95
        [MaterialToggle] _Gradient ("Gradient", Float ) = 1
        _WaterNoise ("Water Noise", 2D) = "black" {}
        [MaterialToggle] _Splash ("Splash", Float ) = 0
		_SplashStrength("Splash Strength", Float) = 0
        [MaterialToggle] _SplashVertex ("Splash Vertex", Float ) = 0
        _VertexPower ("Vertex Power", Float ) = 1
		_Cutoff("Alpha Cutoff", Range(0, 1)) = 0.5
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
            Cull Off  
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows

            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _WaterTex; uniform float4 _WaterTex_ST;
            uniform float _USpeed;
            uniform float _VSpeed;
            uniform float _Light;
            uniform fixed _Gradient;
            uniform sampler2D _WaterNoise; uniform float4 _WaterNoise_ST;
            uniform fixed _Splash;
			uniform float _SplashStrength;
            uniform fixed _SplashVertex;
            uniform float _VertexPower;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_751 = _Time;
                float2 node_8367 = ((float2(_USpeed,_VSpeed)*node_751.g)+o.uv0);
                float4 _WaterNoise_var = tex2Dlod(_WaterNoise,float4(TRANSFORM_TEX(node_8367, _WaterNoise),0.0,0));
                float node_9635 = (lerp( 1.0, saturate((1.0 - o.uv0.g)), _Gradient )*_WaterNoise_var.r);
                v.vertex.xyz += (lerp( (_WaterNoise_var.r*o.uv0.b), node_9635, _SplashVertex )*v.normal*_VertexPower);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
                float4 node_751 = _Time;
                float2 node_8367 = ((float2(_USpeed,_VSpeed)*node_751.g)+i.uv0);
                float4 _WaterTex_var = tex2D(_WaterTex,TRANSFORM_TEX(node_8367, _WaterTex));
                float4 _WaterNoise_var = tex2D(_WaterNoise,TRANSFORM_TEX(node_8367, _WaterNoise));
                float node_9635 = (lerp( 1.0, saturate((1.0 - i.uv0.g)), _Gradient )*_WaterNoise_var.r);
                float3 diffuseColor = lerp( _Color.rgb, saturate(((_Color.rgb*_WaterTex_var.r)+saturate((node_9635*_SplashStrength+-5.0)))), _Splash );
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
				clip(node_9635.r - _Cutoff);
                float3 finalColor = diffuse;
                return fixed4(finalColor,1);
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows

            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _WaterTex; uniform float4 _WaterTex_ST;
            uniform float _USpeed;
            uniform float _VSpeed;
            uniform float _Light;
            uniform fixed _Gradient;
            uniform sampler2D _WaterNoise; uniform float4 _WaterNoise_ST;
            uniform fixed _Splash;
			uniform float _SplashStrength;
            uniform fixed _SplashVertex;
            uniform float _VertexPower;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_751 = _Time;
                float2 node_8367 = ((float2(_USpeed,_VSpeed)*node_751.g)+o.uv0);
                float4 _WaterNoise_var = tex2Dlod(_WaterNoise,float4(TRANSFORM_TEX(node_8367, _WaterNoise),0.0,0));
                float node_9635 = (lerp( 1.0, saturate((1.0 - o.uv0.g)), _Gradient )*_WaterNoise_var.r);
                v.vertex.xyz += (lerp( (_WaterNoise_var.r*o.uv0.b), node_9635, _SplashVertex )*v.normal*_VertexPower);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
                float4 node_751 = _Time;
                float2 node_8367 = ((float2(_USpeed,_VSpeed)*node_751.g)+i.uv0);
                float4 _WaterTex_var = tex2D(_WaterTex,TRANSFORM_TEX(node_8367, _WaterTex));
                float4 _WaterNoise_var = tex2D(_WaterNoise,TRANSFORM_TEX(node_8367, _WaterNoise));
                float node_9635 = (lerp( 1.0, saturate((1.0 - i.uv0.g)), _Gradient )*_WaterNoise_var.r);
                float3 diffuseColor = lerp( _Color.rgb, saturate(((_Color.rgb*_WaterTex_var.r)+saturate((node_9635*_SplashStrength+-5.0)))), _Splash );
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                return fixed4(finalColor * 1,0);
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
