NAME DruBPeg

ICON U_FrnOf17
ICONEX 0 0 interf3\PortretsBuilding\DruBPeg 0
ICONANM 0 0 interf3\PortretsBuilding\DruBPeg 1 36 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800                       
!STANDLO      1 1.16 Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m
!BUILDLO_0    1 1.16 Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m
!BUILDLO_1    1 1.16 Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m
!BUILDLO_2    1 1.16 Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m
!BUILDLO_3    1 1.16 Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m Models\Bld\DRUID\Pegas_HS\512x512\Pegas_HS.c2m
MOVEXY #STANDLO   -49 5
MOVEXY #BUILDLO_0 -49 5
MOVEXY #BUILDLO_1 -49 5
MOVEXY #BUILDLO_2 -49 5
MOVEXY #BUILDLO_3 -49 5
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 0 0 160 -100 100 160
GEOMETRY 1 199 32
LIFE     4000
PRICE 2 WOOD 450 COAL 1000
COSTPERCENT 300
BUILDSTAGES 100
MATHERIAL 1 BUILDING
RECTANGLE    0 100 140 210
EXPLMEDIA BUILDING 5
BUILDBAR -13 0 13 0
VISION 0
ROUNDLOCK 5.5
3DBARS 1 -60 0 68 68 185
ADDSHOTRADIUS 110
PROTECTION 3 piercing 15 magical 0 crushing 15
ARTPLACE 1 1
SELTYPE SelBigBuilding 1.2 1.2
ABILITY BuildStage_Dru
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
DEATH_SOUND building_death
CYLINDER 45 170
FORMFACTOR 480
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding

!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -61 7 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -7 7 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -34 -11 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -81 25 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -85 50 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -80 100 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -85 100 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -75 110 110 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\druid_pegas_cloud.c2m Models\Effects\Buildings\druid_pegas_cloud.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -7 25 110 1.2 2000

ShadowScaleX 1.7
ShadowScaleY 1.0
TFACTOR FF949494
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP2 100 0.55 Models\Effects\BildColor2.c2m Models\Effects\BildColor2.c2m
MOVEXY  #TEMP2 100 -30
ANMEXT #STANDLO #TEMP2 0 0 0 1.0 50000
[END]
