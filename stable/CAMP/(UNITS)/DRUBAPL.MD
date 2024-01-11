NAME DruBApl

ICON U_FrnOf17
/ICONEX 0 0 interf3\InGame\druids_buildings 1
ICONEX 0 0 interf3\PortretsBuilding\DruBApl 0
ICONANM 0 0 interf3\PortretsBuilding\DruBApl 1 60 1

BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800
!STANDLO      1 0.4 Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m
!BUILDLO_0    1 0.4 Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m
!BUILDLO_1    1 0.4 Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m
!BUILDLO_2    1 0.4 Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m
!BUILDLO_3    1 0.4 Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m Models\Bld\DRUID\Tree_Food_resurs\512x512\Tree_Food_resurs.c2m
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
PRICE 1 WOOD 50
LIFE     400
MATHERIAL 1 BUILDING
BUILDSTAGES 12
RECTANGLE    0 0 90 160
EXPLMEDIA BUILDING 5
BUILDBAR -11 0 11 0
VISION 0
3DBARS 1 -35 0 35 35 110
USAGE FIELD
//SPRITEOBJECT
//EXSPRITES  D00 3 6 44 0
BORNSPRITE D00
ADDSHOTRADIUS 50
SELTYPE SelBigBuilding 0.7 0.7
ROUNDLOCK 1
ABILITY BuildStage_Dru
EXPA 50
KILLERAWARD             GOLD 22
KILLERAWARDRANDOM       GOLD 5
SELECT_SOUND interface_click
BORN_SOUND building_ready_druid
DEATH_SOUND building_death
CYLINDER 20 130
FORMFACTOR 256
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.0
ShadowSet 7
TFACTOR FF949494
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP2 100 0.80 Models\Effects\BildColor2.c2m Models\Effects\BildColor2.c2m
MOVEXY  #TEMP2 0 0
ANMEXT #STANDLO #TEMP2 0 0 0 1.0 50000
[END]
