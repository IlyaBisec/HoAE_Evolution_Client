NAME DruBOre3

ICON U_FrnOf17
/ICONEX 0 0 interf3\InGame\druids_buildings 7
ICONEX 0 0 interf3\PortretsBuilding\DruBOre 0
ICONANM 0 0 interf3\PortretsBuilding\DruBOre 1 90 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800
!STANDLO      1 0.44 Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m
!BUILDLO_0    1 0.44 Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m
!BUILDLO_1    1 0.44 Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m
!BUILDLO_2    1 0.44 Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m
!BUILDLO_3    1 0.44 Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m Models\Bld\DRUID\druid_oretree\512x256\druid_oretree.c2m
BUILDPOINTS 1 1 1                            
BORNPOINTS3 2 0 0 0 0 -80 0 
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
LIFE     9000
PRICE 1 WOOD 100
BUILDSTAGES 40
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 100 120
EXPLMEDIA BUILDING 5
VISION 0
3DBARS 1 -25 -5 25 25 80
PEASANTABSORBER 18
PRODUCER        1 IRON 0 1
USAGE MINE
RESSUBST
ROUNDLOCK 4
INVITEMASK 1
ADDSHOTRADIUS 120
BUILDBAR -1 0 1 0
SELTYPE SelBigBuilding 1.0 1.0
ABILITY BuildStage_Dru
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
UPG_SOUND upgrade_druid
DEATH_SOUND building_death
CYLINDER 40 70
FORMFACTOR 480
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 1.7
ShadowScaleY 1.8
TFACTOR FF949494
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP2 100 1.20 Models\Effects\BildColor2.c2m Models\Effects\BildColor2.c2m
MOVEXY  #TEMP2 0 0
ANMEXT #STANDLO #TEMP2 0 0 0 1.0 50000
[END]
