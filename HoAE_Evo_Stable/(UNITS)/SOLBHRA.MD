NAME SolBHra
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
ICONEX 0 0 interf3\UnitPortrets\Sol_back 0
ICONANM 0 0 interf3\UnitPortrets\Sol_back 1 35 1
ICONANM 0 0 interf3\PortretsBuilding\SolBuildings 3 3 0
LOCATION -0 -0 800 800
!STANDLO      1 0.46 Models\Bld\New\house02\512x512\house02.c2m Models\Bld\New\house02\512x512\house02.c2m
!BUILDLO_0    1 0.46 Models\Bld\New\house02\512x512\house02.c2m Models\Bld\New\house02\512x512\house02.c2m
!BUILDLO_1    1 0.46 Models\Bld\New\house02\512x512\house02.c2m Models\Bld\New\house02\512x512\house02.c2m
!BUILDLO_2    1 0.46 Models\Bld\New\house02\512x512\house02.c2m Models\Bld\New\house02\512x512\house02.c2m
!BUILDLO_3    1 0.46 Models\Bld\New\house02\512x512\house02.c2m Models\Bld\New\house02\512x512\house02.c2m
MOVEXY #STANDLO    20 10
MOVEXY #BUILDLO_0  20 10
MOVEXY #BUILDLO_1  20 10
MOVEXY #BUILDLO_2  20 10
MOVEXY #BUILDLO_3  20 10
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 4    0 0 64   -58 58 60   -100 100 0   -140 205 0
//BORNPOINTS3 2    -48 48 0   80 142 0 
GEOMETRY 1 199 32
LIFE     5500
PRICE 3 STONE 350 GOLD 150 COAL 250
COSTPERCENT 300
BUILDSTAGES 50
BUILDHOTKEY		T
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 140 100
EXPLMEDIA BUILDING 5
BUILDBAR -10 10 12 0
//BUILDBAR -12 0 12 0
VISION 3
ROUNDLOCK 8
3DBARS 1 -40 0 50 50 70
ADDSHOTRADIUS 125
SELTYPE SelBigBuilding 1.9 1.9
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_sol
DEATH_SOUND building_death_big_1
UPG_SOUND upgrade_sol
CYLINDER 70 100
SPLITCLUSTERS #STANDLO 100 15 1 1 0
!TEMP4 10 1.7 Models\key_color\key_druid1.c2m Models\key_color\key_druid1.c2m
ANMEXT #STANDLO #TEMP4 0 0 290 0.9 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -258 -40 70 2.0 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -264 92 70 2.0 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 88 -352 70 2.0 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -70 -350 70 2.0 2000
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ABILITY BuildStage_Sol
ABILITY UA_aBildDegen_Sol
MFARM 50
ShadowScaleX 2.3
ShadowScaleY 1.0
TFACTOR FF919191
!TEMP 1000 2.0 Models\Effects\Reborn\RebSpells\Smerch\DustSmerchSBezp.c2m
MOVEXY  #TEMP 15 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
[END]
