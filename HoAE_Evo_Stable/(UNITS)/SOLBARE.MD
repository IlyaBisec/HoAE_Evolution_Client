NAME SolBAre
ICON U_FrnOf17
ICONEX 0 0 interf3\UnitPortrets\Sol_back 0
ICONANM 0 0 interf3\UnitPortrets\Sol_back 1 35 1
ICONANM 0 0 interf3\PortretsBuilding\SolBuildings 9 9 0
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.34 Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m 
!BUILDLO_0    1 0.34 Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m 
!BUILDLO_1    1 0.34 Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m 
!BUILDLO_2    1 0.34 Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m 
!BUILDLO_3    1 0.34 Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m Models\Bld\SOL\Sol_Stairs_003\512x512\Sol_Stairs_003.c2m 
MOVEXY #STANDLO    0 0
MOVEXY #BUILDLO_0  0 0
MOVEXY #BUILDLO_1  0 0
MOVEXY #BUILDLO_2  0 0
MOVEXY #BUILDLO_3  0 0
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 40 -40 0 -120 120 0
GEOMETRY 1 199 32
LIFE     8000
PRICE 2 STONE 350 GOLD 150
COSTPERCENT 300
BUILDSTAGES 50
BUILDHOTKEY		P
PROTECTION 3 piercing 15 chopping 15 crushing 0
MATHERIAL 1 BUILDING
RECTANGLE    0 100 160 90
EXPLMEDIA BUILDING 5
BUILDBAR -15 7 17 0
VISION 3
ROUNDLOCK 5
3DBARS 2 -60 3 75 72 60 -98 16 45 24 24 
MFARM 60
ADDSHOTRADIUS 155
SELTYPE SelBigBuilding 1.8 1.8
ABILITY Settlement
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_sol
DEATH_SOUND building_death_big_1
UPG_SOUND upgrade_sol
ABILITY BuildStage_Sol
CYLINDER 90 70
FORMFACTOR 530
!TEMP4 10 1.5 Models\key_color\key_druid2big.c2m Models\key_color\key_druid2big.c2m
ANMEXT #STANDLO #TEMP4 0 0 70 0.9 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -94 -16 104 1.0 2000
!TEMP 180 2.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 174 -8 104 1.0 2000
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ABILITY UA_aBildDegen_Sol
ShadowScaleX 2.0
ShadowScaleY 2.5
TFACTOR FF949494
!TEMP 1000 2.0 Models\Effects\Reborn\RebSpells\Smerch\DustSmerchSBezp.c2m
MOVEXY  #TEMP 15 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
[END]
