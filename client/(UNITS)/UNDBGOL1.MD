NAME UndBGol1
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0              

ICONEX 0 0 interf3\PortretsBuilding\UndGold 0
ICONANM 0 0 interf3\PortretsBuilding\UndGold 1 60 1

LOCATION -0 -0 800 800                      
!STANDLO      1 0.5 Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m
!BUILDLO_0    1 0.5 Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m
!BUILDLO_1    1 0.5 Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m
!BUILDLO_2    1 0.5 Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m
!BUILDLO_3    1 0.5 Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m Models\Bld\UNDED\gold_mine_necros_01ani3_render\512x512\gold_mine_necros_01ani3_render.c2m
MOVEXY #STANDLO   5 22
MOVEXY #BUILDLO_0 5 22
MOVEXY #BUILDLO_1 5 22
MOVEXY #BUILDLO_2 5 22
MOVEXY #BUILDLO_3 5 22
BORNPOINTS3 2 0 0 0 -100 120 0
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
LIFE     4500
PRICE 1 STONE 100
BUILDSTAGES 40
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 100 60
EXPLMEDIA BUILDING 5
VISION 0
3DBARS 1 -70 0 60 60 40
PEASANTABSORBER 8
PRODUCER        1 GOLD 0 1
USAGE MINE
RESSUBST
ROUNDLOCK 5
INVITEMASK 1
ADDSHOTRADIUS 130
TFACTOR FFDDDDDD
BUILDBAR -1 0 1 0
SELTYPE SelBigBuilding 1.0 1.0
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_undead
DEATH_SOUND building_death
UPG_SOUND upgrade_undead
SPLITCLUSTERS #STANDLO 500 15 1 1 0
CYLINDER 55 35
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 1.8
ShadowScaleY 1.6

MessageProduce #UndMine

!TEMP5 180 1.0 Models\Effects\MagicCard\UndeadZona\UndeadZona.c2m Models\Effects\MagicCard\UndeadZona\UndeadZona.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
!TEMP 250 2.0 Models\Scaffold\Scaffold_Und_Eff\UndeatStroit4.c2m Models\Scaffold\Scaffold_Und_Eff\UndeatStroit4.c2m
MOVEXY  #TEMP 0 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_3 #TEMP  0 0 0 1.0 5000
[END]
