NAME MecBMin
ICON U_FrnOf17
BUILDING
LOCKPOINTS         1 0 0
CHECKPOINTS        1 0 0
BUILDLOCKPOINTS    1 0 0
BUILDPOINTS        1 2 2
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800

ICONEX 0 0 interf3\PortretsBuilding\MchMin 0
ICONANM 0 0 interf3\PortretsBuilding\MchMin 1 103 1

!STANDLO     1 0.0001 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
/!BUILDLO_0    30 1 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
!BUILDLO_1    30 1 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
!BUILDLO_2    30 1 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
!BUILDLO_3    30 1 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
!DEATH        1 1 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
MOVEXY #STANDLO    2 6
MOVEXY #BUILDLO_0  2 6
MOVEXY #BUILDLO_1  2 6
MOVEXY #BUILDLO_2  2 6
MOVEXY #BUILDLO_3  2 6
ADDHDIR #STANDLO   0 0
ADDHDIR #BUILDLO_0 0 0
ADDHDIR #BUILDLO_1 0 0
ADDHDIR #BUILDLO_2 0 0
ADDHDIR #BUILDLO_3 0 0
GEOMETRY 1 199 0
LIFE     100
PRICE 2 STONE 50 COAL 50
BUILDSTAGES 1
COSTPERCENT 100
MATHERIAL 1 BUILDING
RECTANGLE    0 1 1 1
EXPLMEDIA BUILDING 5
BUILDBAR -2 0 2 0
VISION 0
3DBARS 1  0 0 5 5 5
ABILITY UA_aLandmine
/ABILITY BuildStage
!TEMP 30 10000 Models\Effects\MagicCard\Mina\Mina.C2M Models\Effects\MagicCard\Mina\MinaAN.C2M
ANMEXT #STANDLO #TEMP 40000 90000 0 1.0 1000
NOALTINFO
INVISIBLEONMINIMAP
EXPA 25
KILLERAWARD             GOLD 2
KILLERAWARDRANDOM       GOLD 1
SELECT_SOUND interface_click
BORN_SOUND building_ready_mechanic
DEATH_SOUND building_death
SPLITCLUSTERS #STANDLO 500 30 1 1 0
/ABILITY UA_DamagedBuilding
/ABILITY UA_DamagedBuilding2
/ABILITY UA_DamagedBuilding3
/ABILITY UA_DestroyBuilding
NOBLENDING
CYLINDER 10 10
ShadowScaleX 1.0
ShadowScaleY 1.0
TFACTOR FF919191
[END]
