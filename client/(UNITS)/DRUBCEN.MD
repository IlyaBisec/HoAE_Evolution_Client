NAME DruBCen

ICON U_FrnOf17
/ICONEX 0 0 interf3\InGame\druids_buildings 2
ICONEX 0 0 interf3\PortretsBuilding\DruBCen 0
ICONANM 0 0 interf3\PortretsBuilding\DruBCen 1 177 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800
!STANDLO      1 3.8 Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m
!BUILDLO_0    1 3.8 Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m
!BUILDLO_1    1 3.8 Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m
!BUILDLO_2    1 3.8 Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m
!BUILDLO_3    1 3.8 Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m Models\Bld\DRUID\Kentavr_House\512x512\Kentavr_House.c2m
MOVEXY #STANDLO   15 -12
MOVEXY #BUILDLO_0 15 -12
MOVEXY #BUILDLO_1 15 -12
MOVEXY #BUILDLO_2 15 -12
MOVEXY #BUILDLO_3 15 -12
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 3 0 -25 5  100 75 5 140 115 0
GEOMETRY 1 199 32
LIFE     3000
PRICE 2 WOOD 600 IRON 350
COSTPERCENT 300
BUILDSTAGES 20
PROTECTION 3 piercing 15 magical 0 crushing 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 160 90
EXPLMEDIA BUILDING 5
BUILDBAR -16 0 16 0
VISION 0
ROUNDLOCK 8
3DBARS 2 -60 3 75 72 60 -98 16 45 24 24 
MFARM 35
ADDSHOTRADIUS 155
SELTYPE SelBigBuilding 1.8 1.8
ABILITY BuildStage_Dru
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
DEATH_SOUND building_death
UPG_SOUND upgrade_druid
CYLINDER 90 70
FORMFACTOR 530
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.0
ShadowScaleY 2.5
TFACTOR FF949494
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP2 100 0.20 Models\Effects\BildColor2.c2m Models\Effects\BildColor2.c2m
MOVEXY  #TEMP2 -120 30
ANMEXT #STANDLO #TEMP2 0 0 0 1.0 50000
[END]
