//Maya ASCII 2018 scene
//Name: TREE.ma
//Last modified: Mon, Oct 22, 2018 05:48:50 PM
//Codeset: UTF-8
requires maya "2018";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "2.0.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201706261615-f9658c4cfc";
fileInfo "osv" "Mac OS X 10.13.6";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "38A53EF7-E14B-5862-1597-EC961FCB8897";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 22.131113506907344 4.0596794752664653 8.0373664023488836 ;
	setAttr ".r" -type "double3" 5.061647263408056 69.000000000449688 -1.1093886484422138e-15 ;
	setAttr ".rp" -type "double3" 0 -1.7763568394002505e-15 0 ;
	setAttr ".rpt" -type "double3" -2.142922133084551e-16 1.3008790291882803e-17 -1.1230579020012958e-17 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "F0B3A396-9A4E-3FCF-E99B-D58C7578174E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 26.17080750989874;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "6D556CAA-6548-3E7D-9D44-6E8A4D76195E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "912B09FA-F942-6994-C9C5-D5BF8024F39A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "28015E51-684F-3639-0A8E-F5A37197F813";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "E353F73E-3244-348B-C793-EC813353E17B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "D0718A83-9C47-4542-0E22-1691256B85FC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "6328341A-194E-33A2-E5BF-5B9BD769E95D";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 9.6507048389792107;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "pCylinder1";
	rename -uid "22F912C5-C048-4575-4664-9284EC018D1D";
	setAttr ".s" -type "double3" 1 0.23657690004689169 1 ;
createNode mesh -n "pCylinderShape1" -p "pCylinder1";
	rename -uid "5E5744CA-F245-A113-99AF-F79DCA960282";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.83749997615814209 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt";
	setAttr ".pt[84]" -type "float3" -0.14583112 0 -0.0018145242 ;
	setAttr ".pt[85]" -type "float3" -0.14583112 0 -0.0018145242 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "pCube7";
	rename -uid "3385F84F-3D40-092B-4AD6-4995C430582A";
	setAttr ".rp" -type "double3" -0.022513628005981445 9.9003756046295166 -2.8894076347351074 ;
	setAttr ".sp" -type "double3" -0.022513628005981445 9.9003756046295166 -2.8894076347351074 ;
createNode mesh -n "pCube7Shape" -p "pCube7";
	rename -uid "9E759938-4D42-4CF1-F2A1-14AC4445B607";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 2 ".clst";
	setAttr ".clst[0].clsn" -type "string" "SculptFreezeColorTemp";
	setAttr ".clst[1].clsn" -type "string" "SculptMaskColorTemp";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode mesh -n "polySurfaceShape1" -p "pCube7";
	rename -uid "3E3AB5F3-F542-E10D-CAC5-FAA96F8C50CA";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 164 ".uvst[0].uvsp[0:163]" -type "float2" 0.24726979 0.25 0.125
		 0.25 0.125 0.10472401 0.24726979 0.104724 0.25676936 0 0.375 0 0.375 0.028412854
		 0.25676936 0.028412854 0.375 0.5 0.625 0.5 0.625 0.75 0.47730389 0.75 0.47730389
		 0.64527595 0.375 0.64527601 0.125 0 0.375 0 0.375 0.25 0.125 0.25 0.625 1 0.375 1
		 0.375 0.88176936 0.47730389 0.88176936 0.625 0.66641462 0.625 0.75 0.375 0.75 0.375
		 0.66641462 0.375 0.5 0.625 0.5 0.625 0.52841282 0.48888257 0.52841282 0.48888257
		 0.67368883 0.464459 0.67368883 0.46445897 0.75 0.375 0.75 0.84654552 0.22158718 0.875
		 0.2215872 0.875 0.25 0.84654546 0.25 0.625 1 0.375 1 0.625 0 0.74726975 0 0.74726975
		 0.022312274 0.62500006 0.022312274 0.6240285 0.022312274 0.6240285 0 0.375 0 0.625
		 0 0.625 0.25 0.375 0.25 0.375 0.25 0.625 0.25 0.625 0.5 0.375 0.5 0.125 0 0.15755981
		 0.25 0.15755981 0.083585359 0.125 0.083585359 0.5111174 0.050725125 0.5111174 0.028412854
		 0.625 0 0.625 0.050725125 0.32724279 0.072065338 0.375 0.072065338 0.375 0.25 0.32724282
		 0.25 0.44615525 0.25 0.43161702 0 0.43161696 0.094377607 0.44615522 0.094377607 0.44615525
		 0.47154555 0.625 0.47154552 0.625 0 0.875 0 0.875 0.25 0.625 0.25 0.625 0.61757612
		 0.56007975 0.61757612 0.56007975 0.59085065 0.375 0.59085059 0.375 0.012768914 0.125
		 0.25 0.125 0.15914938 0.31225201 0.15914938 0.31225204 0.012768915 0.875 0 0.875
		 0.25 0.63073337 0.25 0.63073337 0.050725125 0.51835102 0.5 0.625 0.5 0.625 0.75 0.56950039
		 0.75 0.56950039 0.5507251 0.51835102 0.5507251 0.625 0.25573334 0.375 0.37773022
		 0.51111746 0.37773022 0.5111174 0.34927574 0.57385063 0.34927574 0.57385063 0.25573337
		 0.46445897 0.75949949 0.4888826 0.75949955 0.48888254 0.87773025 0.625 0.87773019
		 0.625 1 0.6240285 1 0.6240285 0.9775508 0.43161699 0.9775508 0.43161702 1 0.375 1
		 0.875 0.13242392 0.875 0.25 0.625 0.18013656 0.79593724 0.18013656 0.79593724 0.13242392
		 0.47665137 0.012768915 0.4766514 0.18013656 0.45464629 0 0.45464629 0.072065338 0.51835102
		 0.29775721 0.375 0.29775721 0.375 0.46744019 0.625 0.2904985 0.52151567 0.2904985
		 0.52151561 0.35976452 0.39388949 0.35976455 0.39388952 0.46744022 0.625 1 0.45464629
		 1 0.45464629 0.87800312 0.45561779 0.87800312 0.45561779 0.75573331 0.56950045 0.75573337
		 0.875 0 0.875 0.083585359 0.84244019 0.083585359 0.84244025 0.12292826 0.6654985
		 0.12292826 0.6654985 0.25 0.375 0.13931985 0.375 0 0.625 0 0.625 0.098110437 0.4231813
		 0.09811043 0.4231813 0.13931987 0.875 0 0.875 0.25 0.81611556 0.25 0.81611556 0.098110437
		 0.42318138 0.263778 0.42318135 0.44111556 0.625 0.44111553 0.625 0.5 0.375 0.5 0.375
		 0.263778 0.375 0.75 0.625 0.75 0.625 1 0.375 1 0.125 0 0.36122203 0.13931985 0.361222
		 0.25 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 72 ".vt[0:71]"  -2.40507722 11.66146469 -5.9107337 -2.40507722 11.66146469 -9.02751255
		 -2.40507722 9.0053501129 -9.02751255 -2.40507722 9.0053501129 -5.9107337 -2.40507722 7.090656757 -5.66858006
		 -2.40507722 7.090656757 -2.65476298 -2.40507722 7.61013556 -2.65476298 -2.40507722 7.61013556 -5.66858006
		 3.81191659 11.66146469 -9.02751255 3.81191659 7.090656757 -9.02751255 0.13901401 7.090656757 -9.02751255
		 0.13901401 9.0053501129 -9.02751255 -5.23710632 7.61013556 -5.9107337 -5.23710632 7.61013556 0.46201611
		 -5.23710632 12.18094254 0.46201611 -5.23710632 12.18094254 -5.9107337 3.81191659 7.090656757 -2.65476298
		 0.13901401 7.090656757 -5.66858006 0.95572758 7.61013556 -0.11023569 0.95572758 6.74345207 -0.11023569
		 -3.8291564 6.74345207 -0.11023569 -3.8291564 7.61013556 -0.11023569 0.97988725 12.18094254 -5.9107337
		 0.97988725 11.66146469 -5.9107337 -3.012442827 9.0053501129 -5.9107337 -3.012442827 7.61013556 -5.9107337
		 0.97988725 11.66146469 -5.18540096 0.97988725 12.18094254 -5.18540096 0.95572758 6.74345207 4.28361511
		 -3.8291564 6.74345207 4.28361511 0.97988725 7.61013556 0.46201611 0.97988725 7.61013556 -2.65476298
		 0.97988725 8.018075943 -2.65476298 0.97988725 8.018075943 0.46201611 0.95572758 8.018075943 0.46201611
		 0.95572758 7.61013556 0.46201611 0.95572758 9.33566284 4.28361511 -3.8291564 9.33566284 4.28361511
		 -3.4676199 13.94685745 2.35445952 2.53993511 13.94685745 2.35445952 2.53993511 13.94685745 -5.18540096
		 -3.4676199 13.94685745 -5.18540096 -3.8291564 9.33566284 0.46201611 -3.8291564 7.61013556 0.46201611
		 3.81191659 8.018075943 -2.65476298 -1.024914742 9.33566284 2.35445952 -1.024914742 9.33566284 3.5718379
		 -1.024914742 12.58888245 3.5718379 -1.024914742 12.58888245 2.35445952 -3.4676199 12.18094254 0.46201611
		 -3.4676199 9.33566284 0.46201611 -3.4676199 12.18094254 -5.18540096 5.19207907 8.018075943 3.5718379
		 5.19207907 8.018075943 -2.8009119 5.19207907 12.58888245 -2.8009119 5.19207907 12.58888245 3.5718379
		 2.53993511 11.66146469 -5.18540096 -3.4676199 9.33566284 2.35445952 3.81191659 11.66146469 -2.8009119
		 3.81191659 8.018075943 -2.8009119 2.53993511 12.58888245 -2.8009119 2.53993511 11.66146469 -2.8009119
		 -3.012442827 7.61013556 -5.66858006 2.53993511 12.58888245 2.35445952 0.95572758 8.018075943 3.5718379
		 0.95572758 9.33566284 3.5718379 -3.012442827 5.85389376 -5.66858006 0.13901401 5.85389376 -5.66858006
		 0.13901401 5.85389376 -10.062430382 0.13901401 9.0053501129 -10.062430382 -3.012442827 9.0053501129 -10.062430382
		 -3.012442827 5.85389376 -10.062430382;
	setAttr -s 108 ".ed[0:107]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 1 8 0 8 9 0 9 10 0 10 11 0 11 2 0 12 13 0 13 14 0 14 15 0 15 12 0 9 16 0 16 5 0
		 4 17 0 17 10 0 18 19 0 19 20 0 20 21 0 21 18 0 15 22 0 22 23 0 23 0 0 3 24 0 24 25 0
		 25 12 0 26 23 0 22 27 0 27 26 0 19 28 0 28 29 0 29 20 0 30 31 0 31 32 0 32 33 0 33 30 0
		 34 35 0 35 30 0 33 34 0 28 36 0 36 37 0 37 29 0 38 39 0 39 40 0 40 41 0 41 38 0 37 42 0
		 42 43 0 43 21 0 31 6 0 16 44 0 44 32 0 45 46 0 46 47 0 47 48 0 48 45 0 49 14 0 13 43 0
		 42 50 0 50 49 0 49 51 0 51 27 0 52 53 0 53 54 0 54 55 0 55 52 0 40 56 0 56 26 0 51 41 0
		 57 38 0 50 57 0 8 58 0 58 59 0 59 44 0 60 54 0 53 59 0 58 61 0 61 60 0 56 61 0 25 62 0
		 62 7 0 35 18 0 39 63 0 63 60 0 57 45 0 48 63 0 64 52 0 55 47 0 46 65 0 65 64 0 36 65 0
		 64 34 0 62 66 0 66 67 0 67 17 0 67 68 0 68 69 0 69 11 0 69 70 0 70 24 0 71 68 0 66 71 0
		 71 70 0;
	setAttr -s 38 -ch 216 ".fc[0:37]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 4 5 6 7
		mu 0 4 4 5 6 7
		f 6 8 9 10 11 12 -2
		mu 0 6 8 9 10 11 12 13
		f 4 13 14 15 16
		mu 0 4 14 15 16 17
		f 6 -11 17 18 -5 19 20
		mu 0 6 11 10 18 19 20 21
		f 4 21 22 23 24
		mu 0 4 22 23 24 25
		f 8 25 26 27 -4 28 29 30 -17
		mu 0 8 26 27 28 29 30 31 32 33
		f 4 31 -27 32 33
		mu 0 4 34 35 36 37
		f 4 -23 34 35 36
		mu 0 4 24 23 38 39
		f 4 37 38 39 40
		mu 0 4 40 41 42 43
		f 4 41 42 -41 43
		mu 0 4 44 45 40 43
		f 4 -36 44 45 46
		mu 0 4 46 47 48 49
		f 4 47 48 49 50
		mu 0 4 50 51 52 53
		f 6 -37 -47 51 52 53 -24
		mu 0 6 54 46 49 55 56 57
		f 6 -39 54 -6 -19 55 56
		mu 0 6 58 59 6 5 60 61
		f 4 57 58 59 60
		mu 0 4 62 63 64 65
		f 6 61 -15 62 -53 63 64
		mu 0 6 66 16 15 67 68 69
		f 6 -62 65 66 -33 -26 -16
		mu 0 6 16 66 70 71 27 26
		f 4 67 68 69 70
		mu 0 4 72 73 74 75
		f 6 -50 71 72 -34 -67 73
		mu 0 6 53 52 76 77 78 79
		f 6 74 -51 -74 -66 -65 75
		mu 0 6 80 50 81 82 83 84
		f 6 -18 -10 76 77 78 -56
		mu 0 6 60 85 86 87 88 61
		f 6 79 -69 80 -78 81 82
		mu 0 6 89 90 91 92 93 94
		f 8 -77 -9 -1 -28 -32 -73 83 -82
		mu 0 8 95 9 8 96 97 98 99 100
		f 12 -31 84 85 -7 -55 -38 -43 86 -25 -54 -63 -14
		mu 0 12 33 32 101 102 103 104 105 106 107 108 109 110
		f 6 -72 -49 87 88 -83 -84
		mu 0 6 111 112 51 113 114 115
		f 6 -88 -48 -75 89 -61 90
		mu 0 6 113 51 50 80 116 117
		f 6 91 -71 92 -59 93 94
		mu 0 6 118 72 75 64 63 119
		f 6 -93 -70 -80 -89 -91 -60
		mu 0 6 64 75 90 89 120 121
		f 8 -52 -46 95 -94 -58 -90 -76 -64
		mu 0 8 122 49 48 123 124 125 126 127
		f 8 -81 -68 -92 96 -44 -40 -57 -79
		mu 0 8 92 91 128 129 130 131 132 133
		f 8 -35 -22 -87 -42 -97 -95 -96 -45
		mu 0 8 47 134 135 136 137 138 139 48
		f 6 97 98 99 -20 -8 -86
		mu 0 6 140 141 142 143 144 145
		f 6 100 101 102 -12 -21 -100
		mu 0 6 142 146 147 148 149 143
		f 6 -3 -13 -103 103 104 -29
		mu 0 6 150 151 152 153 154 155
		f 4 105 -101 -99 106
		mu 0 4 156 157 158 159
		f 4 -104 -102 -106 107
		mu 0 4 154 153 157 156
		f 6 -107 -98 -85 -30 -105 -108
		mu 0 6 160 141 140 161 162 163;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "9116D861-8745-EEB6-EBC3-35A0BADC7866";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "68737FB8-5645-5C53-23FB-699A42536B64";
createNode displayLayer -n "defaultLayer";
	rename -uid "8510D2C9-5A40-41E7-C55D-CB85B641D11F";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "4183F395-5B44-6C89-F7B6-0F9FE3514425";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D6A4D24A-8741-53A0-A155-468256ACC25F";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "977F343A-3E4A-06BC-EACF-4DA5E7821AFE";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C0E3B3B9-A540-70E1-AF4B-78B747F4C7E5";
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "E4CACA28-5246-2062-E820-159BC446D384";
	setAttr ".version" -type "string" "2.0.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "1AC80D62-644B-EF0D-90D4-E590FC97959F";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "E629863F-CC48-85C1-5F45-2193BB7C48E5";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "989AAF0B-B34C-0E9B-CF41-0A89E8167F99";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode polyCylinder -n "polyCylinder1";
	rename -uid "88D976E2-E049-AF09-127F-949D3C3D79F4";
	setAttr ".sa" 12;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	rename -uid "8BC13D5F-8642-6764-56B7-3BB92193E01C";
	setAttr ".ics" -type "componentList" 4 "f[0]" "f[3]" "f[5:6]" "f[9:10]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".rs" 902385037;
	setAttr ".lt" -type "double3" 1.1102230246251565e-16 -1.1093356479670479e-31 1.6217513678242763 ;
	setAttr ".ls" -type "double3" 1 0.29140906211200618 1 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -1 -0.23657690004689169 -0.86602538824081421 ;
	setAttr ".cbx" -type "double3" 1 0.23657690004689169 0.86602538824081421 ;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	rename -uid "C917155D-8944-AE0B-F51B-988FA6966D4F";
	setAttr ".ics" -type "componentList" 1 "f[5]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -2.4248321 0.029991673 0.99312943 ;
	setAttr ".rs" 156529385;
	setAttr ".lt" -type "double3" -0.4873800344634292 5.7741177223141586e-19 1.0749843702472117 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -2.5664637088775635 -0.0089573105164251696 0.79847979545593262 ;
	setAttr ".cbx" -type "double3" -2.2832005023956299 0.068940655670580567 1.1877790689468384 ;
createNode polyTweak -n "polyTweak1";
	rename -uid "7EB117B8-814E-6974-35CC-8A9D999D4AA9";
	setAttr ".uopa" yes;
	setAttr -s 30 ".tk";
	setAttr ".tk[0]" -type "float3" 0.33456749 0.96213055 0 ;
	setAttr ".tk[1]" -type "float3" -0.15565602 0.96213055 -0.4672446 ;
	setAttr ".tk[2]" -type "float3" -0.29777643 0.96213055 -0.70819771 ;
	setAttr ".tk[3]" -type "float3" -0.33262005 0.96213055 -0.72141641 ;
	setAttr ".tk[4]" -type "float3" -0.87696368 0.96213055 0 ;
	setAttr ".tk[5]" -type "float3" -0.87696368 0.96213055 0 ;
	setAttr ".tk[6]" -type "float3" 0 0.96213055 0 ;
	setAttr ".tk[7]" -type "float3" 0 0.96213055 0.3500576 ;
	setAttr ".tk[8]" -type "float3" -0.080223642 0.96213055 0.49839669 ;
	setAttr ".tk[9]" -type "float3" 0.21512388 0.96213055 0.39800805 ;
	setAttr ".tk[10]" -type "float3" 0 0.96213055 0 ;
	setAttr ".tk[11]" -type "float3" 0.33456749 0.96213055 0 ;
	setAttr ".tk[24]" -type "float3" 0 0.96213055 0 ;
	setAttr ".tk[26]" -type "float3" 0 0.25354692 0 ;
	setAttr ".tk[27]" -type "float3" 0 0.25354692 0 ;
	setAttr ".tk[30]" -type "float3" 0 0.25354692 0 ;
	setAttr ".tk[31]" -type "float3" 0 0.25354692 0 ;
	setAttr ".tk[34]" -type "float3" 0.092933118 0.25354692 0.34174508 ;
	setAttr ".tk[35]" -type "float3" 0.026962519 0.25354692 -0.14599514 ;
	setAttr ".tk[36]" -type "float3" 0.026962519 0 -0.14599502 ;
	setAttr ".tk[37]" -type "float3" 0.092933118 0 0.34174508 ;
	setAttr ".tk[38]" -type "float3" -0.11989522 0.25354692 -0.19575012 ;
	setAttr ".tk[39]" -type "float3" -0.11989522 0 -0.19575012 ;
	setAttr ".tk[40]" -type "float3" 0.26248467 0.25354692 -0.38749802 ;
	setAttr ".tk[41]" -type "float3" -0.1617415 0.25354692 0.12025774 ;
	setAttr ".tk[42]" -type "float3" -0.1617415 0 0.12025762 ;
	setAttr ".tk[43]" -type "float3" 0.26248467 0 -0.38749802 ;
	setAttr ".tk[44]" -type "float3" -0.10074329 0.25354692 0.26723999 ;
	setAttr ".tk[45]" -type "float3" -0.10074329 0 0.26723999 ;
createNode polyExtrudeEdge -n "polyExtrudeEdge1";
	rename -uid "806E5D2E-6648-4C40-1F7D-DD9147162E97";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[8]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.31745014 -0.0089590382 1.3812151 ;
	setAttr ".rs" 715296448;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -0.080223642289638519 -0.0089590378989811148 1.2640335559844971 ;
	setAttr ".cbx" -type "double3" 0.71512389183044434 -0.0089590378989811148 1.4983967542648315 ;
createNode polyTweak -n "polyTweak2";
	rename -uid "21F157A9-5F40-990B-F34C-FDB3F0159B5C";
	setAttr ".uopa" yes;
	setAttr -s 22 ".tk";
	setAttr ".tk[8]" -type "float3" 0 0 1.0058284e-07 ;
	setAttr ".tk[9]" -type "float3" 0 0 1.0058284e-07 ;
	setAttr ".tk[11]" -type "float3" -0.02040291 -3.7539416e-15 -0.099477485 ;
	setAttr ".tk[26]" -type "float3" 0.40134847 0 -0.55736065 ;
	setAttr ".tk[27]" -type "float3" 0.63161349 0 -0.32709527 ;
	setAttr ".tk[28]" -type "float3" 0.11748469 0 0.11748457 ;
	setAttr ".tk[29]" -type "float3" -0.11748481 0 -0.11748493 ;
	setAttr ".tk[30]" -type "float3" -0.59509087 0 -0.65127367 ;
	setAttr ".tk[31]" -type "float3" -0.59509087 0 -0.65127367 ;
	setAttr ".tk[35]" -type "float3" -0.10880569 0 0.30879205 ;
	setAttr ".tk[36]" -type "float3" -0.17664154 -0.21847126 0.10391247 ;
	setAttr ".tk[37]" -type "float3" -0.063569866 -0.037752107 0.2926068 ;
	setAttr ".tk[39]" -type "float3" -0.051435422 -3.7747583e-15 -0.44411379 ;
	setAttr ".tk[40]" -type "float3" -0.18676354 0 -0.44090229 ;
	setAttr ".tk[41]" -type "float3" 0.23151371 0 -0.44429165 ;
	setAttr ".tk[42]" -type "float3" -0.54319185 0 -0.76451373 ;
	setAttr ".tk[43]" -type "float3" -0.59946036 0 -0.67450094 ;
	setAttr ".tk[45]" -type "float3" -0.515939 0 -0.14814389 ;
	setAttr ".tk[49]" -type "float3" 0.18929878 0 0.20960467 ;
createNode polyExtrudeFace -n "polyExtrudeFace3";
	rename -uid "EEAD8674-5842-A31C-6FDA-6D80047EB1F2";
	setAttr ".ics" -type "componentList" 1 "f[24:35]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.2365769 0 ;
	setAttr ".rs" 787256578;
	setAttr ".lt" -type "double3" 0 2.2909015105727691e-17 0.60317303189358029 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -1 0.23657690004689169 -1 ;
	setAttr ".cbx" -type "double3" 1 0.23657690004689169 1 ;
createNode polyExtrudeFace -n "polyExtrudeFace4";
	rename -uid "C2152A92-6345-7B65-285E-A79071CD2264";
	setAttr ".ics" -type "componentList" 1 "f[24:35]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 0.93975013 0 ;
	setAttr ".rs" 68774328;
	setAttr ".lt" -type "double3" -6.7337001725418002e-18 -7.7378767896461604e-16 1.9176200862447585 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.65453141927719116 0.93974997656840331 -0.65453141927719116 ;
	setAttr ".cbx" -type "double3" 0.65453141927719116 0.93975031499437345 0.65453141927719116 ;
createNode polyTweak -n "polyTweak3";
	rename -uid "084F2C61-DB44-E21E-FBD6-B597C2F2C040";
	setAttr ".uopa" yes;
	setAttr -s 25 ".tk";
	setAttr ".tk[50]" -type "float3" 0 1.4305115e-06 0 ;
	setAttr ".tk[51]" -type "float3" -0.29918432 1.4305115e-06 0.17273426 ;
	setAttr ".tk[52]" -type "float3" -0.17273429 0 0.29918432 ;
	setAttr ".tk[53]" -type "float3" 1.7718555e-32 0 7.9143119e-18 ;
	setAttr ".tk[54]" -type "float3" 2.220446e-16 0 0.34546858 ;
	setAttr ".tk[55]" -type "float3" 0.17273429 0 0.29918432 ;
	setAttr ".tk[56]" -type "float3" 0.29918432 0 0.17273429 ;
	setAttr ".tk[57]" -type "float3" 0.34546858 0 6.2101257e-09 ;
	setAttr ".tk[58]" -type "float3" 0.29918432 0 -0.17273426 ;
	setAttr ".tk[59]" -type "float3" 0.17273429 0 -0.29918432 ;
	setAttr ".tk[60]" -type "float3" -2.220446e-16 0 -0.34546858 ;
	setAttr ".tk[61]" -type "float3" -0.17273429 0 -0.29918432 ;
	setAttr ".tk[62]" -type "float3" -0.29918432 0 -0.17273429 ;
	setAttr ".tk[63]" -type "float3" -0.34546858 0 -6.2101257e-09 ;
createNode polyExtrudeFace -n "polyExtrudeFace5";
	rename -uid "3A5969AD-1546-16C7-B0CB-89AF1182A835";
	setAttr ".ics" -type "componentList" 1 "f[24:35]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 2.95737 2.9802322e-08 ;
	setAttr ".rs" 1118777699;
	setAttr ".lt" -type "double3" 1.1684141881024226e-16 1.5507690956568544e-17 1.6062908042968267 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.65453135967254639 2.9573698595574873 -0.65453130006790161 ;
	setAttr ".cbx" -type "double3" 0.65453135967254639 2.9573703107921143 0.65453135967254639 ;
createNode polyExtrudeFace -n "polyExtrudeFace6";
	rename -uid "DA9CDF9A-004B-F4AE-E0F5-E48D5D470C71";
	setAttr ".ics" -type "componentList" 1 "f[24:35]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.073732555 4.663661 2.3841858e-07 ;
	setAttr ".rs" 854967827;
	setAttr ".lt" -type "double3" -1.2423241654965691e-16 -1.4440896986623547e-16 1.3164265447477699 ;
	setAttr ".lr" -type "double3" -27.128141415599519 -7.5939235253092185 -11.161196931820184 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.45367193222045898 4.6636605809578731 -0.52740353345870972 ;
	setAttr ".cbx" -type "double3" 0.60113704204559326 4.6636610321924996 0.52740401029586792 ;
createNode polyTweak -n "polyTweak4";
	rename -uid "AD3F7B14-5A49-8410-F10A-C9AFE99D0C46";
	setAttr ".uopa" yes;
	setAttr -s 13 ".tk[75:87]" -type "float3"  -0.036361732 3.5527137e-15
		 0.063562989 0.010169754 3.5527137e-15 0.11009479 0.073732771 3.5527137e-15 -7.5848163e-09
		 0.073732682 3.5527137e-15 0.12712598 0.13729581 3.5527137e-15 0.11009479 0.18382755
		 3.5527137e-15 0.063563436 0.20085885 3.5527137e-15 2.4594545e-08 0.18382755 3.5527137e-15
		 -0.063562989 0.13729581 3.5527137e-15 -0.11009476 0.073732711 3.5527137e-15 -0.1271261
		 0.010169486 3.5527137e-15 -0.11009479 -0.03636203 3.5527137e-15 -0.063562989 -0.053393729
		 3.5527137e-15 -2.0886819e-07;
createNode polyExtrudeFace -n "polyExtrudeFace7";
	rename -uid "6C2884C8-DC48-D432-15CE-9BBEAA44700C";
	setAttr ".ics" -type "componentList" 1 "f[24:35]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.069798291 6.0777798 -0.020992115 ;
	setAttr ".rs" 58588279;
	setAttr ".lt" -type "double3" 1.3530843112619095e-16 -1.3877787807814457e-15 1.208815162628919 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.45125550031661987 5.9721972290914964 -0.51643109321594238 ;
	setAttr ".cbx" -type "double3" 0.59085208177566528 6.1833623998921716 0.4744468629360199 ;
createNode polyExtrudeFace -n "polyExtrudeFace8";
	rename -uid "518B22C4-CD4B-C898-5D3A-BEAEA032D6B9";
	setAttr ".ics" -type "componentList" 2 "f[24:25]" "f[109:110]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.29868662 5.5441318 -0.90469193 ;
	setAttr ".rs" 1645528570;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.033968567848205566 5.0089078649567007 -1.2835097312927246 ;
	setAttr ".cbx" -type "double3" 0.56340467929840088 6.0793555258088272 -0.52587413787841797 ;
createNode polyTweak -n "polyTweak5";
	rename -uid "A02EF994-BF43-A3B6-6F68-918C7B0CA1F0";
	setAttr ".uopa" yes;
	setAttr -s 61 ".tk[51:111]" -type "float3"  0 1.13403189 0 0 1.13403237
		 0 0 1.13403237 0 0 1.13403237 0 0 1.13403237 0 0 1.13403237 0 0 1.13403237 0 0 1.13403237
		 0 0 1.13403237 0 0 1.13403237 0 0 1.13403237 0 -1.1920929e-07 1.13403237 0 0 -0.92080438
		 0 5.9604645e-08 -0.92080414 0 0 -0.92080414 0 0 -0.92080414 0 0 -0.92080414 0 0 -0.92080414
		 0 0 -0.92080414 0 0 -0.92080414 0 0 -0.92080414 0 0 -0.92080414 0 0 -0.92080414 0
		 0 -0.92080414 0 0 -2.65856767 -0.12037004 0 -2.65856767 -0.12037002 0 -2.65856743
		 -0.12037003 0 -2.65856767 -0.12037003 0 -2.65856743 -0.12037003 0 -2.65856743 -0.12037002
		 0 -2.65856743 -0.12037004 0 -2.65856743 -0.12037002 0 -2.65856743 -0.12037002 0 -2.65856743
		 -0.12037002 0 -2.65856767 -0.12037002 0 -2.65856743 -0.12037002 0.01566124 -4.15718031
		 -0.29551274 0.01566124 -4.10692644 -0.29551274 0.01566124 -4.077163219 -0.29551274
		 0.01566121 -4.075866222 -0.2955128 0.01566124 -4.10338163 -0.29551274 0.01566124
		 -4.1523366 -0.29551268 0.01566124 -4.20961332 -0.29551274 0.01566124 -4.25986624
		 -0.29551274 0.01566121 -4.28962946 -0.2955128 0.01566124 -4.29092646 -0.29551274
		 0.01566124 -4.26341295 -0.2955128 0.01566124 -4.21445704 -0.29551274 -0.05364728
		 -5.35979795 -0.53381586 -0.028824568 -5.28658819 -0.50516784 0.01566124 -5.39799261
		 -0.56417716 0.0079171658 -5.24322748 -0.49233198 0.046734512 -5.24134016 -0.49874687
		 0.077226162 -5.28142118 -0.52269423 0.091221094 -5.35274363 -0.55775607 0.084969759
		 -5.4361825 -0.59453857 0.060147285 -5.50939226 -0.62318587 0.023404717 -5.55275297
		 -0.63602209 -0.015411854 -5.55464125 -0.62960804 -0.045903206 -5.51456022 -0.60566044
		 -0.059898734 -5.44323874 -0.57059824;
createNode polyExtrudeFace -n "polyExtrudeFace9";
	rename -uid "BD919997-1F40-441F-6332-4DB3560ABB4D";
	setAttr ".ics" -type "componentList" 1 "f[28:30]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.18877858 6.078227 -0.80825144 ;
	setAttr ".rs" 1017637675;
	setAttr ".lt" -type "double3" 1.1275702593849246e-16 -2.5951463200613034e-15 0.62703298748640046 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.41152572631835938 6.028368269146843 -1.104496955871582 ;
	setAttr ".cbx" -type "double3" 0.033968567848205566 6.1280857068672603 -0.51200598478317261 ;
createNode polyTweak -n "polyTweak6";
	rename -uid "A2941958-5B4A-1FC1-69C8-49B6F9F3F3D0";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[111]" -type "float3" -0.025443628 1.2202502 -0.24368501 ;
	setAttr ".tk[112]" -type "float3" 0.0032109916 1.246752 -0.21061453 ;
	setAttr ".tk[113]" -type "float3" 0.051954929 1.2030122 -0.2831924 ;
	setAttr ".tk[114]" -type "float3" 0.038042374 1.2596421 -0.19844592 ;
	setAttr ".tk[115]" -type "float3" -0.042803541 1.9485028 -0.32818866 ;
	setAttr ".tk[116]" -type "float3" -0.013442814 1.9798739 -0.29466817 ;
	setAttr ".tk[117]" -type "float3" 0.029933631 1.9983344 -0.27976918 ;
createNode polyExtrudeFace -n "polyExtrudeFace10";
	rename -uid "AB7C6E86-C042-31A4-CC21-3D9AE8CC8E92";
	setAttr ".ics" -type "componentList" 1 "f[33:34]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.25671589 6.1136179 -0.66702837 ;
	setAttr ".rs" 337405528;
	setAttr ".lt" -type "double3" 8.8297424927219481e-16 4.0245584642661925e-16 0.5539340919131337 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.033968567848205566 6.0793564282780812 -0.859916090965271 ;
	setAttr ".cbx" -type "double3" 0.47946321964263916 6.1478795650090774 -0.47414064407348633 ;
createNode polyExtrudeFace -n "polyExtrudeFace11";
	rename -uid "62837AE8-2444-619E-8FAB-71B50CC3184A";
	setAttr ".ics" -type "componentList" 1 "f[104]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.073790513 4.6009836 0.24872452 ;
	setAttr ".rs" 2074935918;
	setAttr ".lt" -type "double3" 0 1.2427917902618346 0.69409912267659202 ;
	setAttr ".ls" -type "double3" 1 0.35685206687049265 1 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.2213137298822403 4.0347053913713093 0.090415060520172119 ;
	setAttr ".cbx" -type "double3" 0.073732703924179077 5.1672614374989987 0.40703397989273071 ;
createNode polyTweak -n "polyTweak7";
	rename -uid "27EAB09F-B444-00F5-D624-589D64EDE84E";
	setAttr ".uopa" yes;
	setAttr -s 18 ".tk";
	setAttr ".tk[103]" -type "float3" -0.098424643 -0.45568085 -0.0029406548 ;
	setAttr ".tk[104]" -type "float3" -0.13438249 -0.50455284 0.021884799 ;
	setAttr ".tk[111]" -type "float3" 0.017252207 -0.34533691 -0.093316078 ;
	setAttr ".tk[112]" -type "float3" -0.013004303 -0.7498188 -0.24747944 ;
	setAttr ".tk[113]" -type "float3" 0.17917812 -0.72706985 -0.25495696 ;
	setAttr ".tk[114]" -type "float3" -0.17444071 -0.092761993 -0.00055265427 ;
	setAttr ".tk[115]" -type "float3" -0.061996937 1.2571049 -0.18592936 ;
	setAttr ".tk[117]" -type "float3" -0.0090115368 1.0387917 -0.040079474 ;
	setAttr ".tk[118]" -type "float3" 0.011534601 -0.43440437 -0.0097395182 ;
	setAttr ".tk[119]" -type "float3" -0.10992166 0.18457603 -0.012241125 ;
	setAttr ".tk[120]" -type "float3" -0.18686551 -0.44434166 -0.069420516 ;
	setAttr ".tk[121]" -type "float3" -0.042194664 -0.016384125 -0.064457893 ;
	setAttr ".tk[122]" -type "float3" 0.011534929 -0.60918617 -0.17292416 ;
	setAttr ".tk[125]" -type "float3" 0.10965955 -0.19738007 0.082832634 ;
createNode polyExtrudeFace -n "polyExtrudeFace12";
	rename -uid "DE4FDB18-9944-DD22-A280-FAA033679535";
	setAttr ".ics" -type "componentList" 2 "f[104]" "f[138]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.07083495 4.9001622 0.35473379 ;
	setAttr ".rs" 2106219279;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.2213137298822403 4.6330628121451598 0.090415060520172119 ;
	setAttr ".cbx" -type "double3" 0.07964383065700531 5.1672614374989987 0.61905252933502197 ;
createNode polyTweak -n "polyTweak8";
	rename -uid "DF1CCFE6-EA48-9A27-F0D5-6DA19D34C21F";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[127]" -type "float3" 0.24122322 -4.7596669 -0.21022326 ;
	setAttr ".tk[128]" -type "float3" 0.24122322 -4.7052202 -0.21313082 ;
	setAttr ".tk[129]" -type "float3" 0.24122322 -4.8014145 -0.28814223 ;
	setAttr ".tk[130]" -type "float3" 0.24122323 -4.8711834 -0.28284672 ;
createNode polyTweak -n "polyTweak9";
	rename -uid "D6DB4AFC-F145-E4A2-FE6D-EE8BC89CFD17";
	setAttr ".uopa" yes;
	setAttr -s 13 ".tk";
	setAttr ".tk[99]" -type "float3" 0.041355342 0.0014076233 0.011841536 ;
	setAttr ".tk[101]" -type "float3" -0.18885458 7.1054274e-15 0 ;
	setAttr ".tk[102]" -type "float3" -0.16107896 -3.5527137e-15 0 ;
	setAttr ".tk[107]" -type "float3" 0.073930174 -0.30798346 0.0050083911 ;
	setAttr ".tk[113]" -type "float3" 0 0.24149981 0.03698745 ;
	setAttr ".tk[129]" -type "float3" 0.12148573 0 0 ;
	setAttr ".tk[130]" -type "float3" -0.11705448 0 0 ;
	setAttr ".tk[131]" -type "float3" 0.051308438 4.3725142 -0.11554739 ;
	setAttr ".tk[132]" -type "float3" -0.029720366 4.344377 -0.13582312 ;
	setAttr ".tk[133]" -type "float3" 0.034878016 3.593884 -0.030833285 ;
	setAttr ".tk[134]" -type "float3" -0.026509512 3.6197076 -0.01660911 ;
	setAttr ".tk[135]" -type "float3" 0.058850005 3.3029361 0.17981343 ;
	setAttr ".tk[136]" -type "float3" -0.021942291 3.2730365 0.15158761 ;
createNode polySplit -n "polySplit1";
	rename -uid "497A99D3-244B-848B-5594-C78293AC0BAA";
	setAttr -s 2 ".e[0:1]"  1 1;
	setAttr -s 2 ".d[0:1]"  -2147483451 -2147483411;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit2";
	rename -uid "FEAB5B51-D842-42EF-ED53-F7BACBFF2AD9";
	setAttr -s 2 ".e[0:1]"  1 1;
	setAttr -s 2 ".d[0:1]"  -2147483453 -2147483416;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace13";
	rename -uid "FEC10288-754D-E8E0-AF62-5788F679B400";
	setAttr ".ics" -type "componentList" 3 "f[24:25]" "f[28:30]" "f[33:34]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.011931866 6.5248055 -1.1896352 ;
	setAttr ".rs" 64124900;
	setAttr ".lt" -type "double3" 8.3266726846886741e-17 -2.3314683517128287e-15 0.82907792945578462 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.54337245225906372 6.2291568484682571 -1.7999067306518555 ;
	setAttr ".cbx" -type "double3" 0.5195087194442749 6.8204538010356375 -0.57936364412307739 ;
createNode polyTweak -n "polyTweak10";
	rename -uid "4F1A1172-654E-15F8-C1DB-CCB315A664A7";
	setAttr ".uopa" yes;
	setAttr -s 25 ".tk";
	setAttr ".tk[87]" -type "float3" -0.062695056 0.57589376 -0.063959785 ;
	setAttr ".tk[90]" -type "float3" -0.0097049465 -1.043239 0.10209166 ;
	setAttr ".tk[92]" -type "float3" 0.029336398 0.48843685 -0.0055024908 ;
	setAttr ".tk[96]" -type "float3" 0.008349495 0.22251958 -0.065149553 ;
	setAttr ".tk[97]" -type "float3" 0.0010714998 0.45640668 -0.082398854 ;
	setAttr ".tk[98]" -type "float3" 0.016728606 -0.40307745 -0.0085236542 ;
	setAttr ".tk[99]" -type "float3" 0.044951979 -0.47456414 0.036235921 ;
	setAttr ".tk[102]" -type "float3" -0.021622263 -0.28666401 -0.015611676 ;
	setAttr ".tk[109]" -type "float3" 0.084787786 -0.80191618 0.16310553 ;
	setAttr ".tk[112]" -type "float3" -0.0746115 -3.5527137e-15 0.049948033 ;
	setAttr ".tk[118]" -type "float3" -0.058828112 0 0.21574475 ;
	setAttr ".tk[119]" -type "float3" -0.058828112 0 0.21574475 ;
	setAttr ".tk[120]" -type "float3" -0.058828112 0 0.21574475 ;
	setAttr ".tk[121]" -type "float3" -0.058828112 0 0.21574475 ;
	setAttr ".tk[122]" -type "float3" -0.058828112 0 0.21574475 ;
	setAttr ".tk[137]" -type "float3" 0.063385442 -1.4022053 -0.045892559 ;
	setAttr ".tk[138]" -type "float3" -0.010576381 -0.96834552 0.065752879 ;
	setAttr ".tk[139]" -type "float3" 0.011794462 -1.12427 -0.065752879 ;
	setAttr ".tk[140]" -type "float3" 0.031078024 -1.1170186 -0.0042516747 ;
	setAttr ".tk[141]" -type "float3" -0.26898962 -1.9070604 0.80719018 ;
	setAttr ".tk[142]" -type "float3" -0.13969307 -1.6177719 0.72120476 ;
	setAttr ".tk[143]" -type "float3" -0.29099941 -1.4448193 0.66662979 ;
	setAttr ".tk[144]" -type "float3" -0.20391865 -1.6260879 0.49184355 ;
	setAttr ".tk[145]" -type "float3" -0.29405099 -1.4790781 0.41061866 ;
createNode polySplit -n "polySplit3";
	rename -uid "393FC9AD-CF49-739F-0066-108D9538FDC9";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483385 -2147483464;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit4";
	rename -uid "D8F3D7BC-2045-A166-92E7-C4BCE0209507";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483388 -2147483462;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace14";
	rename -uid "5B4A26FC-7242-3532-F668-83A3B3E38E5C";
	setAttr ".ics" -type "componentList" 5 "f[10]" "f[55]" "f[71]" "f[83]" "f[95]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 1.544566 2.0128741 0.44468555 ;
	setAttr ".rs" 1140885464;
	setAttr ".lt" -type "double3" 0.25111208103757943 3.8250652645288596e-16 0.24755877114672092 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.53047841787338257 -0.0089573105164251696 -0.12036903202533722 ;
	setAttr ".cbx" -type "double3" 2.5586535930633545 4.0347053913713093 1.0097401142120361 ;
createNode polyTweak -n "polyTweak11";
	rename -uid "68DAA53A-8144-3791-9081-0E9BC1230AC7";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[45]" -type "float3" 0.19938311 0 0 ;
	setAttr ".tk[46]" -type "float3" 0.19938311 0 0 ;
	setAttr ".tk[47]" -type "float3" 0.19938311 0 0 ;
	setAttr ".tk[48]" -type "float3" 0.19938311 0 0 ;
	setAttr ".tk[150]" -type "float3" 0.48262432 -1.2712556 0 ;
	setAttr ".tk[151]" -type "float3" 0.48262432 -1.2712556 0 ;
	setAttr ".tk[156]" -type "float3" -0.34567913 -1.7763568e-15 0.2332406 ;
	setAttr ".tk[157]" -type "float3" -0.22056682 -1.7763568e-15 0.10107099 ;
	setAttr ".tk[158]" -type "float3" -0.27885854 -1.7763568e-15 0.19442613 ;
	setAttr ".tk[159]" -type "float3" -0.22025494 -0.1735149 0.075284764 ;
	setAttr ".tk[160]" -type "float3" -0.35433 -1.4829003 0.25009856 ;
	setAttr ".tk[161]" -type "float3" -0.31647104 -1.6564152 0.1309572 ;
createNode polySplit -n "polySplit5";
	rename -uid "756F16D6-FC4F-D9A4-143A-7F92742BA06F";
	setAttr -s 2 ".e[0:1]"  0 1;
	setAttr -s 2 ".d[0:1]"  -2147483556 -2147483560;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace15";
	rename -uid "51CFE05A-314C-6BCA-9F9B-D8AF49F37218";
	setAttr ".ics" -type "componentList" 6 "f[5]" "f[45]" "f[58]" "f[66]" "f[78]" "f[90]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -1.8988211 2.0128736 0.68231165 ;
	setAttr ".rs" 1133072606;
	setAttr ".lt" -type "double3" 1.3877787807814457e-17 0 0.23497199500017965 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -3.4146292209625244 -0.0089582729152777683 -0.12037000805139542 ;
	setAttr ".cbx" -type "double3" -0.38301298022270203 4.0347053913713093 1.4849933385848999 ;
createNode polyTweak -n "polyTweak12";
	rename -uid "72212C99-524D-6D13-3C72-F4B3D299F851";
	setAttr ".uopa" yes;
	setAttr -s 19 ".tk";
	setAttr ".tk[45]" -type "float3" -0.49415207 0.14956537 0.49355465 ;
	setAttr ".tk[46]" -type "float3" -0.41119313 0.14956537 0.21864796 ;
	setAttr ".tk[48]" -type "float3" -0.41119313 0.14956543 0.21864796 ;
	setAttr ".tk[162]" -type "float3" 0.02149005 -0.022938542 -0.0099222902 ;
	setAttr ".tk[163]" -type "float3" -0.15437102 0.33876848 0.060554504 ;
	setAttr ".tk[164]" -type "float3" 0.22940961 -0.012017826 -0.14768618 ;
	setAttr ".tk[165]" -type "float3" -0.14443691 -0.43802196 -0.003421206 ;
	setAttr ".tk[166]" -type "float3" -0.18484211 -0.43802202 -0.15421505 ;
	setAttr ".tk[167]" -type "float3" 0.061661847 -0.1087965 -0.054952241 ;
	setAttr ".tk[168]" -type "float3" 0.027366364 -0.072379418 -0.095376544 ;
	setAttr ".tk[169]" -type "float3" 0.11821905 -0.041820168 -0.18846969 ;
	setAttr ".tk[170]" -type "float3" 0.14877641 -0.041819632 -0.074427783 ;
	setAttr ".tk[171]" -type "float3" 0.18971063 -0.14415041 -0.18135004 ;
	setAttr ".tk[172]" -type "float3" 0.2436395 -0.13033099 0.023318041 ;
	setAttr ".tk[173]" -type "float3" 0.20293373 -1.9673507 -0.081114382 ;
	setAttr ".tk[174]" -type "float3" 0.23707156 -1.9524027 0.049969424 ;
createNode polySplit -n "polySplit6";
	rename -uid "BC66A06B-A945-98C9-154C-CFB866E9D241";
	setAttr -s 2 ".e[0:1]"  0 1;
	setAttr -s 2 ".d[0:1]"  -2147483583 -2147483588;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace16";
	rename -uid "F90EAB84-1744-1185-CC6C-1D895D5EF9F9";
	setAttr ".ics" -type "componentList" 3 "f[7]" "f[68]" "f[80]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.25 1.3713895 1.0326189 ;
	setAttr ".rs" 1882814028;
	setAttr ".lt" -type "double3" -7.7715611723760958e-16 -0.086190619476818039 0.13607255648969979 ;
	setAttr ".ls" -type "double3" 1 0.17745207681347674 0.79898125804665321 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.5 0.0032499936043792229 0.56684094667434692 ;
	setAttr ".cbx" -type "double3" 0 2.739529123687054 1.4983967542648315 ;
createNode polyTweak -n "polyTweak13";
	rename -uid "B22371E4-4B4C-BECF-EEB3-96B489995E88";
	setAttr ".uopa" yes;
	setAttr -s 27 ".tk";
	setAttr ".tk[0]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[1]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[2]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[3]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[4]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[5]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[6]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[7]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[8]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[9]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[10]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[11]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[24]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[25]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[26]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[29]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[30]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[33]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[34]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[37]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[39]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[40]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[43]" -type "float3" 0 0.05159973 0 ;
	setAttr ".tk[49]" -type "float3" 0 0.051607031 0 ;
	setAttr ".tk[50]" -type "float3" 0 0.051605601 0 ;
	setAttr ".tk[150]" -type "float3" 0 -0.051607031 0 ;
	setAttr ".tk[151]" -type "float3" 0 -0.051607031 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace17";
	rename -uid "652F1BD3-EE4C-8537-919D-98A381B2ED87";
	setAttr ".ics" -type "componentList" 1 "f[190]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.31634462 0.14477044 1.3572398 ;
	setAttr ".rs" 1813096648;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.55246561765670776 0.0032499936043792229 1.2160830497741699 ;
	setAttr ".cbx" -type "double3" -0.080223642289638519 0.28629088540053549 1.4983967542648315 ;
createNode polyExtrudeFace -n "polyExtrudeFace18";
	rename -uid "E887457E-DC47-92B1-EA75-1AB4E61E4F20";
	setAttr ".ics" -type "componentList" 5 "f[3]" "f[42]" "f[64]" "f[76]" "f[88]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -1.434274 2.0189776 -1.5310133 ;
	setAttr ".rs" 1728666353;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -2.6785783767700195 0.0032499936043792229 -2.7347609996795654 ;
	setAttr ".cbx" -type "double3" -0.18996962904930115 4.0347053913713093 -0.32726559042930603 ;
createNode polyTweak -n "polyTweak14";
	rename -uid "A2ABE811-324B-C48E-9304-39B171F9A8B4";
	setAttr ".uopa" yes;
	setAttr -s 14 ".tk";
	setAttr ".tk[37]" -type "float3" 0.40784958 1.7881393e-07 -0.55076587 ;
	setAttr ".tk[38]" -type "float3" 0.26365927 1.0349628 -0.19765769 ;
	setAttr ".tk[175]" -type "float3" 0.11499795 0.058525443 0.15498438 ;
	setAttr ".tk[176]" -type "float3" -0.057231005 -0.094304353 0.11544564 ;
	setAttr ".tk[183]" -type "float3" 0 0 1.3654302 ;
	setAttr ".tk[184]" -type "float3" 0 0 1.3654302 ;
	setAttr ".tk[185]" -type "float3" -0.041553423 -0.058525439 0.8862139 ;
	setAttr ".tk[186]" -type "float3" 0.13067552 0.094304323 0.92575264 ;
createNode polyTweak -n "polyTweak15";
	rename -uid "4193FA01-9E4E-7627-DB82-989366F4D1C8";
	setAttr ".uopa" yes;
	setAttr -s 16 ".tk";
	setAttr ".tk[29]" -type "float3" -0.0061946264 0.28813058 0.16301918 ;
	setAttr ".tk[30]" -type "float3" 0.16477726 0.28813058 -0.0079527888 ;
	setAttr ".tk[31]" -type "float3" 0.56191057 0 0.55856764 ;
	setAttr ".tk[32]" -type "float3" 0.40178311 0 0.54642826 ;
	setAttr ".tk[187]" -type "float3" 0.1799783 0.52402955 0.38130423 ;
	setAttr ".tk[188]" -type "float3" 0.38707379 0.52402955 0.17420891 ;
	setAttr ".tk[189]" -type "float3" 0.49579081 0.84656137 0.31834841 ;
	setAttr ".tk[190]" -type "float3" 0.33538425 0.84620392 0.47736186 ;
	setAttr ".tk[191]" -type "float3" -0.17539638 0.54887038 -0.033419006 ;
	setAttr ".tk[192]" -type "float3" -0.015686247 0.54887038 -0.19312911 ;
	setAttr ".tk[193]" -type "float3" 0.033587307 -0.065948427 -0.028713495 ;
	setAttr ".tk[194]" -type "float3" -0.010780364 -0.065948665 0.015654057 ;
	setAttr ".tk[195]" -type "float3" 0.035845831 -0.082193255 -0.026457101 ;
	setAttr ".tk[196]" -type "float3" -0.0085218251 -0.082192183 0.01791048 ;
	setAttr ".tk[197]" -type "float3" 0.0017708987 -2.2050829 -0.015968353 ;
	setAttr ".tk[198]" -type "float3" -0.033979356 -2.2050829 0.019781813 ;
createNode polySplit -n "polySplit7";
	rename -uid "C8302F49-EA41-4949-8056-BF83D8915FA6";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483592 -2147483625;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit8";
	rename -uid "711BFBA5-4440-0CEF-CC2A-FC8F23DAC44A";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483595 -2147483624;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit9";
	rename -uid "BC301CE3-AD4C-3B67-ABED-538BE5665D5D";
	setAttr -s 3 ".e[0:2]"  0 0.712919 1;
	setAttr -s 3 ".d[0:2]"  -2147483623 -2147483292 -2147483585;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit10";
	rename -uid "B63BF412-3A47-CA33-4913-9A94F3B6612C";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483582 -2147483584;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit11";
	rename -uid "F1F5BB1F-8940-3AF9-0956-56B5AF0DB148";
	setAttr -s 4 ".e[0:3]"  0 0.57216698 1 1;
	setAttr -s 4 ".d[0:3]"  -2147483640 -2147483620 -2147483574 -2147483577;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyTweak -n "polyTweak16";
	rename -uid "2BDD8230-6445-F0B1-FCCF-EF97C3EB4B74";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk";
	setAttr ".tk[152]" -type "float3" -0.087243944 0.35490415 -0.15727995 ;
createNode deleteComponent -n "deleteComponent1";
	rename -uid "CEA24C94-3841-D07B-0A36-1FB94EC4DAE1";
	setAttr ".dc" -type "componentList" 1 "f[57]";
createNode deleteComponent -n "deleteComponent2";
	rename -uid "052643C6-9144-1CA2-E7B4-B49E8B82400C";
	setAttr ".dc" -type "componentList" 1 "f[6]";
createNode polyTweak -n "polyTweak17";
	rename -uid "D42C88BC-234E-1483-FC43-E69BEE203B87";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[152]" -type "float3" 0 -0.46189976 0.069754131 ;
	setAttr ".tk[153]" -type "float3" 0.1622715 -0.84470034 -0.040982846 ;
createNode deleteComponent -n "deleteComponent3";
	rename -uid "38A66E01-EA4E-B476-20A7-CBA9E4419DD6";
	setAttr ".dc" -type "componentList" 1 "f[219]";
createNode deleteComponent -n "deleteComponent4";
	rename -uid "A845C0A3-4E49-5E03-B906-2B82AB3947D6";
	setAttr ".dc" -type "componentList" 1 "f[217]";
createNode deleteComponent -n "deleteComponent5";
	rename -uid "425CA296-B142-AB31-80DC-8AAA37705236";
	setAttr ".dc" -type "componentList" 1 "f[217]";
createNode deleteComponent -n "deleteComponent6";
	rename -uid "42BFA7DC-B145-E378-998C-E3A9847F438A";
	setAttr ".dc" -type "componentList" 1 "f[213]";
createNode deleteComponent -n "deleteComponent7";
	rename -uid "5EE30F37-F64A-C879-99C6-3987BC474C8E";
	setAttr ".dc" -type "componentList" 1 "f[213]";
createNode deleteComponent -n "deleteComponent8";
	rename -uid "55B58E8A-D14E-337B-B703-91BC58D234C8";
	setAttr ".dc" -type "componentList" 1 "f[213]";
createNode deleteComponent -n "deleteComponent9";
	rename -uid "1A2D6CB7-D045-E360-2606-0199648C332F";
	setAttr ".dc" -type "componentList" 1 "f[57]";
createNode deleteComponent -n "deleteComponent10";
	rename -uid "2031AEFF-3D46-1962-73A0-FA946DDA3DBD";
	setAttr ".dc" -type "componentList" 1 "f[212]";
createNode deleteComponent -n "deleteComponent11";
	rename -uid "380C02A7-A844-422A-5DCA-38B9D576397D";
	setAttr ".dc" -type "componentList" 1 "f[195]";
createNode deleteComponent -n "deleteComponent12";
	rename -uid "F8950CB2-804C-A2FE-10E2-3692D26F10E6";
	setAttr ".dc" -type "componentList" 1 "f[18]";
createNode deleteComponent -n "deleteComponent13";
	rename -uid "7708C364-6F4F-ACAD-DD4F-8198A531D6DE";
	setAttr ".dc" -type "componentList" 1 "f[18]";
createNode deleteComponent -n "deleteComponent14";
	rename -uid "11EDDBF8-3141-474F-68F2-328309904D69";
	setAttr ".dc" -type "componentList" 1 "f[18]";
createNode deleteComponent -n "deleteComponent15";
	rename -uid "84FB248D-544C-4776-C7A7-209EB61C100F";
	setAttr ".dc" -type "componentList" 1 "f[46]";
createNode deleteComponent -n "deleteComponent16";
	rename -uid "A3E4D1D2-5B42-A851-9CAA-37A2273A9344";
	setAttr ".dc" -type "componentList" 1 "f[48]";
createNode deleteComponent -n "deleteComponent17";
	rename -uid "1668AA2D-DD40-823F-0D61-1AB1BDCD01FC";
	setAttr ".dc" -type "componentList" 1 "f[155]";
createNode deleteComponent -n "deleteComponent18";
	rename -uid "924CB36C-E54A-7723-D3E5-91B887530610";
	setAttr ".dc" -type "componentList" 1 "f[32]";
createNode deleteComponent -n "deleteComponent19";
	rename -uid "866F57BF-F341-5F57-C742-5A8E965AEE9A";
	setAttr ".dc" -type "componentList" 1 "f[11]";
createNode deleteComponent -n "deleteComponent20";
	rename -uid "574B8A83-4C4E-3E87-6693-13986C5D3AA8";
	setAttr ".dc" -type "componentList" 1 "f[17]";
createNode deleteComponent -n "deleteComponent21";
	rename -uid "61C7B3AE-BF43-CF15-6A5E-F4B058DF487E";
	setAttr ".dc" -type "componentList" 1 "f[17]";
createNode deleteComponent -n "deleteComponent22";
	rename -uid "BC214D7E-EE44-A16F-EF94-C8A4EBF14E96";
	setAttr ".dc" -type "componentList" 1 "f[13]";
createNode deleteComponent -n "deleteComponent23";
	rename -uid "C8C8E0AB-424D-A148-6778-E2BF7B4C03A9";
	setAttr ".dc" -type "componentList" 1 "f[12]";
createNode deleteComponent -n "deleteComponent24";
	rename -uid "C22A147B-624D-EC95-8E7E-76895FBA3308";
	setAttr ".dc" -type "componentList" 1 "f[11]";
createNode deleteComponent -n "deleteComponent25";
	rename -uid "F0E7713F-014C-5286-0519-1E8E2F9A4846";
	setAttr ".dc" -type "componentList" 1 "f[11]";
createNode deleteComponent -n "deleteComponent26";
	rename -uid "77E13E28-5240-9C1C-71D8-2F8CC85C2C96";
	setAttr ".dc" -type "componentList" 1 "f[12]";
createNode deleteComponent -n "deleteComponent27";
	rename -uid "4D7B3997-0C45-1124-52E8-56A0390882A1";
	setAttr ".dc" -type "componentList" 1 "f[11]";
createNode deleteComponent -n "deleteComponent28";
	rename -uid "E6F62BCE-AD40-79FD-FED5-FCB10DF86EC5";
	setAttr ".dc" -type "componentList" 1 "f[30]";
createNode deleteComponent -n "deleteComponent29";
	rename -uid "367842F4-D147-CF52-020A-3EA1FD2DED2F";
	setAttr ".dc" -type "componentList" 1 "f[32]";
createNode deleteComponent -n "deleteComponent30";
	rename -uid "EC28E7A8-1647-2760-910C-5797DF76475A";
	setAttr ".dc" -type "componentList" 1 "f[38]";
createNode deleteComponent -n "deleteComponent31";
	rename -uid "83C250F2-3445-6DDE-01DC-9CAED1BA5995";
	setAttr ".dc" -type "componentList" 1 "f[26]";
createNode deleteComponent -n "deleteComponent32";
	rename -uid "FEA3A687-6241-5888-184C-069062902AD1";
	setAttr ".dc" -type "componentList" 1 "e[3]";
createNode deleteComponent -n "deleteComponent33";
	rename -uid "D71A67B1-A042-1EA9-1DF2-A487510D81D4";
	setAttr ".dc" -type "componentList" 1 "e[3]";
createNode deleteComponent -n "deleteComponent34";
	rename -uid "AB0EF043-EC46-8B8A-E958-E385A4009A69";
	setAttr ".dc" -type "componentList" 2 "e[3]" "e[53:54]";
createNode deleteComponent -n "deleteComponent35";
	rename -uid "F48BEE74-5448-2909-86F1-7A95A64B6CF0";
	setAttr ".dc" -type "componentList" 2 "e[3]" "e[53:54]";
createNode deleteComponent -n "deleteComponent36";
	rename -uid "E4D63F6B-3B4F-20A4-2E0F-76BC85912234";
	setAttr ".dc" -type "componentList" 1 "vtx[8]";
createNode deleteComponent -n "deleteComponent37";
	rename -uid "3DD74E26-A64D-E942-7546-E6B6BF6B0386";
	setAttr ".dc" -type "componentList" 1 "f[38]";
createNode polyExtrudeFace -n "polyExtrudeFace19";
	rename -uid "92D4F033-E74E-2E90-BEE7-D98D0C421733";
	setAttr ".ics" -type "componentList" 1 "f[177]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -2.3258159 0.14918084 -2.3857625 ;
	setAttr ".rs" 404707041;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -2.513801097869873 0.071415035999669627 -2.5717418193817139 ;
	setAttr ".cbx" -type "double3" -2.1378304958343506 0.22694665064045713 -2.1997828483581543 ;
createNode polyTweak -n "polyTweak18";
	rename -uid "8E76C4EF-5446-A0F5-EC40-7A8F4854F0F7";
	setAttr ".uopa" yes;
	setAttr -s 21 ".tk";
	setAttr ".tk[4]" -type "float3" 0.10552411 0.14007528 0.071013227 ;
	setAttr ".tk[5]" -type "float3" 0.14357997 0.14007528 -0.071013227 ;
	setAttr ".tk[7]" -type "float3" -1.4901161e-08 0 0 ;
	setAttr ".tk[8]" -type "float3" -1.4901161e-08 0 0 ;
	setAttr ".tk[13]" -type "float3" -0.14357997 -0.14007549 0.071013227 ;
	setAttr ".tk[14]" -type "float3" -0.10552409 -0.14007549 -0.071013227 ;
	setAttr ".tk[31]" -type "float3" 0 1.1920929e-07 0 ;
	setAttr ".tk[35]" -type "float3" -0.0086534023 -2.9802322e-08 -0.3340444 ;
	setAttr ".tk[142]" -type "float3" 0 -0.51162988 0 ;
	setAttr ".tk[145]" -type "float3" -0.01952512 0.16003676 0.28496638 ;
createNode polyExtrudeFace -n "polyExtrudeFace20";
	rename -uid "873DA742-9149-8653-0A19-E8920EB89292";
	setAttr ".ics" -type "componentList" 3 "f[1]" "f[39]" "f[51]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.10111178 1.3713895 -1.1375194 ;
	setAttr ".rs" 503547202;
	setAttr ".lt" -type "double3" 1.457167719820518e-16 0.0031336219924698594 0.27075444449419467 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.29777643084526062 0.0032499936043792229 -1.7081977128982544 ;
	setAttr ".cbx" -type "double3" 0.5 2.739529123687054 -0.56684106588363647 ;
createNode polyTweak -n "polyTweak19";
	rename -uid "A13F8CF0-FD4E-3EE7-83DE-2EAB1C816FBF";
	setAttr ".uopa" yes;
	setAttr -s 13 ".tk";
	setAttr ".tk[165]" -type "float3" -0.097351708 -0.2003049 0.0099986764 ;
	setAttr ".tk[166]" -type "float3" -0.073986702 -0.10446358 -0.0025983695 ;
	setAttr ".tk[167]" -type "float3" -0.082333013 0.070772208 0.011110929 ;
	setAttr ".tk[173]" -type "float3" 0.09766151 -0.26073682 0.018465588 ;
	setAttr ".tk[175]" -type "float3" -0.037191998 -0.070222616 0.026231857 ;
	setAttr ".tk[176]" -type "float3" 0.0028010472 -0.18733275 0.0084703993 ;
	setAttr ".tk[191]" -type "float3" -0.45292899 -0.445191 0.029123053 ;
	setAttr ".tk[192]" -type "float3" -0.34643874 -0.445191 -0.077367067 ;
	setAttr ".tk[193]" -type "float3" -0.4649328 -0.80411518 -0.17394939 ;
	setAttr ".tk[194]" -type "float3" -0.55170137 -0.80411518 -0.087181047 ;
createNode polyTweak -n "polyTweak20";
	rename -uid "0575591A-2C41-98B0-9769-3DA532C122D9";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[1]" -type "float3" -0.13655782 0.19881779 -0.065602168 ;
	setAttr ".tk[2]" -type "float3" 0.14459342 0.19881779 0.098559268 ;
	setAttr ".tk[54]" -type "float3" -0.0050646644 0.12625873 -0.049416613 ;
	setAttr ".tk[55]" -type "float3" 0.041533343 0.12625873 -0.036930796 ;
	setAttr ".tk[195]" -type "float3" -0.19289915 -0.24485651 0.26265106 ;
	setAttr ".tk[196]" -type "float3" 0.15646271 -0.24485651 0.46664006 ;
	setAttr ".tk[197]" -type "float3" 0.040965416 1.8347991 0.33474916 ;
	setAttr ".tk[198]" -type "float3" -0.20571893 1.8347991 0.29396129 ;
	setAttr ".tk[199]" -type "float3" 0.035693482 -0.068692528 0.30693364 ;
	setAttr ".tk[200]" -type "float3" -0.12576917 -0.068692707 0.28023672 ;
	setAttr ".tk[201]" -type "float3" 0.0018939767 -2.1131902 0.34669814 ;
	setAttr ".tk[202]" -type "float3" -0.16053122 -2.1131902 0.32000157 ;
createNode polySplit -n "polySplit12";
	rename -uid "CEFEC3B7-4542-94FC-2FDC-F49DA3EA6035";
	setAttr -s 2 ".e[0:1]"  1 0;
	setAttr -s 2 ".d[0:1]"  -2147483625 -2147483627;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode deleteComponent -n "deleteComponent38";
	rename -uid "06A07E5E-DB4B-0966-C8B7-AD9540BFF751";
	setAttr ".dc" -type "componentList" 1 "f[202]";
createNode polySplit -n "polySplit13";
	rename -uid "F9ECA56D-1347-9901-C920-73A850F40707";
	setAttr -s 2 ".e[0:1]"  0 1;
	setAttr -s 2 ".d[0:1]"  -2147483637 -2147483624;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode deleteComponent -n "deleteComponent39";
	rename -uid "7DB4090D-6946-73ED-700B-B994CC49CFF8";
	setAttr ".dc" -type "componentList" 1 "f[202]";
createNode script -n "uiConfigurationScriptNode";
	rename -uid "815348DA-D24D-92F1-71CE-9DA416FB38D4";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 584\n            -height 338\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 584\n            -height 338\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 584\n            -height 338\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1175\n            -height 720\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n"
		+ "            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n"
		+ "            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"0\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n"
		+ "                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n"
		+ "                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n"
		+ "                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n"
		+ "                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -highlightConnections 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n"
		+ "            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n"
		+ "\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1175\\n    -height 720\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1175\\n    -height 720\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "A5622A72-A24D-7A3D-9F55-518B19AD87FA";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode polyTweak -n "polyTweak21";
	rename -uid "1B09FA77-3841-EB5A-1693-91B2105DB9AD";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[21]" -type "float3" 0 7.4505806e-09 -1.4901161e-08 ;
	setAttr ".tk[23]" -type "float3" -0.31009573 0.7289862 0.015344809 ;
	setAttr ".tk[24]" -type "float3" 0.0028231046 0.036416329 0.02086602 ;
createNode deleteComponent -n "deleteComponent40";
	rename -uid "F9D9AEC3-9E44-04A3-D5F9-86A8067A0D07";
	setAttr ".dc" -type "componentList" 1 "f[190]";
createNode polyAppend -n "polyAppend1";
	rename -uid "93D69411-CB4B-CB41-1FB1-72B36392F449";
	setAttr -s 2 ".d[0:1]"  -2147483626 -2147483247;
	setAttr ".tx" 1;
createNode polyTweak -n "polyTweak22";
	rename -uid "F01DFB43-4C48-5A4C-88E3-D6A1A6A48774";
	setAttr ".uopa" yes;
	setAttr ".tk[11]" -type "float3"  -0.085614055 -0.50224793 0.01756325;
createNode polySplit -n "polySplit14";
	rename -uid "AB1898EF-B34C-1E1B-29AA-ABAE9D412785";
	setAttr -s 2 ".e[0:1]"  1 1;
	setAttr -s 2 ".d[0:1]"  -2147483635 -2147483264;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polySplit -n "polySplit15";
	rename -uid "245AA6DC-CC44-D92B-7FA5-1EA5A1D623F4";
	setAttr -s 2 ".e[0:1]"  1 1;
	setAttr -s 2 ".d[0:1]"  -2147483636 -2147483265;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode polyExtrudeFace -n "polyExtrudeFace21";
	rename -uid "F5F2DE50-0144-E476-3EA8-8CA02C90DD36";
	setAttr ".ics" -type "componentList" 1 "f[20:21]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.10241576 7.4619517 -1.0076979 ;
	setAttr ".rs" 817289487;
	setAttr ".lt" -type "double3" 0.025871754532348579 0.10253729336154156 0.20060068833412989 ;
	setAttr ".lr" -type "double3" -35.158222474593444 -23.586591170449054 1.5782354423699214 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.051088999956846237 7.4076941543075518 -1.1401749849319458 ;
	setAttr ".cbx" -type "double3" 0.25592052936553955 7.516209313547848 -0.87522095441818237 ;
createNode polyTweak -n "polyTweak23";
	rename -uid "4D311629-EC41-7C07-809A-EEAA149D25B1";
	setAttr ".uopa" yes;
	setAttr -s 6 ".tk";
	setAttr ".tk[136]" -type "float3" 0 -0.61417592 0 ;
	setAttr ".tk[137]" -type "float3" 0 -0.61417592 0 ;
	setAttr ".tk[138]" -type "float3" 0 -0.61417592 0 ;
	setAttr ".tk[139]" -type "float3" 0 -0.61417592 0 ;
	setAttr ".tk[195]" -type "float3" 0 0.65777719 0.11864749 ;
	setAttr ".tk[196]" -type "float3" 0 0.65777719 0.11864749 ;
createNode polyExtrudeFace -n "polyExtrudeFace22";
	rename -uid "0F92CC70-0646-A4BE-C707-619F8493701B";
	setAttr ".ics" -type "componentList" 1 "f[20:21]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.017567135 7.731832 -1.3135982 ;
	setAttr ".rs" 1590349425;
	setAttr ".lt" -type "double3" 1.1102230246251565e-15 -1.4085954624931674e-15 0.27402168622771106 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.16863015294075012 7.5999164954726659 -1.4021725654602051 ;
	setAttr ".cbx" -type "double3" 0.13349588215351105 7.8637479669818688 -1.2250237464904785 ;
createNode polyTweak -n "polyTweak24";
	rename -uid "E7C7DE15-2343-7B3E-DEF7-C5918D948E08";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[113]" -type "float3" -0.12229788 0 -0.069941849 ;
	setAttr ".tk[116]" -type "float3" -0.036122132 0 0 ;
	setAttr ".tk[136]" -type "float3" -0.08264412 -0.35473737 -0.069941849 ;
	setAttr ".tk[137]" -type "float3" 0.039653774 -0.35473737 0 ;
	setAttr ".tk[138]" -type "float3" 0.039653774 -0.35473737 0 ;
	setAttr ".tk[139]" -type "float3" 0.0035316371 -0.35473737 0 ;
	setAttr ".tk[203]" -type "float3" -0.12229788 0 -0.069941849 ;
	setAttr ".tk[204]" -type "float3" -0.10456449 0.28954697 -0.092519164 ;
	setAttr ".tk[205]" -type "float3" -0.10456452 0.28954506 -0.092519164 ;
	setAttr ".tk[206]" -type "float3" -0.036122132 0 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace23";
	rename -uid "BF2C6C82-514A-7058-0AA9-12A599262A1E";
	setAttr ".ics" -type "componentList" 1 "f[21]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.033955105 7.6651201 -1.6769722 ;
	setAttr ".rs" 1942373750;
	setAttr ".lt" -type "double3" 1.6653345369377348e-16 -2.1510571102112408e-15 0.61838714697697794 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.086223304271697998 7.5800369027517451 -1.7149280309677124 ;
	setAttr ".cbx" -type "double3" 0.15413351356983185 7.7502037978252236 -1.6390162706375122 ;
createNode polyTweak -n "polyTweak25";
	rename -uid "54F0C1BB-5C49-2AB1-A231-DA9E7657C641";
	setAttr ".uopa" yes;
	setAttr -s 14 ".tk";
	setAttr ".tk[136]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[137]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[138]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[139]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[203]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[204]" -type "float3" 2.9802322e-08 -0.85267532 0 ;
	setAttr ".tk[205]" -type "float3" 0.080410421 -0.71081448 0.085520387 ;
	setAttr ".tk[206]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[207]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[208]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[209]" -type "float3" 0.10789624 -0.61081982 0.1164515 ;
	setAttr ".tk[210]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[211]" -type "float3" 0 -0.85267532 0 ;
	setAttr ".tk[212]" -type "float3" 0.061769217 -0.45675933 0.12604833 ;
createNode polyExtrudeFace -n "polyExtrudeFace24";
	rename -uid "B8E3000F-AC46-FEE3-3A4B-268C8CBF2D6B";
	setAttr ".ics" -type "componentList" 1 "f[21]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.19496088 7.5674815 -2.1745403 ;
	setAttr ".rs" 495378846;
	setAttr ".lt" -type "double3" 0.1231990632557301 0.12159201335502171 0.97278163680641372 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.28987094759941101 7.4829086493202475 -2.2564408779144287 ;
	setAttr ".cbx" -type "double3" -0.10005082190036774 7.6520539491985149 -2.092639684677124 ;
createNode polyTweak -n "polyTweak26";
	rename -uid "A648950E-9244-F89F-79E9-44816B965AFF";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk[213:215]" -type "float3"  0.040648736 0.013897845 0.20233124
		 -0.056158092 -0.15912957 0.14155111 -0.0056213923 0.22665903 0.22944036;
createNode polyExtrudeFace -n "polyExtrudeFace25";
	rename -uid "7E914B12-5C4D-5117-D697-4FABE728ECA3";
	setAttr ".ics" -type "componentList" 1 "f[20]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.3355101 7.7604017 -1.4714246 ;
	setAttr ".rs" 418206560;
	setAttr ".lt" -type "double3" 1.1102230246251565e-16 3.3653635433950058e-16 0.60301592850163299 ;
	setAttr ".lr" -type "double3" 56.028341798941909 13.328062598380621 19.443763013807043 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.41189852356910706 7.6570951424497888 -1.5234694480895996 ;
	setAttr ".cbx" -type "double3" -0.25912165641784668 7.8637082583347055 -1.419379711151123 ;
createNode polyTweak -n "polyTweak27";
	rename -uid "A4FC29CD-CB42-3954-369D-268188372D39";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[216]" -type "float3" 0 -0.20317163 0 ;
	setAttr ".tk[217]" -type "float3" 0 0.20317163 0 ;
	setAttr ".tk[218]" -type "float3" 0 0.084703028 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace26";
	rename -uid "A5A6F53B-6348-C0E7-3CDD-89B72E34DFCC";
	setAttr ".ics" -type "componentList" 1 "f[20]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.73910207 7.9574289 -1.7699221 ;
	setAttr ".rs" 1181603564;
	setAttr ".lt" -type "double3" 1.3877787807814457e-17 4.4408920985006262e-15 0.92747610366828748 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.8412787914276123 7.9002672878028584 -1.828261137008667 ;
	setAttr ".cbx" -type "double3" -0.6369253396987915 8.0145902879254631 -1.711583137512207 ;
createNode polyTweak -n "polyTweak28";
	rename -uid "3BA07558-2D42-CE2A-08B5-A6AED31E4932";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk[219:221]" -type "float3"  -0.10084575 0.69587409 0.3005957
		 -0.10084575 0.69587409 0.3005957 -0.10084575 0.69587409 0.3005957;
createNode polyExtrudeFace -n "polyExtrudeFace27";
	rename -uid "F0416F63-8241-10CD-D2A8-D29889A6CB9A";
	setAttr ".ics" -type "componentList" 1 "f[16:17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.25477952 7.2112336 -0.45573553 ;
	setAttr ".rs" 48427483;
	setAttr ".lt" -type "double3" -0.11518923574381532 -0.6127149932708158 0.3 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.40153896808624268 7.1514772671266016 -0.58301758766174316 ;
	setAttr ".cbx" -type "double3" -0.10802006721496582 7.2709899166927174 -0.32845348119735718 ;
createNode polyTweak -n "polyTweak29";
	rename -uid "03399B3E-EC43-05F3-1AF6-B1A786C4DB82";
	setAttr ".uopa" yes;
	setAttr -s 15 ".tk";
	setAttr ".tk[207]" -type "float3" 0 -0.44102183 0 ;
	setAttr ".tk[208]" -type "float3" 0 -0.63954067 0 ;
	setAttr ".tk[209]" -type "float3" 0 -0.44102183 0 ;
	setAttr ".tk[216]" -type "float3" -0.022959592 -0.075424574 -0.00088089146 ;
	setAttr ".tk[217]" -type "float3" -0.046390031 0.075424574 0.040031273 ;
	setAttr ".tk[218]" -type "float3" 0.046390031 0.031445757 -0.040031273 ;
	setAttr ".tk[219]" -type "float3" 0 -0.44102183 0 ;
	setAttr ".tk[220]" -type "float3" 0 -0.63954067 0 ;
	setAttr ".tk[221]" -type "float3" 0 -0.44102183 0 ;
	setAttr ".tk[222]" -type "float3" 0.059379563 -0.58143723 -0.029809525 ;
	setAttr ".tk[223]" -type "float3" -0.059379563 -0.65544116 -0.033903465 ;
	setAttr ".tk[224]" -type "float3" 0.025185853 -0.30060488 0.033903465 ;
createNode polyExtrudeFace -n "polyExtrudeFace28";
	rename -uid "1B726264-7842-877B-677B-6BB0945F9610";
	setAttr ".ics" -type "componentList" 1 "f[17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.070810214 7.4740748 0.12956741 ;
	setAttr ".rs" 549057176;
	setAttr ".lt" -type "double3" 2.7755575615628914e-17 1.4988010832439613e-15 0.6182760101821585 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.14439690113067627 7.4127998741104664 0.023491337895393372 ;
	setAttr ".cbx" -type "double3" 0.0027764663100242615 7.5353497839499726 0.23564349114894867 ;
createNode polyTweak -n "polyTweak30";
	rename -uid "318B8E35-404F-1AF5-41C7-D89CFEE4E301";
	setAttr ".uopa" yes;
	setAttr -s 9 ".tk";
	setAttr ".tk[132]" -type "float3" 0.041050889 -0.054026105 -0.069027491 ;
	setAttr ".tk[134]" -type "float3" -0.090473726 -3.5527137e-15 0 ;
	setAttr ".tk[135]" -type "float3" 0.0004278007 -7.1054274e-15 0 ;
	setAttr ".tk[225]" -type "float3" 0.13147686 -0.8496365 -0.27954763 ;
	setAttr ".tk[226]" -type "float3" 0.075193621 -0.84963661 -0.27022284 ;
	setAttr ".tk[227]" -type "float3" -0.0011189659 -0.8496365 -0.26560071 ;
	setAttr ".tk[228]" -type "float3" 0.024217224 -0.9389714 0 ;
	setAttr ".tk[229]" -type "float3" 0 -0.96539122 0 ;
	setAttr ".tk[230]" -type "float3" 0 -0.35190803 0.020762596 ;
createNode polyExtrudeFace -n "polyExtrudeFace29";
	rename -uid "387D022D-4141-2EB1-EB6B-75872083D709";
	setAttr ".ics" -type "componentList" 1 "f[16]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.150785 7.5922885 -0.31341496 ;
	setAttr ".rs" 219316843;
	setAttr ".lt" -type "double3" -0.061043111321104737 -0.54568325414286911 0.25188364954850118 ;
	setAttr ".lr" -type "double3" 45.306636707443886 20.550867875708832 35.411408412402423 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.22834606468677521 7.5325318237052352 -0.40632426738739014 ;
	setAttr ".cbx" -type "double3" -0.07322392612695694 7.6520449245059776 -0.22050562500953674 ;
createNode polyTweak -n "polyTweak31";
	rename -uid "53F698A2-764F-308B-CC5F-B1B57EE4B01F";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[231]" -type "float3" 0.09302026 -1.1747388 0.34203562 ;
	setAttr ".tk[232]" -type "float3" 0.09302026 -1.1747388 0.34203562 ;
	setAttr ".tk[233]" -type "float3" 0.09302026 -1.1747388 0.34203562 ;
createNode polyExtrudeFace -n "polyExtrudeFace30";
	rename -uid "087F290A-CF43-B2EA-9BF8-1DA64EE45899";
	setAttr ".ics" -type "componentList" 1 "f[16]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.05091821 8.0485172 0.1668736 ;
	setAttr ".rs" 588109582;
	setAttr ".lt" -type "double3" -3.219646771412954e-15 -6.8695049648681561e-16 0.81299945803346507 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.0070187672972679138 7.9631748096025889 0.071407198905944824 ;
	setAttr ".cbx" -type "double3" 0.094817653298377991 8.1338597220277009 0.2623400092124939 ;
createNode polyTweak -n "polyTweak32";
	rename -uid "96053187-A045-6C09-00E3-1FA2D84D03AE";
	setAttr ".uopa" yes;
	setAttr -s 2 ".tk";
	setAttr ".tk[226]" -type "float3" 0 -0.44596013 0 ;
createNode polyExtrudeFace -n "polyExtrudeFace31";
	rename -uid "AD393151-BE4A-DB6A-DAB4-5BA99FC8C057";
	setAttr ".ics" -type "componentList" 1 "f[11:12]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.40459266 6.8466215 -1.8978429 ;
	setAttr ".rs" 1473397099;
	setAttr ".lt" -type "double3" 0.157064731488786 0.21494801995512802 0.3841596604296702 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.32683682441711426 6.7479169322987262 -2.0150609016418457 ;
	setAttr ".cbx" -type "double3" 0.48234850168228149 6.9453257642649628 -1.7806248664855957 ;
createNode polyTweak -n "polyTweak33";
	rename -uid "25D7686A-3741-B3F4-80F3-33BD5955FE93";
	setAttr ".uopa" yes;
	setAttr -s 34 ".tk";
	setAttr ".tk[127]" -type "float3" 0.068925135 -0.050062034 -0.11073703 ;
	setAttr ".tk[128]" -type "float3" 0.02716946 -0.61321378 -0.038026124 ;
	setAttr ".tk[129]" -type "float3" 0.07298582 -0.12408593 -0.094822414 ;
	setAttr ".tk[130]" -type "float3" 0.051064029 -0.53545618 -0.035996974 ;
	setAttr ".tk[136]" -type "float3" -0.19471306 0 0 ;
	setAttr ".tk[137]" -type "float3" -0.19471306 0 0 ;
	setAttr ".tk[138]" -type "float3" -0.19471306 0 0 ;
	setAttr ".tk[139]" -type "float3" -0.19471306 0 0 ;
	setAttr ".tk[203]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[204]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[205]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[206]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[207]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[208]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[209]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[210]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[211]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[212]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[213]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[214]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[215]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[216]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[217]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[218]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[219]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[220]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[221]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[222]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[223]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[224]" -type "float3" -0.34148276 -0.50990719 0 ;
	setAttr ".tk[235]" -type "float3" 0 0 -0.14197089 ;
	setAttr ".tk[237]" -type "float3" -0.64892638 0.79930449 0.064844877 ;
	setAttr ".tk[238]" -type "float3" -0.67454875 1.1698987 -0.039744914 ;
	setAttr ".tk[239]" -type "float3" -0.68538302 1.2638625 0.13204969 ;
createNode polyExtrudeFace -n "polyExtrudeFace32";
	rename -uid "1C3D2693-5748-5AE1-792B-798F2612A302";
	setAttr ".ics" -type "componentList" 1 "f[11:12]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.62892234 6.8951774 -2.3733261 ;
	setAttr ".rs" 1032102242;
	setAttr ".lt" -type "double3" -5.8286708792820718e-16 4.2327252813834093e-15 0.43243626651477463 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.53494811058044434 6.8286256601280622 -2.4573702812194824 ;
	setAttr ".cbx" -type "double3" 0.7228965163230896 6.9617294966551846 -2.2892816066741943 ;
createNode polyTweak -n "polyTweak34";
	rename -uid "ABA4DC12-294A-8D8A-6430-219E38398A4E";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[104]" -type "float3" 0.1334874 7.1054274e-15 0 ;
	setAttr ".tk[127]" -type "float3" 0.14578779 -1.1680917 -0.1146019 ;
	setAttr ".tk[128]" -type "float3" 0.080438122 -0.81106973 -0.074431904 ;
	setAttr ".tk[129]" -type "float3" 0.15995392 -1.0735617 -0.10255687 ;
	setAttr ".tk[130]" -type "float3" 0.056848124 -0.89993966 -0.069407471 ;
	setAttr ".tk[240]" -type "float3" 0.20135356 -1.2709444 0.00021132472 ;
	setAttr ".tk[241]" -type "float3" 0.25374699 -0.51745987 0.05203015 ;
	setAttr ".tk[242]" -type "float3" 0.32239318 -0.98873973 -0.024198256 ;
	setAttr ".tk[243]" -type "float3" 0.23662256 -0.66791493 0.063797943 ;
createNode polyExtrudeFace -n "polyExtrudeFace33";
	rename -uid "C94CBC17-044F-E06E-78F0-E0968175639F";
	setAttr ".ics" -type "componentList" 1 "f[12]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.55021292 7.3943501 -2.6000595 ;
	setAttr ".rs" 788100704;
	setAttr ".lt" -type "double3" -1.2420620087993939e-15 1.1102230246251565e-16 0.43456597646803613 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.45810484886169434 7.3513918049757896 -2.6841039657592773 ;
	setAttr ".cbx" -type "double3" 0.64232099056243896 7.4373086828683377 -2.5160152912139893 ;
createNode polyExtrudeFace -n "polyExtrudeFace34";
	rename -uid "3C7647E2-8942-8A13-66C2-62883E1D60D2";
	setAttr ".ics" -type "componentList" 1 "f[17]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.45567146 7.9846115 0.37977719 ;
	setAttr ".rs" 919302959;
	setAttr ".lt" -type "double3" 0.15065744547949295 -1.6514567491299204e-15 0.26630014122123757 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.54098761081695557 7.9330278241821093 0.2708471417427063 ;
	setAttr ".cbx" -type "double3" -0.37035530805587769 8.0361954018594943 0.48870724439620972 ;
createNode polyTweak -n "polyTweak35";
	rename -uid "3A9A1122-0248-B9EB-0EDC-1D90CBDFC72D";
	setAttr ".uopa" yes;
	setAttr -s 125 ".tk";
	setAttr ".tk[65]" -type "float3" 0.08280658 1.1423272 -0.22596437 ;
	setAttr ".tk[66]" -type "float3" 0.078961603 0.90054125 -0.21318322 ;
	setAttr ".tk[67]" -type "float3" 0.083017342 0.62619942 -0.19640332 ;
	setAttr ".tk[68]" -type "float3" 0.093887687 0.39280793 -0.18012059 ;
	setAttr ".tk[69]" -type "float3" 0.10865962 0.26290634 -0.16869812 ;
	setAttr ".tk[70]" -type "float3" 0.12337495 0.27130067 -0.1651964 ;
	setAttr ".tk[71]" -type "float3" 0.13409081 0.41574228 -0.17055391 ;
	setAttr ".tk[72]" -type "float3" 0.13793591 0.6575278 -0.18333504 ;
	setAttr ".tk[73]" -type "float3" 0.13387993 0.93187124 -0.20011505 ;
	setAttr ".tk[74]" -type "float3" 0.12300945 1.1652625 -0.21639779 ;
	setAttr ".tk[75]" -type "float3" 0.10823762 1.2951643 -0.22782041 ;
	setAttr ".tk[76]" -type "float3" 0.093522549 1.2867699 -0.23132187 ;
	setAttr ".tk[77]" -type "float3" -0.1968541 0.91210663 -0.28847182 ;
	setAttr ".tk[78]" -type "float3" -0.16005851 0.79002953 -0.27153754 ;
	setAttr ".tk[79]" -type "float3" -0.15202597 0.52314937 -0.25410831 ;
	setAttr ".tk[80]" -type "float3" -0.079822108 1.2338488 -0.22344911 ;
	setAttr ".tk[81]" -type "float3" -0.13292219 0.12133185 -0.22596972 ;
	setAttr ".tk[82]" -type "float3" -0.15478697 0.10669482 -0.23104909 ;
	setAttr ".tk[83]" -type "float3" -0.1258307 0.20389047 -0.22877054 ;
	setAttr ".tk[84]" -type "float3" -0.12981056 0.42138383 -0.24228017 ;
	setAttr ".tk[85]" -type "float3" -0.13784286 0.68826759 -0.25970963 ;
	setAttr ".tk[86]" -type "float3" -0.16332684 0.91580021 -0.27961159 ;
	setAttr ".tk[87]" -type "float3" -0.18591963 1.0541389 -0.29363245 ;
	setAttr ".tk[88]" -type "float3" -0.14173181 1.1425548 -0.28673077 ;
	setAttr ".tk[89]" -type "float3" -0.38948381 0.73256534 -0.33032835 ;
	setAttr ".tk[90]" -type "float3" -0.39891204 0.2784175 -0.30691826 ;
	setAttr ".tk[91]" -type "float3" -0.39963013 0.026020736 -0.2926845 ;
	setAttr ".tk[92]" -type "float3" -0.37638181 -0.17361993 -0.27498195 ;
	setAttr ".tk[93]" -type "float3" -0.36106852 -0.21824673 -0.26828757 ;
	setAttr ".tk[94]" -type "float3" -0.35109022 -0.26758057 -0.2627677 ;
	setAttr ".tk[95]" -type "float3" -0.38257873 -0.065132007 -0.28286016 ;
	setAttr ".tk[96]" -type "float3" -0.38598135 0.12082313 -0.29441088 ;
	setAttr ".tk[97]" -type "float3" -0.37785029 0.43046945 -0.30991167 ;
	setAttr ".tk[98]" -type "float3" -0.40134078 0.55827063 -0.32357314 ;
	setAttr ".tk[99]" -type "float3" -0.35984552 0.84445572 -0.32870522 ;
	setAttr ".tk[100]" -type "float3" -0.41427138 0.7158671 -0.33608061 ;
	setAttr ".tk[101]" -type "float3" -0.50653118 0.53614855 -0.35076985 ;
	setAttr ".tk[102]" -type "float3" -0.43755335 0.24429184 -0.31766379 ;
	setAttr ".tk[103]" -type "float3" -0.49237269 0.31557745 -0.33433014 ;
	setAttr ".tk[104]" -type "float3" -0.5046367 0.10370153 -0.32553673 ;
	setAttr ".tk[105]" -type "float3" -0.36114368 0.72348982 -0.32214159 ;
	setAttr ".tk[106]" -type "float3" -0.28011489 0.67223346 -0.29728752 ;
	setAttr ".tk[107]" -type "float3" -0.33039254 0.37535977 -0.29392061 ;
	setAttr ".tk[108]" -type "float3" -0.52448297 -0.25109231 -0.31062514 ;
	setAttr ".tk[109]" -type "float3" -0.54993981 -0.40982184 -0.30843908 ;
	setAttr ".tk[110]" -type "float3" -0.53147209 -0.04496593 -0.3242991 ;
	setAttr ".tk[111]" -type "float3" -0.54240721 -0.26008382 -0.31496057 ;
	setAttr ".tk[112]" -type "float3" -0.52012962 -0.036821529 -0.32169563 ;
	setAttr ".tk[113]" -type "float3" -0.55495018 0.29253516 -0.34994465 ;
	setAttr ".tk[114]" -type "float3" -0.5628801 0.56482047 -0.36765513 ;
	setAttr ".tk[115]" -type "float3" -0.54092079 0.28592521 -0.34577069 ;
	setAttr ".tk[116]" -type "float3" -0.56694698 0.55336183 -0.36810037 ;
	setAttr ".tk[117]" -type "float3" 0.0098474668 0.65343058 -0.21775766 ;
	setAttr ".tk[118]" -type "float3" 0.00055677444 0.92379183 -0.23572648 ;
	setAttr ".tk[119]" -type "float3" -0.097443044 0.90897155 -0.26139504 ;
	setAttr ".tk[120]" -type "float3" -0.079240605 0.4154942 -0.22826083 ;
	setAttr ".tk[121]" -type "float3" -0.23966262 0.53655159 -0.27858627 ;
	setAttr ".tk[122]" -type "float3" -0.24609861 0.72383797 -0.29103374 ;
	setAttr ".tk[123]" -type "float3" -0.3048099 0.6970306 -0.30538669 ;
	setAttr ".tk[124]" -type "float3" -0.29234812 0.37747946 -0.28374815 ;
	setAttr ".tk[125]" -type "float3" -0.32090122 0.41357136 -0.29353702 ;
	setAttr ".tk[126]" -type "float3" -0.32637227 0.59535474 -0.30540857 ;
	setAttr ".tk[127]" -type "float3" -0.55330175 -0.08001554 -0.30938166 ;
	setAttr ".tk[128]" -type "float3" -0.54442179 -0.25071663 -0.298094 ;
	setAttr ".tk[129]" -type "float3" -0.56700557 -0.12249714 -0.30776149 ;
	setAttr ".tk[130]" -type "float3" -0.55311716 -0.29677254 -0.29427209 ;
	setAttr ".tk[131]" -type "float3" -0.59499127 -0.19261225 -0.3330453 ;
	setAttr ".tk[132]" -type "float3" -0.64906657 -0.18342289 -0.34820196 ;
	setAttr ".tk[133]" -type "float3" -0.62826145 0.092603572 -0.35835135 ;
	setAttr ".tk[134]" -type "float3" -0.64118516 -0.12353477 -0.34949279 ;
	setAttr ".tk[135]" -type "float3" -0.62242967 0.16335636 -0.36081803 ;
	setAttr ".tk[136]" -type "float3" -0.66188413 -0.13611498 -0.35437417 ;
	setAttr ".tk[137]" -type "float3" -0.6685496 0.11943012 -0.37078574 ;
	setAttr ".tk[138]" -type "float3" -0.64659059 -0.15946615 -0.34890139 ;
	setAttr ".tk[139]" -type "float3" -0.67114908 0.091566026 -0.36989638 ;
	setAttr ".tk[203]" -type "float3" -0.7191208 -0.51348394 -0.34828845 ;
	setAttr ".tk[204]" -type "float3" -0.74868834 -0.40717822 -0.36236548 ;
	setAttr ".tk[205]" -type "float3" -0.69265878 -0.44973558 -0.34477299 ;
	setAttr ".tk[206]" -type "float3" -0.72424155 -0.25892347 -0.36422586 ;
	setAttr ".tk[207]" -type "float3" -0.74398941 -0.82024443 -0.33748147 ;
	setAttr ".tk[208]" -type "float3" -0.76269597 -0.70824134 -0.34894562 ;
	setAttr ".tk[209]" -type "float3" -0.7222845 -0.72394156 -0.33711407 ;
	setAttr ".tk[210]" -type "float3" -0.7871623 -0.50316918 -0.36728823 ;
	setAttr ".tk[211]" -type "float3" -0.76271516 -0.35491401 -0.36914846 ;
	setAttr ".tk[212]" -type "float3" -0.74255025 -0.55921876 -0.35201353 ;
	setAttr ".tk[213]" -type "float3" -0.78319192 -0.78208214 -0.35026997 ;
	setAttr ".tk[214]" -type "float3" -0.74946988 -0.73967165 -0.34357029 ;
	setAttr ".tk[215]" -type "float3" -0.74760294 -0.88092637 -0.33499044 ;
	setAttr ".tk[216]" -type "float3" -0.82509196 -1.6134735 -0.31408107 ;
	setAttr ".tk[217]" -type "float3" -0.81921685 -1.5977541 -0.31339028 ;
	setAttr ".tk[218]" -type "float3" -0.81494904 -1.6682286 -0.30820692 ;
	setAttr ".tk[219]" -type "float3" -0.8013829 -1.3492407 -0.32277101 ;
	setAttr ".tk[220]" -type "float3" -0.7951051 -1.1443192 -0.33278656 ;
	setAttr ".tk[221]" -type "float3" -0.78189731 -1.3104997 -0.31971341 ;
	setAttr ".tk[222]" -type "float3" -0.99986327 -1.5591002 -0.36447701 ;
	setAttr ".tk[223]" -type "float3" -0.99723339 -1.4732678 -0.36867219 ;
	setAttr ".tk[224]" -type "float3" -0.99170125 -1.5428736 -0.36319643 ;
	setAttr ".tk[225]" -type "float3" -0.7320323 -0.03277564 -0.37926131 ;
	setAttr ".tk[226]" -type "float3" -0.70180583 0.096594691 -0.37847838 ;
	setAttr ".tk[227]" -type "float3" -0.70833659 0.14070861 -0.38276723 ;
	setAttr ".tk[228]" -type "float3" -0.6770193 0.22729424 -0.37924302 ;
	setAttr ".tk[229]" -type "float3" -0.65356064 0.4041186 -0.38300401 ;
	setAttr ".tk[230]" -type "float3" -0.69196606 0.32218874 -0.38871187 ;
	setAttr ".tk[231]" -type "float3" -0.7259174 0.70249891 -0.41963816 ;
	setAttr ".tk[232]" -type "float3" -0.7024585 0.87932354 -0.42339879 ;
	setAttr ".tk[233]" -type "float3" -0.74086392 0.79739332 -0.42910677 ;
	setAttr ".tk[234]" -type "float3" -0.82587671 0.30073059 -0.42371732 ;
	setAttr ".tk[235]" -type "float3" -0.79243839 0.30492699 -0.41490987 ;
	setAttr ".tk[236]" -type "float3" -0.79135931 0.37837052 -0.41881615 ;
	setAttr ".tk[237]" -type "float3" -0.91215086 0.52018678 -0.45960537 ;
	setAttr ".tk[238]" -type "float3" -0.89645898 0.49991396 -0.45420107 ;
	setAttr ".tk[239]" -type "float3" -0.89877605 0.56887317 -0.45876974 ;
	setAttr ".tk[240]" -type "float3" -0.63479137 -0.29506361 -0.20488063 ;
	setAttr ".tk[241]" -type "float3" -0.66825229 0.036506176 -0.23771761 ;
	setAttr ".tk[242]" -type "float3" -0.65708566 -0.3668257 -0.22341716 ;
	setAttr ".tk[243]" -type "float3" -0.62201047 -0.50039029 -0.21362227 ;
	setAttr ".tk[244]" -type "float3" -0.78983712 0.27034438 -0.23865184 ;
	setAttr ".tk[245]" -type "float3" -0.78992128 0.1620506 -0.22646403 ;
	setAttr ".tk[246]" -type "float3" -0.8116895 0.19025052 -0.25837469 ;
	setAttr ".tk[247]" -type "float3" -0.70951569 -0.61097932 -0.27366954 ;
	setAttr ".tk[248]" -type "float3" -0.6576823 -0.76654744 -0.34679556 ;
	setAttr ".tk[249]" -type "float3" -0.74630332 -0.71895814 -0.34952581 ;
	setAttr ".tk[250]" -type "float3" -0.86495161 -0.8109926 -0.15808177 ;
	setAttr ".tk[251]" -type "float3" -0.78106976 -1.014886 -0.27632776 ;
	setAttr ".tk[252]" -type "float3" -0.91511059 -1.0402355 -0.27306497 ;
createNode polyExtrudeFace -n "polyExtrudeFace35";
	rename -uid "859096FF-3B49-D389-19B4-83A5170B9895";
	setAttr ".ics" -type "componentList" 1 "f[11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.31136179 7.1437707 -2.895474 ;
	setAttr ".rs" 1360474590;
	setAttr ".lt" -type "double3" -9.4368957093138306e-16 2.1649348980190553e-15 1.0955380883440129 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.27698767185211182 7.0866930605137624 -2.9586215019226074 ;
	setAttr ".cbx" -type "double3" 0.34573590755462646 7.2008482013551758 -2.8323261737823486 ;
createNode polyTweak -n "polyTweak36";
	rename -uid "0EF46429-F84B-B102-0B9B-028C49D751B1";
	setAttr ".uopa" yes;
	setAttr -s 14 ".tk";
	setAttr ".tk[112]" -type "float3" 0.047858465 -0.35626036 0.084444769 ;
	setAttr ".tk[123]" -type "float3" -0.018495144 0 0.052353747 ;
	setAttr ".tk[124]" -type "float3" 0.018495144 0 -0.052353755 ;
	setAttr ".tk[135]" -type "float3" 0.015586706 -0.20811945 0.0018371814 ;
	setAttr ".tk[228]" -type "float3" 0.0039242986 -0.014947459 0 ;
	setAttr ".tk[229]" -type "float3" 0.0046272278 -0.0065290835 -8.1490725e-09 ;
	setAttr ".tk[230]" -type "float3" 0.0034286017 -0.0087350542 0 ;
	setAttr ".tk[231]" -type "float3" 0.00057453505 -0.58734286 -0.14742213 ;
	setAttr ".tk[232]" -type "float3" 0.0012775951 -0.578924 -0.14742209 ;
	setAttr ".tk[233]" -type "float3" 0.030498728 -0.60172516 -0.037020873 ;
	setAttr ".tk[253]" -type "float3" 0.025433525 -0.0043357052 -0.012200392 ;
	setAttr ".tk[254]" -type "float3" -0.052643813 0.22000447 -0.071890205 ;
	setAttr ".tk[255]" -type "float3" -0.0049151815 -0.21105497 0.051011674 ;
createNode polyExtrudeFace -n "polyExtrudeFace36";
	rename -uid "4548CC01-9E4B-B284-2092-BEA76DE4D2FB";
	setAttr ".ics" -type "componentList" 2 "f[81]" "f[115]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.38612086 6.0000911 0.14992571 ;
	setAttr ".rs" 1201840883;
	setAttr ".lt" -type "double3" 0.78885661486564418 0.49262429822470438 0.78817597101223547 ;
	setAttr ".kft" no;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.54643398523330688 5.830643121707177 0.019276618957519531 ;
	setAttr ".cbx" -type "double3" -0.22580772638320923 6.1695392783329588 0.28057479858398438 ;
createNode polyTweak -n "polyTweak37";
	rename -uid "CFAC98CB-0E44-C824-B313-5DAC713CF3D0";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[244]" -type "float3" -0.14371389 0 -0.3723616 ;
	setAttr ".tk[245]" -type "float3" -0.1482209 0.22884281 -0.36026686 ;
	setAttr ".tk[246]" -type "float3" -0.14371389 0 -0.3723616 ;
	setAttr ".tk[256]" -type "float3" -0.61452591 -0.32102412 0.048330568 ;
	setAttr ".tk[257]" -type "float3" -0.61452591 -0.32102412 0.048330568 ;
	setAttr ".tk[258]" -type "float3" -0.67946458 -0.60526961 -0.076195113 ;
createNode polyTweak -n "polyTweak38";
	rename -uid "F443CE1F-7B49-10BE-7E9F-C7866150B04C";
	setAttr ".uopa" yes;
	setAttr -s 19 ".tk";
	setAttr ".tk[84]" -type "float3" 0.22670063 -0.023027226 0 ;
	setAttr ".tk[85]" -type "float3" 0.12030737 3.5527137e-15 0 ;
	setAttr ".tk[118]" -type "float3" 0.037734915 0.43459043 -0.015022289 ;
	setAttr ".tk[119]" -type "float3" 0.14121413 0.1714015 0.015022289 ;
	setAttr ".tk[120]" -type "float3" 0.23679291 -0.024073839 0 ;
	setAttr ".tk[121]" -type "float3" 0.46809268 0.1146911 -0.021584749 ;
	setAttr ".tk[122]" -type "float3" 0.44517481 -0.2735863 0.0019099968 ;
	setAttr ".tk[123]" -type "float3" 0.77299494 -0.43459043 0.0064928811 ;
	setAttr ".tk[124]" -type "float3" 0.68374544 -0.13199553 0.021584749 ;
	setAttr ".tk[125]" -type "float3" 0.61977607 -0.021678092 0 ;
	setAttr ".tk[126]" -type "float3" 0.80903822 1.0658141e-14 0 ;
	setAttr ".tk[259]" -type "float3" 0.032779898 0.96102631 -0.75911808 ;
	setAttr ".tk[260]" -type "float3" -0.021368897 0.96102631 -0.75911808 ;
	setAttr ".tk[261]" -type "float3" -0.0043723704 0.96102631 -0.75911808 ;
	setAttr ".tk[262]" -type "float3" 0.077143535 0.96102631 -0.75911808 ;
	setAttr ".tk[263]" -type "float3" 1.1360534 -2.2812834 0 ;
	setAttr ".tk[264]" -type "float3" 1.2054846 -2.3053579 0 ;
	setAttr ".tk[265]" -type "float3" 1.1423564 -2.2819118 0 ;
	setAttr ".tk[266]" -type "float3" 1.2054846 -2.3053579 0 ;
createNode polySplit -n "polySplit16";
	rename -uid "95948E56-054F-DF60-EE14-E4A86C581119";
	setAttr -s 2 ".e[0:1]"  0 1;
	setAttr -s 2 ".d[0:1]"  -2147483519 -2147483543;
	setAttr ".sma" 180;
	setAttr ".m2015" yes;
createNode deleteComponent -n "deleteComponent41";
	rename -uid "6D70DCB0-2D41-5E95-A009-A2BB02EB63B7";
	setAttr ".dc" -type "componentList" 1 "e[126]";
createNode polyExtrudeFace -n "polyExtrudeFace37";
	rename -uid "E29528C6-9D44-ABE1-54D9-DD839B8A577B";
	setAttr ".ics" -type "componentList" 2 "f[81]" "f[115]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.18891996 6.3132691 0.46400869 ;
	setAttr ".rs" 1892192849;
	setAttr ".lt" -type "double3" 1.433532112460334e-15 -8.2052420413702976e-16 0.5178518072313355 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.12888525426387787 6.2395140368585622 0.16599743068218231 ;
	setAttr ".cbx" -type "double3" 0.50672519207000732 6.3870239900827999 0.76201993227005005 ;
createNode polyTweak -n "polyTweak39";
	rename -uid "B347977B-8A44-E2C1-30FC-F0A3CD7F8DC3";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[84]" -type "float3" 0.25260511 -0.81593537 0 ;
	setAttr ".tk[85]" -type "float3" 0.32597542 7.1054274e-15 0.029890222 ;
	setAttr ".tk[119]" -type "float3" 0.10938129 0 -0.029890219 ;
	setAttr ".tk[121]" -type "float3" 0.02021331 -0.19791156 0.004398189 ;
	setAttr ".tk[122]" -type "float3" 0.02021331 -0.19791156 0.004398189 ;
	setAttr ".tk[123]" -type "float3" -0.12401785 -0.4623006 -0.00743753 ;
	setAttr ".tk[124]" -type "float3" 0.094029434 -0.27383786 0.024219066 ;
	setAttr ".tk[125]" -type "float3" 0.22047679 -0.53817952 0.053699311 ;
	setAttr ".tk[126]" -type "float3" 0.0016555659 -0.91968858 0.070954867 ;
	setAttr ".tk[259]" -type "float3" -0.084683239 -2.1599934 0.13365315 ;
	setAttr ".tk[260]" -type "float3" -0.14023533 -2.3801224 0.20684071 ;
	setAttr ".tk[261]" -type "float3" 0.10404455 -3.2247992 0.18021089 ;
	setAttr ".tk[262]" -type "float3" 0.092365481 -2.8860776 0.19561724 ;
	setAttr ".tk[263]" -type "float3" -0.54339027 -1.8698936 -0.022655647 ;
	setAttr ".tk[264]" -type "float3" -0.64211935 -2.1552749 -0.037050441 ;
	setAttr ".tk[265]" -type "float3" -0.53122121 -1.4305149 -0.056947798 ;
	setAttr ".tk[266]" -type "float3" -0.66958427 -1.9169331 -0.11232029 ;
createNode polyExtrudeFace -n "polyExtrudeFace38";
	rename -uid "7684BAE6-6449-AE79-CE27-EA9E11CC7089";
	setAttr ".ics" -type "componentList" 1 "f[81]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" -0.10500046 6.7570701 1.0037084 ;
	setAttr ".rs" 1668582318;
	setAttr ".lt" -type "double3" 1.8501910073465133e-15 1.4710455076283324e-15 0.42880157888649267 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" -0.24124786257743835 6.7377961908528947 0.90788459777832031 ;
	setAttr ".cbx" -type "double3" 0.03124694712460041 6.7763442625562451 1.0995322465896606 ;
createNode polyTweak -n "polyTweak40";
	rename -uid "C97B3DCA-9442-F26A-76A6-0894E1A79AB3";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk[263:274]" -type "float3"  0 3.5527137e-15 -0.11604088
		 0 3.5527137e-15 -0.11604088 0 3.5527137e-15 -0.11604088 0 3.5527137e-15 -0.11604088
		 -0.023188172 -0.4773753 0.32332265 -0.023188172 -0.4773753 0.32332265 -0.023188172
		 -0.4773753 0.32332265 -0.023188172 -0.4773753 0.32332265 0.32356042 -0.15577143 0.0038171713
		 0.32356033 -0.15577164 0.0038171713 0.32356015 -0.15577161 0.0038171746 0.32356033
		 -0.15577166 0.0038171727;
createNode polyExtrudeFace -n "polyExtrudeFace39";
	rename -uid "3E1ADE11-9B49-76B5-907A-119072BB579C";
	setAttr ".ics" -type "componentList" 1 "f[115]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.8277908 6.9469547 0.16398786 ;
	setAttr ".rs" 1587104617;
	setAttr ".lt" -type "double3" 1.519617764955683e-15 1.7069679003611782e-15 0.32565256117402142 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".tk" 0.10000000149011612;
	setAttr ".cbn" -type "double3" 0.76647412776947021 6.9354035660549505 0.11121745407581329 ;
	setAttr ".cbx" -type "double3" 0.88910740613937378 6.9585063277155275 0.21675826609134674 ;
createNode polyTweak -n "polyTweak41";
	rename -uid "177E5A7A-EE4F-7FFD-AC37-FCAA85B0F631";
	setAttr ".uopa" yes;
	setAttr -s 18 ".tk";
	setAttr ".tk[124]" -type "float3" 0 0 0.01121614 ;
	setAttr ".tk[125]" -type "float3" 0 0 -0.0318278 ;
	setAttr ".tk[263]" -type "float3" -0.028882818 0 0.036220752 ;
	setAttr ".tk[264]" -type "float3" -0.045867518 0 -0.033537753 ;
	setAttr ".tk[265]" -type "float3" 0.010382595 0 0.11618967 ;
	setAttr ".tk[266]" -type "float3" 0.022857882 0 -0.089350387 ;
	setAttr ".tk[267]" -type "float3" 0.046117689 0.024040163 -0.023390926 ;
	setAttr ".tk[268]" -type "float3" 0.0036596255 0.015014138 -0.044688262 ;
	setAttr ".tk[269]" -type "float3" -0.052173141 -0.024040163 0.013452483 ;
	setAttr ".tk[270]" -type "float3" 0.038002919 0.0075563206 0.019303389 ;
	setAttr ".tk[271]" -type "float3" 0.022596231 0 0.029612107 ;
	setAttr ".tk[272]" -type "float3" -0.03672228 0 -0.024137633 ;
	setAttr ".tk[273]" -type "float3" 0.044331353 0 0.068848193 ;
	setAttr ".tk[274]" -type "float3" -0.02472263 0 -0.05012162 ;
	setAttr ".tk[275]" -type "float3" 0.0073369215 -0.46524537 0.1783358 ;
	setAttr ".tk[276]" -type "float3" -0.027285198 -0.48116189 0.12294465 ;
	setAttr ".tk[277]" -type "float3" -0.13445485 -0.55003113 0.15127257 ;
	setAttr ".tk[278]" -type "float3" -0.032742079 -0.49431369 0.22266801 ;
createNode polySoftEdge -n "polySoftEdge1";
	rename -uid "1A76AB3D-CC44-26C5-552D-9591397D2102";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 0.23657690004689169 0 0 0 0 1 0 0 0 0 1;
	setAttr ".a" 0;
createNode polyTweak -n "polyTweak42";
	rename -uid "07E0918B-A44B-E80C-DFBF-B88966BC5A20";
	setAttr ".uopa" yes;
	setAttr -s 54 ".tk";
	setAttr ".tk[45]" -type "float3" 0 0 0.020523518 ;
	setAttr ".tk[46]" -type "float3" 0 0 -0.1265399 ;
	setAttr ".tk[47]" -type "float3" 0.071626239 0 0 ;
	setAttr ".tk[48]" -type "float3" -0.066492707 0 0 ;
	setAttr ".tk[57]" -type "float3" 0 0 0.05790855 ;
	setAttr ".tk[58]" -type "float3" 0 0 -0.05790855 ;
	setAttr ".tk[59]" -type "float3" 0.12606995 0 0 ;
	setAttr ".tk[60]" -type "float3" 0.026853586 0 0 ;
	setAttr ".tk[61]" -type "float3" -0.027336508 0 0 ;
	setAttr ".tk[62]" -type "float3" 0 0 -0.23144032 ;
	setAttr ".tk[63]" -type "float3" 0 0 -0.061181247 ;
	setAttr ".tk[71]" -type "float3" -0.030224588 0 0 ;
	setAttr ".tk[72]" -type "float3" -0.1017584 0 0 ;
	setAttr ".tk[73]" -type "float3" -0.046961829 0 0 ;
	setAttr ".tk[74]" -type "float3" -0.042613558 0 0.086132064 ;
	setAttr ".tk[75]" -type "float3" 0 0 0.23144032 ;
	setAttr ".tk[91]" -type "float3" 0.077486485 0.13708246 -0.061203897 ;
	setAttr ".tk[92]" -type "float3" 0.21633823 0.033971902 0.13435924 ;
	setAttr ".tk[101]" -type "float3" 0.17385189 -0.41562355 -0.53550082 ;
	setAttr ".tk[102]" -type "float3" 0.2134719 -0.79299301 -0.38799515 ;
	setAttr ".tk[103]" -type "float3" 0.11890569 -0.47602338 -0.51159519 ;
	setAttr ".tk[104]" -type "float3" 0.26295248 -0.71990961 -0.48482451 ;
	setAttr ".tk[127]" -type "float3" 0.18782355 -0.32157874 -0.64867979 ;
	setAttr ".tk[128]" -type "float3" 0.15538214 -0.40505964 -0.66430348 ;
	setAttr ".tk[129]" -type "float3" 0.16739984 -0.24691302 -0.61988753 ;
	setAttr ".tk[130]" -type "float3" 0.13265081 -0.34360278 -0.62682992 ;
	setAttr ".tk[240]" -type "float3" 0.19082101 -0.1548233 -0.71057922 ;
	setAttr ".tk[241]" -type "float3" 0.16775395 -0.034879729 -0.73375887 ;
	setAttr ".tk[242]" -type "float3" 0.18494238 -0.043952122 -0.69479471 ;
	setAttr ".tk[243]" -type "float3" 0.15125583 -0.09804026 -0.69035012 ;
	setAttr ".tk[244]" -type "float3" 0.21655144 0.15821138 -0.86437875 ;
	setAttr ".tk[245]" -type "float3" 0.20000519 0.23049062 -0.87465674 ;
	setAttr ".tk[246]" -type "float3" 0.21077265 0.2671997 -0.84886223 ;
	setAttr ".tk[247]" -type "float3" 0.14107706 0.2729283 -0.79309154 ;
	setAttr ".tk[248]" -type "float3" 0.12584187 0.29589877 -0.77164221 ;
	setAttr ".tk[249]" -type "float3" 0.14743404 0.33056888 -0.77449131 ;
	setAttr ".tk[250]" -type "float3" 0.088542767 0.68362212 -0.81840134 ;
	setAttr ".tk[251]" -type "float3" 0.080546394 0.695678 -0.80714345 ;
	setAttr ".tk[252]" -type "float3" 0.091879494 0.71387124 -0.80863881 ;
	setAttr ".tk[256]" -type "float3" 0.28409705 0.65099829 -0.92682827 ;
	setAttr ".tk[257]" -type "float3" 0.26856884 0.67158872 -0.93983805 ;
	setAttr ".tk[258]" -type "float3" 0.26365051 0.69578481 -0.93943822 ;
	setAttr ".tk[264]" -type "float3" 0 -3.5527137e-15 0.054326959 ;
	setAttr ".tk[266]" -type "float3" 0 -3.5527137e-15 0.12258337 ;
	setAttr ".tk[271]" -type "float3" -0.1354682 -0.64228654 0 ;
	setAttr ".tk[272]" -type "float3" -0.1354682 -0.64228654 0 ;
	setAttr ".tk[273]" -type "float3" -0.1354682 -0.64228654 0 ;
	setAttr ".tk[274]" -type "float3" -0.1354682 -0.64228654 0 ;
	setAttr ".tk[279]" -type "float3" 0.031855617 -0.0077595031 0.017168636 ;
	setAttr ".tk[280]" -type "float3" -0.0089225229 0.025396766 0.027415041 ;
	setAttr ".tk[281]" -type "float3" 0.031016927 -0.025396766 -0.027414892 ;
	setAttr ".tk[282]" -type "float3" -0.031855643 0.0078728609 -0.016126482 ;
createNode polySmoothFace -n "polySmoothFace1";
	rename -uid "200853C6-FF4C-404F-ED88-EB95ADCBFEE1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".sdt" 2;
	setAttr ".dv" 2;
	setAttr ".suv" yes;
	setAttr ".ps" 0.10000000149011612;
	setAttr ".ro" 1;
	setAttr ".ma" yes;
	setAttr ".m08" yes;
createNode createColorSet -n "createColorSet1";
	rename -uid "5A858BC1-4D43-D55F-13DB-D3917822CF4D";
	setAttr ".colos" -type "string" "SculptFreezeColorTemp";
	setAttr ".clam" no;
createNode createColorSet -n "createColorSet2";
	rename -uid "14852801-C744-6C5E-F61E-97BEFC5F71CA";
	setAttr ".colos" -type "string" "SculptMaskColorTemp";
	setAttr ".clam" no;
createNode polyReduce -n "polyReduce1";
	rename -uid "A5CDD7F6-8148-B7C9-2688-44B2ECAC8E29";
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".ver" 1;
	setAttr ".p" 81.8;
	setAttr ".vmp" -type "string" "";
	setAttr ".sym" -type "double4" 0 1 0 0 ;
	setAttr ".stl" 0.01;
	setAttr ".kqw" 1;
	setAttr ".cr" yes;
createNode polyTweak -n "polyTweak43";
	rename -uid "F518CE15-044B-1D68-09EB-DDB0FE190C7B";
	setAttr ".uopa" yes;
	setAttr -s 866 ".tk";
	setAttr ".tk[2:167]" -type "float3"  -0.00041985512 -0.00070858002 0.0095815659
		 0 0 0 -0.029075623 -1.068102837 0.18993473 -0.02479887 -0.49614716 0.082050562 -0.0066308975
		 -0.074715614 0.013297558 -0.024420261 -0.4736228 0.088274002 -0.12388492 -0.26279354
		 -0.032660007 0.15626335 -0.20158386 -0.15143251 0.068869591 -0.49788761 -0.22007561
		 -0.24577156 -0.041892052 0.1242857 0 0 0 0 0 0 0 0 0 0 0 0 0.18838382 -0.25334454
		 -0.015263557 0.0096271634 -0.40185928 0.063745022 0.13720168 -0.63979816 0.0043978132
		 0.22853738 -0.82299995 0.064294815 -0.0069861412 -0.072223186 0.012255132 0 0 0 0
		 0 0 0 0 0 0 0 0 0.00046896935 -0.010991096 0.0022764206 0 0 0 0 0 0 0.1184144 -0.59623289
		 0.44311571 -0.079371929 -0.42153358 0.18874168 0.29561049 -1.10411215 -0.13976195
		 0.087912709 -0.25384998 -0.093755007 0.28462696 -0.79882193 -0.3150804 0.32260227
		 -1.15042639 -0.17553753 0.12849724 -0.58791256 -0.0041459203 0.22024781 -0.94163227
		 -0.028530672 0.0076954663 -0.10732079 0.19869137 -0.25537014 0.19697857 0.38044095
		 -0.0013916492 0.00039768219 0.0005210638 0 0 0 0 0 0 0 0 0 -0.1574297 0.090097427
		 0.088351369 0 0 0 0.03009057 -0.087090492 -0.042240381 -0.49191296 0.37410545 0.74919081
		 -0.14002126 0.10991383 0.25306964 0 0 0 0 0 0 -0.0095777512 0.0027399063 0.0035860538
		 -0.45732713 0.16405201 0.19362712 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.81090689
		 0.41010284 0.53056729 0.0015909672 -0.000248909 -0.00042867661 0 0 0 0 0 0 0 0 0
		 -0.0083489418 -0.24865484 0.047818661 0 0 0 0 0 0 0.0020496249 -0.0084505081 0.016698122
		 0.00082278252 -0.049482346 0.010113716 0.0053899884 -0.13402987 0.021158695 0.0024072528
		 -0.03619957 0.11044216 -0.16504741 -0.0053777695 0.33914089 -0.0023386478 -0.01539135
		 0.21767139 -0.0010902882 -0.0071763992 0.10148716 0 0 0 0 0 0 0 0 0 0 0 0 -0.36509299
		 0.12835693 0.15336931 -0.69132948 0.29910755 0.34367144 0.10250521 0.049276352 -0.06512022
		 0.0060269833 -0.00094223022 -0.0016231537 0.0024535656 -0.0078115463 -0.0040295124
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.0042417049 -0.13351679 0.025887012 -0.025089979
		 -0.51371908 0.095722198 0.19228198 -0.84749413 -0.013843338 0 0 0 0 0 0 -0.72007656
		 0.52282047 0.90706658 0 0 0 0 0 0 0 0 0 -0.033272844 0.023569107 0.056121826 0.0001360178
		 -0.00042438507 0.00073051453 -0.0023947656 -0.022491455 0.069794416 0.035233378 -0.17985487
		 0.004797101 -0.00093603134 -0.1195631 0.023684502 0.001103282 -0.2325964 0.043706417
		 0.0090135634 -0.34429693 0.055777073 0.015660077 -0.11485243 -0.04826498 -0.064659268
		 -0.044240475 0.29124165 -0.19043079 -0.025971413 0.18176079 -0.025761366 -0.022192955
		 0.3562088 -3.2424927e-05 -0.00021362305 0.0030179024 -0.0017824173 -0.011731625 0.16590881
		 0 0 0 -0.0023999214 -0.015795708 0.22338486 0 0 0 -0.00035190582 7.6293945e-06 -0.00060558319
		 0 0 0 0 0 0 -0.035388947 -1.073564529 0.18771887 -0.010442257 -0.13681221 0.023707867
		 -0.012279034 -0.14786386 0.0277493 -0.026031971 -0.70396614 0.13033628 -0.055216968
		 -0.066812515 -0.19293356 -0.00045228004 -0.087928772 -0.28378868 0.1553005 -0.52788115
		 -0.34282923 -0.21611118 -0.18163347 -0.078597069 -0.10346228 0.0010585785 0.083059311
		 0 0 0 0 0 0 0 0 0 0 0 0 0.48090577 -0.36938286 -0.085118771 0.0027651787 -0.065620422
		 0.0021071434 -0.010048568 -0.99712563 0.17126369 0.062989637 -0.38130808 -0.15318155
		 0.2034657 -0.87109184 0.030643523 0.067355156 -0.25441933 0.027811348 -0.00028181076
		 -0.0025410652 0.00043705106 0.00089383125 -0.006922245 0.00020414591 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.23511592 -0.73588896 0.093759775 -0.074957013
		 -0.7360754 0.65379763 -0.029513836 -0.27040672 0.04643631 0.18885115 -0.6215477 -0.13919199
		 0.20090359 -0.5646739 -0.23528361 0.3793515 -1.19074869 -0.31494087 0.29636139 -1.11523724
		 -0.13091166 0.16137797 -0.7231164 0.0067236423 0.221903 -0.91358519 -0.063309222
		 0.22612798 -0.86999607 -0.085665286 0.041504398 -0.2279129 0.31750774 -0.19106138
		 0.065384865 0.42336416 -0.057533741 -0.11615133 0.09750843 0 0 0 0 0 0 0 0 0 0 0
		 0 -0.31508017 0.26783752 0.32332563 -0.005759716 0.0018081665 0.0022656322 0 0 0
		 -3.9517879e-05 -0.00062942505 9.0122223e-05 0.070358038 -0.10637665 -0.015388727
		 0.1928196 -0.53288412 -0.24584699 -0.46097279 0.38028049 0.76085281;
	setAttr ".tk[168:333]" -0.01229997 0.0076370239 0.027111769 0 0 0 -0.056585729
		 0.03473568 0.099973679 -0.0076849461 0.0021982193 0.0028774142 0 0 0 -0.38471198
		 0.17760468 0.19250333 -0.21542382 0.064819336 0.082887098 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 -0.026136637 -0.40617037 0.07536459 -0.38071519 -0.21909618 -0.62269592
		 0 0 0 0.0051487386 -0.3003211 0.044347763 0.011873007 -0.050698757 0.0033432739 0
		 0 0 0 0 0 0.12243783 -0.86307478 0.13661957 0.3772946 -1.21200418 -0.30120528 0.21789956
		 -0.91395426 -0.045178294 -0.076031089 -0.39740324 0.55062103 0 0 0 -0.0042729378
		 -0.013143539 0.0050979853 0.075968623 -0.21721411 -0.10554075 -0.092853248 0.062491417
		 0.18677592 -0.086453438 0.026427269 0.033552736 0 0 0 0 0 0 0 0 0 -0.0091805458 0.0026264191
		 0.0034373999 0.705652 -0.21105957 -0.17840528 0 0 0 0.0061864853 0.0052947998 -0.0048174858
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.6749649 0.56857777 0.96311092 0.08198905 -0.22701454
		 -0.075177521 0.062898636 -0.21472931 0.021593571 -0.016828299 -0.82228661 0.14954138
		 0.038036041 -0.37818861 -0.12818146 -0.00044393539 -0.0029220581 0.041319847 0 0
		 0 -0.0060341358 -0.029811382 0.42931557 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.032586336
		 -0.80365944 0.14655495 -0.030581594 -0.49546719 0.088335752 -0.013323665 -0.16092968
		 0.029726744 -0.023740053 -0.41697598 0.077944279 -0.03411451 -0.0043315887 -0.00867939
		 -0.42909253 -0.13222599 -0.37212849 -0.280586 -0.15948963 -0.45290279 -0.19252509
		 -0.25470352 -0.28828621 -0.31845301 -0.09709549 0.0056314468 -0.068817735 0.0012626648
		 0.022233963 0 0 0 0 0 0 0 0 0 0 0 0 0.12179667 -0.54495764 -0.23172522 0.1415025
		 -0.31461382 -0.12866688 0.16713321 -0.22870779 -0.01279211 -0.022611648 -0.86468554
		 0.14056873 -0.022309065 -1.16224957 0.20027637 0.0089120641 -0.41244555 0.064836502
		 0.072689295 -0.35803223 0.010260329 0.12558943 -0.49869204 0.032308638 0.00033521652
		 -0.016645908 0.0025177598 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2.3841858e-07
		 -3.8146973e-06 9.5367432e-07 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.0058484077 -0.31840563
		 0.048230052 0.23494515 -0.81097317 0.084506392 0.17673731 -0.87673712 0.31426716
		 -0.063514233 -0.57173395 0.21261454 0.34642541 -1.21513224 -0.21013367 0.24884707
		 -0.74019909 -0.24338377 0.33368337 -0.98040199 -0.32862771 0.36961937 -1.26835728
		 -0.23873806 0.17415631 -0.76130581 -0.020962 0.21775723 -0.92985535 -0.030287862
		 0.26050645 -1.036866188 -0.086184569 0.25440454 -0.99220181 -0.092777148 -0.11671066
		 -0.45894623 0.42441726 -0.017179489 -0.49461269 0.63969231 -0.007578671 -0.22401333
		 0.35963154 -0.11552167 -0.0782547 0.26915884 0 0 0 0 0 0 0 0 0 0 0 0 -0.0055649281
		 -0.050179005 0.008631587 -0.026672602 -0.19114637 0.040497541 -0.10984039 0.070274353
		 0.12940097 -0.045106888 0.036312103 0.030391932 0 0 0 0 0 0 0.1996609 -0.55409622
		 -0.24857187 0.066469014 -0.18614006 -0.083115339 -0.0019828677 -0.027541161 0.0041995049
		 -0.0039238036 -0.086306572 0.011931419 0.064854383 -0.1399765 -0.050071001 0.091405153
		 -0.25878716 -0.12454319 -0.32099843 0.23722744 0.54018307 -0.18326503 0.13933468
		 0.35077953 -0.0021770895 0.0011920929 0.0068192482 -0.0035434365 0.001996994 0.010301828
		 -0.11362267 0.032852173 0.042786941 -0.020685196 0.0059165955 0.0077449083 0 0 0
		 -0.00050878525 0.00014591217 0.00019049644 -0.10585713 0.039365768 0.045312643 -0.30901361
		 0.10223389 0.12533325 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.58518839 0.20710468 0.24671721 -0.022471189
		 0.0064277649 0.0084137172 0 0 0 0 0 0 -0.0068576336 0.0019617081 0.0025676489 -0.36370277
		 0.11608219 0.14457226 0.37547326 -0.32834101 -0.059084415 0.60972595 -0.17551041
		 -0.15735245 0.42950606 0.065887451 -0.20124245 0.11826801 -0.020747185 -0.031965733
		 0.021672249 -0.0073280334 -0.0052080154 0.038721561 -0.045454025 -0.0041306019 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
	setAttr ".tk[335:499]" -0.0451051 -0.22923374 -0.0098376274 0.00013812631 0.0018091202
		 -0.0030345917 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.0037207603 -0.064472675 0.012568474
		 -0.017042637 -0.28418303 0.053638458 -0.015334129 -0.20524263 0.038410664 -0.0028470755
		 -0.025507927 0.004873991 0.0057200193 -0.016783237 -0.0047082901 0.12127951 -0.47169065
		 -0.049787521 0.14043088 -0.6161685 -0.028391063 0.027431309 -0.14791441 0.0014024377
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.0042965412 0.0013952255
		 0.0017249584 -0.53579319 0.27162838 0.44724798 -0.253232 0.16906834 0.38501883 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.0065152794 0.0043773651 0.01014185 7.6293945e-06 -2.3841858e-05
		 4.1007996e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.5357306 0.3753891 0.43386602
		 -0.48808861 0.42680073 0.73123574 -0.152879 0.081857681 0.34382367 -0.072748303 0.049132347
		 0.14253235 -0.34330869 0.28892994 0.59300089 -0.6431812 0.52488041 0.93604684 -0.90294337
		 0.60840416 0.86651611 -0.71041083 0.38487339 0.44202566 0.0045278072 -0.014550209
		 -0.0075546503 0 0 0 0 0 0 0.0031437874 -0.017396927 0.00031769276 0.13526881 -0.55435658
		 -0.034565032 0.30874419 -1.02670908 -0.20499009 0.30006504 -0.8517518 -0.31372416
		 0.075761795 -0.21683073 -0.10595 0.12412372 -0.38562584 0.1668067 0.21694699 -0.78888607
		 0.060081124 0.21321064 -0.91601181 0.023398638 0.18936008 -0.82719994 0.016488969
		 0.08659184 -0.39528799 0.015161753 0.0044230223 -0.014222145 0.0014081001 0.00432235
		 -0.013419151 0.019632339 0.027320176 -0.089296341 0.11298323 -0.013608932 -0.43521738
		 0.082540989 -0.0040912628 -0.30758286 0.058750629 0.0027211905 -0.53560543 0.094975471
		 -0.00017410517 -0.79604912 0.13678932 -0.023599744 -0.98843193 0.17711878 -0.025173903
		 -0.67986584 0.12612391 0.025398329 -0.19541979 -0.072012901 0.016972184 -0.17284393
		 0.00086784363 -0.15426344 -0.078960896 0.21156406 -0.1879808 -0.12351036 0.060130119
		 0.04665795 -0.43718338 -0.16787434 0.033402108 -0.27531004 -0.081054211 0 0 0 -0.00036656857
		 -0.0016183853 0.022727013 -0.11104226 0.0004901886 0.13202572 -0.090084434 -0.0070390701
		 0.25471306 -0.001475811 -0.0097141266 0.13737679 0 0 0 -0.00029480457 -0.0019402504
		 0.02743721 0.00042402744 -0.0081596375 0.031352997 0.0016503334 -0.022716522 0.0033035278
		 0.00062251091 -0.0090098381 0.0018696785 -0.0042170286 -0.02775526 0.392519 -0.080279469
		 -0.011161327 0.41305351 -0.0045909286 -0.022079468 0.30925465 -0.0032311678 -0.021266937
		 0.30076313 -0.0002644062 -0.0017409325 0.024621964 0.00032973289 -0.0047669411 0.00098896027
		 0.00018143654 -0.061604977 0.012436867 0.00060629845 -0.0087685585 0.0018196106 0
		 0 0 -0.0005440712 -0.0035815239 0.050647736 0 0 0 0 0 0 0 0 0 0 0 0 -0.035093665
		 -0.68862772 0.12482119 -0.019497037 -0.25966406 0.047492027 -0.018540382 -0.25566721
		 0.047822475 -0.028155088 -0.56576586 0.10516071 -0.18692854 -0.11143017 -0.55222511
		 -0.47572076 -0.0066175461 -0.51998329 -0.32989806 -0.20769691 -0.39429665 -0.33536404
		 -0.18305492 -0.26208019 -0.26319501 -0.056097031 0.031358719 -0.098020673 -0.013894081
		 0.0053720474 0 0 0 0 0 0 0 0 0 0 0 0 0.13040614 -0.45658445 -0.19529581 0.16260588
		 -0.20234394 -0.018404484 0.005099833 -0.28617954 0.036781311 -0.021707118 -1.13395977
		 0.19228935 0.00063729286 -0.82413912 0.13664627 0.028151125 -0.23340273 -0.043984413
		 0.10451066 -0.46898842 0.0206763 0.028890967 -0.10366678 0.009445399 -4.7683716e-05
		 -0.00043010712 7.3999166e-05 0.0033860207 -0.022112846 0.00073669851 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.13037431 -0.62380695
		 0.076045513 0.241932 -0.90730953 0.1253891 0.020144939 -0.8467083 0.36749721 -0.016631126
		 -0.49248314 0.085534096 0.33294249 -1.076025009 -0.2615658 0.30423152 -0.89496326
		 -0.3021543 0.38910127 -1.23996019 -0.31575012 0.36237115 -1.26216269 -0.22365332
		 0.19093025 -0.83328676 -0.017602265 0.23621339 -0.97868729 -0.055257455 0.24796551
		 -0.99391365 -0.077147111 0.21321058 -0.87641907 -0.055314362 -0.087682366 -0.55106735
		 0.669837 -0.015627086 -0.3445425 0.52451396 -0.063233972 -0.21327496 0.35685515 -0.088256121
		 -0.28234863 0.30708504 0 0 0 0 0 0 0 0 0 0 0 0 -0.01281476 -0.11074305 0.01958704
		 -0.034674168 -0.062506199 0.039933443 -0.070331812 0.060502052 0.065223813 -0.00099229813
		 0.0013942719 0.00091588497 0 0 0 -0.00098347664 -0.0088672638 0.0015253425;
	setAttr ".tk[500:665]" 0.13496459 -0.37825966 -0.17248726 0.012883432 -0.037064075
		 -0.017670393 -0.0019401014 -0.034817219 0.004753828 0.024178565 -0.079415798 -0.036919117
		 0.081540585 -0.21464634 -0.096671581 0.16189981 -0.4544282 -0.21558189 -0.29566956
		 0.22528934 0.52623296 -0.055012763 0.036948204 0.1221168 -0.0040352941 0.0022640228
		 0.011965752 -0.093207657 0.060747147 0.17186093 -0.082438946 0.023674011 0.0309311
		 -0.012159824 0.0034780502 0.0045529082 -0.0015082359 0.00043106079 0.00056464225
		 -0.030737162 0.009645462 0.01210326 -0.20264125 0.069340706 0.083536327 -0.22279501
		 0.068893433 0.087017387 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.24011135 0.07413578 0.093702018 0 0 0 0
		 0 0 0 0 0 -0.104491 0.030003548 0.03920275 -0.41338468 0.13399029 0.16574973 0.8143518
		 -0.39463615 -0.18187618 0.64968967 -0.12114716 -0.18650913 0.4264884 -0.077002525
		 -0.11719561 0.13546181 -0.027321815 -0.035955429 0.065056562 -0.040809631 -0.012702465
		 0.22001982 -0.17470551 -0.037341833 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.061905146
		 0.045809746 -0.052954674 -0.033186615 -0.0879879 -0.027124882 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 -0.00093460083 -0.0074396133 0.0015230179 -0.01003027 -0.13906956
		 0.026486397 -0.014404774 -0.18743229 0.035178185 -0.0048365593 -0.042728901 0.0083224773
		 -3.7074089e-05 -0.0002951622 6.0558319e-05 0.012451351 -0.047378063 -0.0046137571
		 0.054296255 -0.24165773 -0.0098186731 0.038517356 -0.19005346 -0.0017118454 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.13520062 0.052875519
		 0.072925687 -0.30790222 0.18758774 0.39851356 -0.01543802 0.0085754395 0.028664351
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.61075187
		 0.50319862 0.74210405 -0.44187653 0.3677969 0.75809097 -0.18556887 0.14171124 0.3446877
		 -0.2687096 0.22516155 0.46585178 -0.56087077 0.47743607 0.87841988 -0.77769923 0.60464668
		 0.99990439 -0.88638163 0.57558537 0.75491786 -0.73478937 0.48503113 0.59112692 0.0055103302
		 -0.016407967 -0.0081959963 0 0 0 9.2029572e-05 -0.0003490448 0 0.057753205 -0.2485342
		 -0.0092853308 0.21304333 -0.73296499 -0.11779011 0.31026471 -0.93791056 -0.27030647
		 0.19902873 -0.54477119 -0.23581624 0.03612113 -0.10413647 -0.051095724 0.16315174
		 -0.51390934 0.065218449 0.20284557 -0.81711817 0.046115279 0.19994551 -0.85273552
		 0.029536068 0.12050122 -0.52607107 0.023146629 0.035623431 -0.14821005 0.0089401007
		 0.0052859783 -0.016106606 0.007029295 0.01679945 -0.051517487 0.04384613 0.059242189
		 -0.1840663 0.1282773 -0.0090267658 -0.41290998 0.078423977 -0.0049498081 -0.54722357
		 0.10059547 -0.00048553944 -0.74470186 0.1298337 -0.015293598 -0.99133205 0.17435217
		 -0.023800015 -0.82188702 0.15066099 -0.023328781 -0.68351078 0.12699461 0.039717302
		 -0.29174232 -0.11948681 -0.036771089 -0.17717552 0.083886147 -0.13619362 -0.14327717
		 0.083756447 -0.058828212 -0.29103851 -0.070516586 0.070187718 -0.4381175 -0.18474102
		 0.036903687 -0.28130627 -0.10251284 -1.2159348e-05 -8.0108643e-05 0.001127243 -0.022282481
		 -0.0016450882 0.06682682 -0.075752437 -0.00095272064 0.15422916 -0.012008786 -0.014034271
		 0.20867825 -0.00017023087 -0.0011205673 0.015845299 0 0 0 -0.00037610531 -0.0024757385
		 0.035009384 0.0017912984 -0.01313448 -0.0055389404 0.0013130903 -0.020053387 0.0041489601
		 0 0 0 -0.019338608 -0.027330399 0.43033504 -0.033327103 -0.020243168 0.40400696 -0.0036609173
		 -0.024095535 0.34076214 -0.0041490793 -0.027307987 0.38619709 0 0 0 0.00080752373
		 -0.014554024 0.0030169487 0.00091695786 -0.021784782 0.0045118332 1.1920929e-06 -1.7166138e-05
		 3.8146973e-06 0 0 0 -0.00037431717 -0.0024628639 0.034832954 0 0 0 0 0 0 0 0 0 -0.00044178963
		 -0.00022411346 0.0025930405 -1.3232231e-05 -8.7738037e-05 0.0012369156 0 0 0 0 0
		 0 0 0 0 -0.032070279 -1.089165211 0.19269323 -0.036066294 -0.84157467 0.14409614
		 -0.01710391 -0.2705965 0.045786381 -0.0077916384 -0.091630936 0.016190052 -0.0086780787
		 -0.095561028 0.017653704 -0.019847631 -0.30923986 0.057777405 -0.024765491 -0.56705761
		 0.10571814 -0.028278947 -0.89884615 0.16331387;
	setAttr ".tk[666:831]" 0.0020981431 0.016366005 -0.024710655 -0.196172 -0.26008415
		 -0.12870884 -0.1959095 -0.26622105 -0.031256676 0.18171239 -0.079943657 -0.26693773
		 0.17834556 -0.40158987 -0.30733299 0.094376266 -0.53143501 -0.26867104 -0.055420309
		 -0.34460449 -0.17180347 -0.27272278 -0.093986511 0.046648979 -0.20622247 -0.01701355
		 0.12520027 -0.018362999 -9.4413757e-05 0.028827667 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0.31608915 -0.16188431 -0.083433151 0.31015182 -0.35549068 -0.034936905
		 0.083948731 -0.12020302 -0.0126369 -0.011470139 -0.30742645 0.046088696 -0.023793459
		 -1.12057686 0.19634581 0.0049555898 -0.69052887 0.11638784 0.018432751 -0.2486124
		 -0.012975693 0.099592417 -0.52693748 -0.21916771 0.18154302 -0.80930281 0.012576461
		 0.21515863 -0.8571744 0.05069536 0.1719963 -0.60136938 0.052510321 0.0069520473 -0.101408
		 0.014569283 -0.0025737286 -0.023208141 0.0039921999 0 0 0 0 0 0 0.042159915 -0.2276063
		 0.0038224459 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.00018668175
		 -0.002699852 0.00056028366 0.00021290779 -0.0073738098 0.0015258789 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.24791551 -0.83128262 0.074662089 0.19705962 -0.65801811
		 0.22076273 0.036697865 -0.70451212 0.62250137 -0.11851954 -0.59254932 0.41232777
		 -0.048202991 -0.36177921 0.085519314 -0.015512943 -0.14558315 0.024938583 0.28427294
		 -1.013520241 -0.16338611 0.11868991 -0.35975599 -0.10975838 0.14524257 -0.41293144
		 -0.16581917 0.24932873 -0.6974678 -0.28635013 0.33928335 -0.99008656 -0.3358866 0.36295235
		 -1.22552061 -0.24307504 0.30649984 -1.12830305 -0.14765458 0.30110335 -1.13218975
		 -0.1355243 0.13652563 -0.6234498 0.0042495728 0.1993565 -0.87175941 -0.0064746737
		 0.22431204 -0.94316101 -0.047364071 0.2575731 -1.0063762665 -0.09983626 0.28523302
		 -1.041999817 -0.13809836 0.16462421 -0.70325232 -0.031074047 0.073255621 -0.38704967
		 0.40641356 0.024035648 -0.14711761 0.2378633 -0.044487298 -0.080211639 0.26235938
		 -0.28580236 0.19941902 0.4873786 -0.12586474 0.040343285 0.18427229 -0.060686827
		 -0.28119612 0.13508677 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.31322193
		 0.27652359 0.41522217 -0.22840667 0.16368771 0.16484714 -0.054348469 0.026409149
		 0.026406288 0 0 0 0 0 0 0 0 0 0.022751033 -0.063365936 -0.026032686 -0.0027228594
		 -0.029983997 0.0051229 0.14171863 -0.1949873 -0.014916182 0.032255888 -0.068000793
		 -0.023435831 0.088245153 -0.25677729 -0.12662625 0.25357878 -0.70054436 -0.29728091
		 -0.5215677 0.41781616 0.81292748 -0.29684484 0.24143219 0.52798605 -0.067239761 0.049023628
		 0.12882423 0 0 0 0 0 0 0 0 0 -0.0005530715 0.00028610229 0.0019443035 -0.28928328
		 0.20350838 0.46346903 -0.01188612 0.0033998489 0.0044503808 -0.00012969971 3.7193298e-05
		 4.8518181e-05 0 0 0 0 0 0 -0.25347853 0.1306324 0.13497853 -0.44473815 0.17741871
		 0.2011621 -0.36663914 0.11940384 0.14740106 -0.068320274 0.019542694 0.025580496
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.67166352 0.27470684 0.34060478 -0.061796427 0.019227982
		 0.024219155 -0.55088973 0.21326256 0.24553204 -0.80232573 0.38646984 0.46415055 0.097785711
		 -0.063601494 -0.07997036 0.013540983 -0.0022506714 -0.0036535263 0.0055286884 -0.00086402893
		 -0.001488924 0.00024032593 -3.7193298e-05 -6.4611435e-05 0 0 0 0.01189065 -0.035634995
		 -0.01764226 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -0.00044775009
		 -0.045034885 0.0090093613 -0.0068395138 -0.19684744 0.037987232 -0.017139673 -0.39726496
		 0.075183392 -0.025187731 -0.502316 0.093442917 0.21497193 -0.92507172 -0.024898335
		 0.16606985 -0.7525692 -0.0036607869 0 0 0 0 0 0 0 0 0 0 0 0 -0.83800435 0.53121185
		 0.79804873 -0.58934414 0.44840145 0.84276748 0 0 0 0 0 0;
	setAttr ".tk[836:865]" -0.090438038 0.071138382 0.15341878 -0.004322201 -0.0021696091
		 0.020097017 0.0013131499 -0.0040960312 0.0070533752 0 0 0 0.0031676292 -0.05572319
		 0.12647152 0.0009983778 -0.013648987 0.03450036 0.0024511814 -0.013317108 0.00058507919
		 0.090676069 -0.43051624 0.0026160479 -0.0036370754 -0.17334461 0.033818722 0.0001885891
		 -0.080960274 0.016289234 0.00024962425 -0.1282835 0.025110722 0.0041826963 -0.2205162
		 0.040148258 0.0073407888 -0.23949957 0.039053917 0.0094328821 -0.39262438 0.063283443
		 0.0087000132 -0.071681023 -0.020734787 0.0091642439 -0.072589874 0.0065431595 -0.0063620508
		 -0.052942276 0.18731117 -0.14771056 -0.014201164 0.34778214 -0.19239539 -0.014169693
		 0.26997375 -0.21670583 -0.033057213 0.14442444 -0.10309923 -0.0094394684 0.3552618
		 -0.0033922195 -0.022018433 0.31132698 -0.00084519386 -0.005563736 0.078680992 0 0
		 0 -0.0015470982 -0.010182381 0.14400482 -0.0015548468 -0.011377335 0.1521225 0.00022959709
		 -0.0033197403 0.00068855286 -0.00022339821 -0.001470089 0.020792007 -0.0017466545
		 -0.011496544 0.16259003 -0.002592802 -0.017065525 0.24134254;
createNode polySoftEdge -n "polySoftEdge2";
	rename -uid "9A176BEA-654C-D133-20B7-388F5105EB70";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".a" 0;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
	setAttr ".outf" 51;
	setAttr ".imfkey" -type "string" "exr";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "polySoftEdge1.out" "pCylinderShape1.i";
connectAttr "polySoftEdge2.out" "pCube7Shape.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "polyCylinder1.out" "polyExtrudeFace1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polyTweak1.out" "polyExtrudeFace2.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace2.mp";
connectAttr "polyExtrudeFace1.out" "polyTweak1.ip";
connectAttr "polyTweak2.out" "polyExtrudeEdge1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeEdge1.mp";
connectAttr "polyExtrudeFace2.out" "polyTweak2.ip";
connectAttr "polyExtrudeEdge1.out" "polyExtrudeFace3.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace3.mp";
connectAttr "polyTweak3.out" "polyExtrudeFace4.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace4.mp";
connectAttr "polyExtrudeFace3.out" "polyTweak3.ip";
connectAttr "polyExtrudeFace4.out" "polyExtrudeFace5.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace5.mp";
connectAttr "polyTweak4.out" "polyExtrudeFace6.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace6.mp";
connectAttr "polyExtrudeFace5.out" "polyTweak4.ip";
connectAttr "polyExtrudeFace6.out" "polyExtrudeFace7.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace7.mp";
connectAttr "polyTweak5.out" "polyExtrudeFace8.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace8.mp";
connectAttr "polyExtrudeFace7.out" "polyTweak5.ip";
connectAttr "polyTweak6.out" "polyExtrudeFace9.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace9.mp";
connectAttr "polyExtrudeFace8.out" "polyTweak6.ip";
connectAttr "polyExtrudeFace9.out" "polyExtrudeFace10.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace10.mp";
connectAttr "polyTweak7.out" "polyExtrudeFace11.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace11.mp";
connectAttr "polyExtrudeFace10.out" "polyTweak7.ip";
connectAttr "polyTweak8.out" "polyExtrudeFace12.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace12.mp";
connectAttr "polyExtrudeFace11.out" "polyTweak8.ip";
connectAttr "polyExtrudeFace12.out" "polyTweak9.ip";
connectAttr "polyTweak9.out" "polySplit1.ip";
connectAttr "polySplit1.out" "polySplit2.ip";
connectAttr "polySplit2.out" "polyExtrudeFace13.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace13.mp";
connectAttr "polyExtrudeFace13.out" "polyTweak10.ip";
connectAttr "polyTweak10.out" "polySplit3.ip";
connectAttr "polySplit3.out" "polySplit4.ip";
connectAttr "polySplit4.out" "polyExtrudeFace14.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace14.mp";
connectAttr "polyExtrudeFace14.out" "polyTweak11.ip";
connectAttr "polyTweak11.out" "polySplit5.ip";
connectAttr "polySplit5.out" "polyExtrudeFace15.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace15.mp";
connectAttr "polyExtrudeFace15.out" "polyTweak12.ip";
connectAttr "polyTweak12.out" "polySplit6.ip";
connectAttr "polyTweak13.out" "polyExtrudeFace16.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace16.mp";
connectAttr "polySplit6.out" "polyTweak13.ip";
connectAttr "polyExtrudeFace16.out" "polyExtrudeFace17.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace17.mp";
connectAttr "polyTweak14.out" "polyExtrudeFace18.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace18.mp";
connectAttr "polyExtrudeFace17.out" "polyTweak14.ip";
connectAttr "polyExtrudeFace18.out" "polyTweak15.ip";
connectAttr "polyTweak15.out" "polySplit7.ip";
connectAttr "polySplit7.out" "polySplit8.ip";
connectAttr "polySplit8.out" "polySplit9.ip";
connectAttr "polySplit9.out" "polySplit10.ip";
connectAttr "polySplit10.out" "polySplit11.ip";
connectAttr "polySplit11.out" "polyTweak16.ip";
connectAttr "polyTweak16.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "polyTweak17.ip";
connectAttr "polyTweak17.out" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "deleteComponent6.og" "deleteComponent7.ig";
connectAttr "deleteComponent7.og" "deleteComponent8.ig";
connectAttr "deleteComponent8.og" "deleteComponent9.ig";
connectAttr "deleteComponent9.og" "deleteComponent10.ig";
connectAttr "deleteComponent10.og" "deleteComponent11.ig";
connectAttr "deleteComponent11.og" "deleteComponent12.ig";
connectAttr "deleteComponent12.og" "deleteComponent13.ig";
connectAttr "deleteComponent13.og" "deleteComponent14.ig";
connectAttr "deleteComponent14.og" "deleteComponent15.ig";
connectAttr "deleteComponent15.og" "deleteComponent16.ig";
connectAttr "deleteComponent16.og" "deleteComponent17.ig";
connectAttr "deleteComponent17.og" "deleteComponent18.ig";
connectAttr "deleteComponent18.og" "deleteComponent19.ig";
connectAttr "deleteComponent19.og" "deleteComponent20.ig";
connectAttr "deleteComponent20.og" "deleteComponent21.ig";
connectAttr "deleteComponent21.og" "deleteComponent22.ig";
connectAttr "deleteComponent22.og" "deleteComponent23.ig";
connectAttr "deleteComponent23.og" "deleteComponent24.ig";
connectAttr "deleteComponent24.og" "deleteComponent25.ig";
connectAttr "deleteComponent25.og" "deleteComponent26.ig";
connectAttr "deleteComponent26.og" "deleteComponent27.ig";
connectAttr "deleteComponent27.og" "deleteComponent28.ig";
connectAttr "deleteComponent28.og" "deleteComponent29.ig";
connectAttr "deleteComponent29.og" "deleteComponent30.ig";
connectAttr "deleteComponent30.og" "deleteComponent31.ig";
connectAttr "deleteComponent31.og" "deleteComponent32.ig";
connectAttr "deleteComponent32.og" "deleteComponent33.ig";
connectAttr "deleteComponent33.og" "deleteComponent34.ig";
connectAttr "deleteComponent34.og" "deleteComponent35.ig";
connectAttr "deleteComponent35.og" "deleteComponent36.ig";
connectAttr "deleteComponent36.og" "deleteComponent37.ig";
connectAttr "polyTweak18.out" "polyExtrudeFace19.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace19.mp";
connectAttr "deleteComponent37.og" "polyTweak18.ip";
connectAttr "polyTweak19.out" "polyExtrudeFace20.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace20.mp";
connectAttr "polyExtrudeFace19.out" "polyTweak19.ip";
connectAttr "polyExtrudeFace20.out" "polyTweak20.ip";
connectAttr "polyTweak20.out" "polySplit12.ip";
connectAttr "polySplit12.out" "deleteComponent38.ig";
connectAttr "deleteComponent38.og" "polySplit13.ip";
connectAttr "polySplit13.out" "deleteComponent39.ig";
connectAttr "deleteComponent39.og" "polyTweak21.ip";
connectAttr "polyTweak21.out" "deleteComponent40.ig";
connectAttr "deleteComponent40.og" "polyAppend1.ip";
connectAttr "polyAppend1.out" "polyTweak22.ip";
connectAttr "polyTweak22.out" "polySplit14.ip";
connectAttr "polySplit14.out" "polySplit15.ip";
connectAttr "polyTweak23.out" "polyExtrudeFace21.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace21.mp";
connectAttr "polySplit15.out" "polyTweak23.ip";
connectAttr "polyTweak24.out" "polyExtrudeFace22.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace22.mp";
connectAttr "polyExtrudeFace21.out" "polyTweak24.ip";
connectAttr "polyTweak25.out" "polyExtrudeFace23.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace23.mp";
connectAttr "polyExtrudeFace22.out" "polyTweak25.ip";
connectAttr "polyTweak26.out" "polyExtrudeFace24.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace24.mp";
connectAttr "polyExtrudeFace23.out" "polyTweak26.ip";
connectAttr "polyTweak27.out" "polyExtrudeFace25.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace25.mp";
connectAttr "polyExtrudeFace24.out" "polyTweak27.ip";
connectAttr "polyTweak28.out" "polyExtrudeFace26.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace26.mp";
connectAttr "polyExtrudeFace25.out" "polyTweak28.ip";
connectAttr "polyTweak29.out" "polyExtrudeFace27.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace27.mp";
connectAttr "polyExtrudeFace26.out" "polyTweak29.ip";
connectAttr "polyTweak30.out" "polyExtrudeFace28.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace28.mp";
connectAttr "polyExtrudeFace27.out" "polyTweak30.ip";
connectAttr "polyTweak31.out" "polyExtrudeFace29.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace29.mp";
connectAttr "polyExtrudeFace28.out" "polyTweak31.ip";
connectAttr "polyTweak32.out" "polyExtrudeFace30.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace30.mp";
connectAttr "polyExtrudeFace29.out" "polyTweak32.ip";
connectAttr "polyTweak33.out" "polyExtrudeFace31.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace31.mp";
connectAttr "polyExtrudeFace30.out" "polyTweak33.ip";
connectAttr "polyTweak34.out" "polyExtrudeFace32.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace32.mp";
connectAttr "polyExtrudeFace31.out" "polyTweak34.ip";
connectAttr "polyExtrudeFace32.out" "polyExtrudeFace33.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace33.mp";
connectAttr "polyTweak35.out" "polyExtrudeFace34.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace34.mp";
connectAttr "polyExtrudeFace33.out" "polyTweak35.ip";
connectAttr "polyTweak36.out" "polyExtrudeFace35.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace35.mp";
connectAttr "polyExtrudeFace34.out" "polyTweak36.ip";
connectAttr "polyTweak37.out" "polyExtrudeFace36.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace36.mp";
connectAttr "polyExtrudeFace35.out" "polyTweak37.ip";
connectAttr "polyExtrudeFace36.out" "polyTweak38.ip";
connectAttr "polyTweak38.out" "polySplit16.ip";
connectAttr "polySplit16.out" "deleteComponent41.ig";
connectAttr "polyTweak39.out" "polyExtrudeFace37.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace37.mp";
connectAttr "deleteComponent41.og" "polyTweak39.ip";
connectAttr "polyTweak40.out" "polyExtrudeFace38.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace38.mp";
connectAttr "polyExtrudeFace37.out" "polyTweak40.ip";
connectAttr "polyTweak41.out" "polyExtrudeFace39.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace39.mp";
connectAttr "polyExtrudeFace38.out" "polyTweak41.ip";
connectAttr "polyTweak42.out" "polySoftEdge1.ip";
connectAttr "pCylinderShape1.wm" "polySoftEdge1.mp";
connectAttr "polyExtrudeFace39.out" "polyTweak42.ip";
connectAttr "polySurfaceShape1.o" "polySmoothFace1.ip";
connectAttr "polySmoothFace1.out" "createColorSet1.ig";
connectAttr "createColorSet1.og" "createColorSet2.ig";
connectAttr "polyTweak43.out" "polyReduce1.ip";
connectAttr "createColorSet2.og" "polyTweak43.ip";
connectAttr "polyReduce1.out" "polySoftEdge2.ip";
connectAttr "pCube7Shape.wm" "polySoftEdge2.mp";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "pCylinderShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCube7Shape.iog" ":initialShadingGroup.dsm" -na;
// End of TREE.ma
