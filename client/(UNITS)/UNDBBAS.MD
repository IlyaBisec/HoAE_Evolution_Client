NAME  UndBBas
MESSAGE bastion
ICON U_FrnOf17
ICONEX 0 0 interf3\PortretsBuilding\UndWall 0
ICONANM 0 0 interf3\PortretsBuilding\UndWall 1 45 1
BUILDING
LIFE 5000
PROTECTION 4 piercing 15 magical 0 chopping 15 crushing 0
BUILDSTAGES 20
MATHERIAL 1 BUILDING
RECTANGLE 0 45 150 100
3DBARS 1 -90 0 90 90 60 
LONGDEATH
SELFTRANSFORM
PRICE 1 STONE 0
NOFARM
BUILDPOINTS   56   9 0 9 1 9 2 9 3 9 4 9 5 8 6 7 7 6 8 5 9 4 9 3 9 2 9 1 9    -9 0 -9 1 -9 2 -9 3 -9 4 -9 5 -8 6 -7 7 -6 8 -5 9 -4 9 -3 9 -2 9 -1 9     9 -0 9 -1 9 -2 9 -3 9 -4 9 -5 8 -6 7 -7 6 -8 5 -9 4 -9 3 -9 2 -9 1 -9    -9 -0 -9 -1 -9 -2 -9 -3 -9 -4 -9 -5 -8 -6 -7 -7 -6 -8 -5 -9 -4 -9 -3 -9 -2 -9 -1 -9
VES 15
ADDSHOTRADIUS 100
ABILITY BuildStage_Dru
EXPA 10
KILLERAWARD             GOLD 4
KILLERAWARDRANDOM       GOLD 1
SELECT_SOUND interface_click
ORDER_SOUND NullSound2
BORN_SOUND NullSound2
UPG_SOUND upgrade_undead
CYLINDER 50 70
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.0
TFACTOR FF858589
!TEMP5 180 1.0 Models\Effects\MagicCard\UndeadZona\UndeadZona.c2m Models\Effects\MagicCard\UndeadZona\UndeadZona.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
[END]
