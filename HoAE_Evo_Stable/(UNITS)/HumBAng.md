NAME HumBAng

ICON U_FrnOf17
ICONEX 0 0 interf3\PortretsBuilding\DruBGref 0
ICONANM 0 0 interf3\PortretsBuilding\DruBGref 1 41 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800                     
!STANDLO      1 0.5 Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m
!BUILDLO_0    1 0.5 Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m
!BUILDLO_1    1 0.5 Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m
!BUILDLO_2    1 0.5 Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m
!BUILDLO_3    1 0.5 Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m Models\Bld\Humans\Angel_Altar\1024x512\Angel_Altar.c2m
MOVEXY #STANDLO   -20 -30
MOVEXY #BUILDLO_0 -20 -30
MOVEXY #BUILDLO_1 -20 -30
MOVEXY #BUILDLO_2 -20 -30
MOVEXY #BUILDLO_3 -20 -30
ADDHDIR #STANDLO 0 224
ADDHDIR #BUILDLO_0 0 224
ADDHDIR #BUILDLO_1 0 224
ADDHDIR #BUILDLO_2 0 224
ADDHDIR #BUILDLO_3 0 224
BORNPOINTS3 4 0 -35 154 35 -0 154 35 14 154  70 65 154
GEOMETRY 1 199 32
LIFE     4000
PRICE 3 STONE 1000 GOLD 500 COAL 3000
COSTPERCENT 300
BUILDSTAGES 400
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 120 250
EXPLMEDIA BUILDING 5
BUILDBAR -17 0 17 0
VISION 0
ROUNDLOCK 10
3DBARS 2 -68 4 60 60 64 -35 -8 45 45 200
ADDSHOTRADIUS 170
ARTPLACE 1 1
SELTYPE SelBigBuilding 2.3 2.3
ABILITY BuildStage_Dru
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
DEATH_SOUND building_death
CYLINDER 80 240
FORMFACTOR 480
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.0
[END]
