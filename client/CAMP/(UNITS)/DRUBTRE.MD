NAME DruBTre

ICON U_FrnOf17
/ICONEX 0 0 interf3\InGame\druids_buildings 10
ICONEX 0 0 interf3\PortretsBuilding\DruBTre 0
ICONANM 0 0 interf3\PortretsBuilding\DruBTre 1 200 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800                        
!STANDLO      1 0.4 Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m
!BUILDLO_0    1 0.4 Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m
!BUILDLO_1    1 0.4 Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m
!BUILDLO_2    1 0.4 Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m
!BUILDLO_3    1 0.4 Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m Models\Bld\DRUID\Dendroy_forest\1024x512\Dendroy_forest.c2m
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 3 -13 -34 0  0 -20 0 120 93 0
GEOMETRY 1 199 32
LIFE     4000
PRICE 2 WOOD 1800 IRON 450
COSTPERCENT 300
BUILDSTAGES 60
MATHERIAL 1 BUILDING
RECTANGLE    0 100 135 165
EXPLMEDIA BUILDING 5
BUILDBAR -14 0 14 0
VISION 0
ROUNDLOCK 7
3DBARS 2 -80 0 67 33 146 27 -13 20 20 167
ADDSHOTRADIUS 140
PROTECTION 3 piercing 15 magical 0 crushing 15
ARTPLACE 2 1
ARTPLACE 3 1
SELTYPE SelBigBuilding 1.5 1.5
ABILITY BuildStage_Dru
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
DEATH_SOUND building_death
UPG_SOUND upgrade_druid
CYLINDER 90 160
FORMFACTOR 512
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.0
TFACTOR FF949494
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP2 100 1.80 Models\Effects\BildColor2.c2m Models\Effects\BildColor2.c2m
MOVEXY  #TEMP2 0 0
ANMEXT #STANDLO #TEMP2 0 0 0 1.0 50000
[END]
