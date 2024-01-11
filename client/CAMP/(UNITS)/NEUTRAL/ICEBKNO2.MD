NAME IceBKno2
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.35 Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m
!BUILDLO_0    1 0.35 Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m
!BUILDLO_1    1 0.35 Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m
!BUILDLO_2    1 0.35 Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m
!BUILDLO_3    1 0.35 Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m Models\Bld\ICE\Altar_Knowledge_Ice_002_BlueBkg\512x256\Altar_Knowledge_Ice_002_BlueBkg.c2m
MOVEXY #STANDLO   25 0
MOVEXY #BUILDLO_0 25 0
MOVEXY #BUILDLO_1 25 0
MOVEXY #BUILDLO_2 25 0
MOVEXY #BUILDLO_3 25 0
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 0 0 0 100 80 0
GEOMETRY 1 199 32
LIFE     3000
PRICE 1 STONE 1
BUILDSTAGES 300
PROTECTION 3 piercing 15 magical 15 chopping 15
RECTANGLE    0 60 50 100
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 2 -70 0 60 80 30 -55 0 40 60 120
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 98
ROUNDLOCK 4
NOALTINFO
INVISIBLEONMINIMAP
CYLINDER 45 75
SPLITCLUSTERS #STANDLO 500 14 1 1 0
//tillVital//
INVISIBLEONMINIMAP
IMMORTAL
TFACTOR FF959595
*TEMP 1 10 1.00 Models\Anim_Objects\IceUBooM.C2M Models\Anim_Objects\IceUBooA.C2M 0 0.0 1.0
ANMEXT #STANDLO #TEMP 0 0 0 1.0 10000
BUILDBAR -5 0 5 0
ShadowScaleX 2.3
ShadowScaleY 1.0
PortretDisable True
[END]
