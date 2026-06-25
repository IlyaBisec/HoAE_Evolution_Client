NAME SolBCat
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
ICONEX 0 0 interf3\UnitPortrets\Sol_back 0
ICONANM 0 0 interf3\UnitPortrets\Sol_back 1 35 1
ICONANM 0 0 interf3\PortretsBuilding\SolBuildings 5 5 0
LOCATION -0 -0 800 800
!STANDLO      1 0.6 Models\Bld\SOL\katarga\1024x512\katarga.c2m Models\Bld\SOL\katarga\1024x512\katarga.c2m
!BUILDLO_0    1 0.6 Models\Bld\SOL\katarga\1024x512\katarga.c2m Models\Bld\SOL\katarga\1024x512\katarga.c2m
!BUILDLO_1    1 0.6 Models\Bld\SOL\katarga\1024x512\katarga.c2m Models\Bld\SOL\katarga\1024x512\katarga.c2m
!BUILDLO_2    1 0.6 Models\Bld\SOL\katarga\1024x512\katarga.c2m Models\Bld\SOL\katarga\1024x512\katarga.c2m
!BUILDLO_3    1 0.6 Models\Bld\SOL\katarga\1024x512\katarga.c2m Models\Bld\SOL\katarga\1024x512\katarga.c2m
MOVEXY #STANDLO   0 0
MOVEXY #BUILDLO_0 0 0
MOVEXY #BUILDLO_1 0 0
MOVEXY #BUILDLO_2 0 0
MOVEXY #BUILDLO_3 0 0
ADDHDIR #STANDLO   0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 -50 0 0 150 170 0
GEOMETRY 1 199 32
LIFE     8000
PRICE 3 WOOD 250 GOLD 75 COAL 75
BUILDSTAGES 15
BUILDHOTKEY		W
PROTECTION 4 piercing 15 magical 0 chopping 15 crushing 0
RECTANGLE    0 0 100 100
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 1 -50 0 50 50 50
INFO 3 8
//SHOWIDLE
COSTPERCENT 300
VISION 3
MFARM 100
SELTYPE SelBigBuilding 1.8 1.8
ADDSHOTRADIUS 185
RESOURCEBASE 6 FOOD WOOD STONE IRON GOLD COAL
ROUNDLOCK 9
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_sol
DEATH_SOUND building_death_big_1
UPG_SOUND upgrade_sol
SPLITCLUSTERS #STANDLO 500 15 1 1 0
CYLINDER 90 110
SELTYPE SelBigBuilding 2.2 2.2
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ABILITY SolLand
ABILITY BuildStage_Sol
ABILITY UA_aBildDegen_Sol
!TEMP4 10 1.5 Models\key_color\key_druid2big.c2m Models\key_color\key_druid2big.c2m
ANMEXT #STANDLO #TEMP4 0 0 150 0.9 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -58 168 154 1.0 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 46 168 154 1.0 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -88 72 110 1.0 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 112 8 98 1.0 2000
BUILDBAR -8 0 8 0
ShadowScaleX 2.3
ShadowScaleY 1.0
!TEMP 1000 2.0 Models\Effects\Reborn\RebSpells\Smerch\DustSmerchSBezp.c2m
MOVEXY  #TEMP 15 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
[END]
