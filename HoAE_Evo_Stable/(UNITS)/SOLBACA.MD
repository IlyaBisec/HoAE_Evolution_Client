NAME SolBAca
ICON U_FrnOf17
ICONEX 0 0 interf3\UnitPortrets\Sol_back 0
ICONANM 0 0 interf3\UnitPortrets\Sol_back 1 35 1
ICONANM 0 0 interf3\PortretsBuilding\SolBuildings 4 4 0
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.44 Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m 
!BUILDLO_0    1 0.44 Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m 
!BUILDLO_1    1 0.44 Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m 
!BUILDLO_2    1 0.44 Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m 
!BUILDLO_3    1 0.44 Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m Models\Bld\SOL\Sol_Tample_001\1024x512\Sol_Tample_001.c2m 
MOVEXY #STANDLO   20 10
MOVEXY #BUILDLO_0 20 10
MOVEXY #BUILDLO_1 20 10
MOVEXY #BUILDLO_2 20 10
MOVEXY #BUILDLO_3 20 10
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 3 0 -25 5  100 75 5 140 115 0
GEOMETRY 1 199 32
LIFE     8000
PRICE 2 STONE 400 COAL 250
COSTPERCENT 300
BUILDSTAGES 60
BUILDHOTKEY		G
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 60 90
EXPLMEDIA BUILDING 5
BUILDBAR -19 0 20 0
VISION 3
ROUNDLOCK 9
3DBARS 2 -60 3 75 72 60 -98 16 45 24 24 
ADDSHOTRADIUS 155
SELTYPE SelBigBuilding 2.0 2.0
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_sol
DEATH_SOUND building_death_big_2
UPG_SOUND upgrade_sol
CYLINDER 90 70
FORMFACTOR 530
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ABILITY BuildStage_Sol
ABILITY UA_aBildDegen_Sol
ABILITY Sololand

!TEMP 180 1.0 Models\Effects\Buildings\sol_altartorch.c2m Models\Effects\Buildings\sol_altartorch.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 130 -235 353 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\sol_altartorch.c2m Models\Effects\Buildings\sol_altartorch.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP  127 250 330 1.2 2000
!TEMP 180 1.0 Models\Effects\Buildings\sol_altartorch.c2m Models\Effects\Buildings\sol_altartorch.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 340 12 280 1.6 2000
!TEMP4 10 1.5 Models\key_color\key_druid2big.c2m Models\key_color\key_druid2big.c2m
ANMEXT #STANDLO #TEMP4 0 0 200 0.9 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -134 -256 82 2.0 2000
!TEMP 180 1.0 Models\Effects\Buildings\fire_medium_lightsmoke.c2m Models\Effects\Buildings\fire_medium_lightsmoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP -136 278 84 2.0 2000
ShadowScaleX 1.9
ShadowScaleY 1.6
!TEMP 1000 2.0 Models\Effects\Reborn\RebSpells\Smerch\DustSmerchSBezp.c2m
MOVEXY  #TEMP 15 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
[END]
