NAME HumBWor
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0

ICONEX 0 0 interf3\PortretsBuilding\UndDepo 0
ICONANM 0 0 interf3\PortretsBuilding\UndDepo 1 72 1
LOCATION -0 -0 800 800
!STANDLO      1 0.5 Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m
!BUILDLO_0    1 0.5 Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m
!BUILDLO_1    1 0.5 Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m
!BUILDLO_2    1 0.5 Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m
!BUILDLO_3    1 0.5 Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m Models\Bld\Humans\masterskaya\1024x512\masterskaya.c2m
MOVEXY #STANDLO   -30 0
MOVEXY #BUILDLO_0 -30 0
MOVEXY #BUILDLO_1 -30 0
MOVEXY #BUILDLO_2 -30 0
MOVEXY #BUILDLO_3 -30 0
ADDHDIR #STANDLO 5 160
ADDHDIR #BUILDLO_0 5 160
ADDHDIR #BUILDLO_1 5 160
ADDHDIR #BUILDLO_2 5 160
ADDHDIR #BUILDLO_3 5 160
BORNPOINTS3 2 0 -30 0 -140 110 0
GEOMETRY 1 199 32
LIFE     5500
PRICE 2 STONE 300 IRON 200
BUILDSTAGES 75
PROTECTION 3 piercing 15 magical 0 chopping 15
RECTANGLE    0 60 160 130
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
BUILDBAR    -16 0 16 0
3DBARS 1 -100 10 105 110 80
INFO 3 8
COSTPERCENT 300
VISION 0
ADDSHOTRADIUS 180
ROUNDLOCK 9
ARTPLACE 0 1
SELTYPE SelBigBuilding 2.2 2.1
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
CYLINDER 90 60
SPLITCLUSTERS #STANDLO 500 15 1 1 0
FORMFACTOR 650
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 1.6
ShadowScaleY 2.2
[END]
