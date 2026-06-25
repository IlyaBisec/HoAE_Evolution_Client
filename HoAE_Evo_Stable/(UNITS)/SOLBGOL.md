NAME SolBGol
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0

ICONEX 0 0 interf3\PortretsBuilding\MchGold 0
ICONANM 0 0 interf3\PortretsBuilding\MchGold 1 108 1

LOCATION -0 -0 800 800
!STANDLO      1 0.45 Models\Buildings\MecBGol\Gold_Field_mine.c2m Models\Buildings\MecBGol\Gold_Field_mine.c2m
!BUILDLO_0    1 0.45 Models\Buildings\MecBGol\Gold_Field_mine.c2m Models\Buildings\MecBGol\Gold_Field_mine.c2m
!BUILDLO_1    1 0.45 Models\Buildings\MecBGol\Gold_Field_mine.c2m Models\Buildings\MecBGol\Gold_Field_mine.c2m
!BUILDLO_2    1 0.45 Models\Buildings\MecBGol\Gold_Field_mine.c2m Models\Buildings\MecBGol\Gold_Field_mine.c2m
!BUILDLO_3    1 0.45 Models\Buildings\MecBGol\Gold_Field_mine.c2m Models\Buildings\MecBGol\Gold_Field_mine.c2m
MOVEXY #STANDLO   85 -5
MOVEXY #BUILDLO_0 85 -5
MOVEXY #BUILDLO_1 85 -5
MOVEXY #BUILDLO_2 85 -5
MOVEXY #BUILDLO_3 85 -5
BORNPOINTS3 2 0 -25 3 130 100 3
CONCENTRATOR3 2 130 100 3 0 -25 3
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
LIFE     3000
PRICE 1 WOOD 100
BUILDSTAGES 50
BUILDHOTKEY		D
PROTECTION 3 piercing 15 magical 0 chopping 15
MATHERIAL 1 BUILDING
RECTANGLE    0 100 100 100
EXPLMEDIA BUILDING 5
VISION 4
3DBARS 1 -80 0 50 50 50
PEASANTABSORBER 5
PRODUCER        1 GOLD 0 1
USAGE MINE
RESSUBST
ROUNDLOCK 6
INVITEMASK 1
ADDSHOTRADIUS 140
BUILDBAR -2 0 2 0
SELTYPE SelBigBuilding 1.1 1.1
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_sol
DEATH_SOUND building_death
UPG_SOUND upgrade_sol
SPLITCLUSTERS #STANDLO 500 15 1 1 0
!TEMP4 10 1.5 Models\key_color\key_druid1.c2m Models\key_color\key_druid1.c2m
ANMEXT #STANDLO #TEMP4 96 0 160 0.9 2000
CYLINDER 60 50
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
!TEMP 1000 2.0 Models\Effects\Reborn\RebSpells\Smerch\DustSmerchSBezp.c2m
MOVEXY  #TEMP 15 10
ANMEXT #BUILDLO #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_0 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_1 #TEMP  0 0 0 1.0 5000
ANMEXT #BUILDLO_2 #TEMP  0 0 0 1.0 5000
//!TEMP 180 1.0 Models\Effects\Buildings\pipe_smoke.c2m Models\Effects\Buildings\pipe_smoke.c2m
//MOVEXY  #TEMP 0 0
//ADDHDIR #TEMP 0 160
//ANMEXT #STANDLO #TEMP 116 16 202 1.4 2000
ShadowScaleX 2.0
ShadowScaleY 1.9
MessageProduce #SolMine
TFACTOR FF919191
[END]