// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33157,y:32631,varname:node_3138,prsc:2|emission-6991-OUT,alpha-598-A,voffset-2720-OUT;n:type:ShaderForge.SFN_Tex2d,id:598,x:32186,y:32655,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:_Texture,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:be6ace4f790b5490d921fed1744851b5,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:6931,x:32186,y:32882,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2202741,c2:0.8490566,c3:0.6794907,c4:1;n:type:ShaderForge.SFN_Multiply,id:6991,x:32522,y:32731,varname:node_6991,prsc:2|A-598-RGB,B-6931-RGB;n:type:ShaderForge.SFN_FragmentPosition,id:3494,x:32280,y:33211,varname:node_3494,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:4299,x:32280,y:33336,varname:node_4299,prsc:2;n:type:ShaderForge.SFN_Subtract,id:9662,x:32486,y:33255,varname:node_9662,prsc:2|A-3494-Y,B-4299-Y;n:type:ShaderForge.SFN_Divide,id:5587,x:32706,y:33255,varname:node_5587,prsc:2|A-9662-OUT,B-2315-OUT;n:type:ShaderForge.SFN_Vector1,id:7774,x:32679,y:33127,varname:node_7774,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:2720,x:32931,y:33093,varname:node_2720,prsc:2|A-8605-OUT,B-7774-OUT,C-7774-OUT;n:type:ShaderForge.SFN_Vector1,id:2315,x:32498,y:33481,varname:node_2315,prsc:2,v1:10;n:type:ShaderForge.SFN_Multiply,id:8605,x:33421,y:33314,varname:node_8605,prsc:2|A-5587-OUT,B-5259-OUT,C-53-OUT,D-7303-R;n:type:ShaderForge.SFN_Time,id:6682,x:32547,y:33585,varname:node_6682,prsc:2;n:type:ShaderForge.SFN_Sin,id:5259,x:32840,y:33367,varname:node_5259,prsc:2|IN-4966-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:7123,x:32685,y:33692,varname:node_7123,prsc:2;n:type:ShaderForge.SFN_Add,id:7221,x:32940,y:33671,varname:node_7221,prsc:2|A-6682-TTR,B-7123-X,C-6121-OUT;n:type:ShaderForge.SFN_Noise,id:7423,x:32685,y:33868,varname:node_7423,prsc:2|XY-7701-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6121,x:33079,y:33858,varname:node_6121,prsc:2|A-1533-OUT,B-1325-OUT;n:type:ShaderForge.SFN_TexCoord,id:7701,x:32453,y:33841,varname:node_7701,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ConstantLerp,id:1533,x:32848,y:33880,varname:node_1533,prsc:2,a:-1,b:1|IN-7423-OUT;n:type:ShaderForge.SFN_Slider,id:34,x:33079,y:33682,ptovrint:False,ptlb: Speed,ptin:_Speed,varname:_Speed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6796116,max:10;n:type:ShaderForge.SFN_Multiply,id:4966,x:33413,y:33628,varname:node_4966,prsc:2|A-7221-OUT,B-34-OUT;n:type:ShaderForge.SFN_Slider,id:1325,x:32825,y:34085,ptovrint:False,ptlb:Randomness,ptin:_Randomness,varname:_Randomness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.291262,max:3;n:type:ShaderForge.SFN_Slider,id:53,x:32998,y:33394,ptovrint:False,ptlb:Force,ptin:_Force,varname:_Force,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5631068,max:3;n:type:ShaderForge.SFN_Tex2d,id:7303,x:33262,y:33487,ptovrint:False,ptlb:Force Noise,ptin:_ForceNoise,varname:_ForceNoise,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6218-OUT;n:type:ShaderForge.SFN_Append,id:6218,x:33015,y:33471,varname:node_6218,prsc:2|A-6682-TSL,B-6682-TSL;proporder:598-6931-34-1325-53-7303;pass:END;sub:END;*/

Shader "Custom/GrassMotion" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (0.2202741,0.8490566,0.6794907,1)
        _Speed (" Speed", Range(0, 10)) = 0.6796116
        _Randomness ("Randomness", Range(0, 3)) = 1.291262
        _Force ("Force", Range(0, 3)) = 0.5631068
        _ForceNoise ("Force Noise", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float4 _Color;
            uniform float _Speed;
            uniform float _Randomness;
            uniform float _Force;
            uniform sampler2D _ForceNoise; uniform float4 _ForceNoise_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_6682 = _Time;
                float2 node_7423_skew = o.uv0 + 0.2127+o.uv0.x*0.3713*o.uv0.y;
                float2 node_7423_rnd = 4.789*sin(489.123*(node_7423_skew));
                float node_7423 = frac(node_7423_rnd.x*node_7423_rnd.y*(1+node_7423_skew.x));
                float2 node_6218 = float2(node_6682.r,node_6682.r);
                float4 _ForceNoise_var = tex2Dlod(_ForceNoise,float4(TRANSFORM_TEX(node_6218, _ForceNoise),0.0,0));
                float node_7774 = 0.0;
                v.vertex.xyz += float3((((mul(unity_ObjectToWorld, v.vertex).g-objPos.g)/10.0)*sin(((node_6682.a+mul(unity_ObjectToWorld, v.vertex).r+(lerp(-1,1,node_7423)*_Randomness))*_Speed))*_Force*_ForceNoise_var.r),node_7774,node_7774);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
////// Emissive:
                float4 _Texture_var = tex2D(_Texture,TRANSFORM_TEX(i.uv0, _Texture));
                float3 emissive = (_Texture_var.rgb*_Color.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,_Texture_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float _Speed;
            uniform float _Randomness;
            uniform float _Force;
            uniform sampler2D _ForceNoise; uniform float4 _ForceNoise_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_6682 = _Time;
                float2 node_7423_skew = o.uv0 + 0.2127+o.uv0.x*0.3713*o.uv0.y;
                float2 node_7423_rnd = 4.789*sin(489.123*(node_7423_skew));
                float node_7423 = frac(node_7423_rnd.x*node_7423_rnd.y*(1+node_7423_skew.x));
                float2 node_6218 = float2(node_6682.r,node_6682.r);
                float4 _ForceNoise_var = tex2Dlod(_ForceNoise,float4(TRANSFORM_TEX(node_6218, _ForceNoise),0.0,0));
                float node_7774 = 0.0;
                v.vertex.xyz += float3((((mul(unity_ObjectToWorld, v.vertex).g-objPos.g)/10.0)*sin(((node_6682.a+mul(unity_ObjectToWorld, v.vertex).r+(lerp(-1,1,node_7423)*_Randomness))*_Speed))*_Force*_ForceNoise_var.r),node_7774,node_7774);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
