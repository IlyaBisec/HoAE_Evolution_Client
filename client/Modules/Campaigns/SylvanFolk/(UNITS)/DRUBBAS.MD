NAME DruBBas
MESSAGE bastion
ICON U_FrnOf17
ICONEX 0 0 interf3\PortretsBuilding\DruWall 0
ICONANM 0 0 interf3\PortretsBuilding\DruWall 1 46 1
BUILDING
LIFE 5000
PROTECTION 4 piercing 15 magical 0 chopping 15 crushing 0
BUILDSTAGES 20
MATHERIAL 1 BUILDING
RECTANGLE 0 45 150 100
3DBARS 1 -90 0 90 90 60 
LONGDEATH
SELFTRANSFORM
PRICE 1 WOOD 0
NOFARM
BUILDPOINTS   56   9 0 9 1 9 2 9 3 9 4 9 5 8 6 7 7 6 8 5 9 4 9 3 9 2 9 1 9    -9 0 -9 1 -9 2 -9 3 -9 4 -9 5 -8 6 -7 7 -6 8 -5 9 -4 9 -3 9 -2 9 -1 9     9 -0 9 -1 9 -2 9 -3 9 -4 9 -5 8 -6 7 -7 6 -8 5 -9 4 -9 3 -9 2 -9 1 -9    -9 -0 -9 -1 -9 -2 -9 -3 -9 -4 -9 -5 -8 -6 -7 -7 -6 -8 -5 -9 -4 -9 -3 -9 -2 -9 -1 -9
VES 15
ADDSHOTRADIUS 100
ABILITY BuildStage_Dru
EXPA 10
KILLERAWARD             GOLD 4
KILLERAWARDRANDOM       GOLD 1
SELECT_SOUND interface_click
BORN_SOUND building_ready
DEATH_SOUND building_death
FORMFACTOR 256
CYLINDER 80 70
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.0
TFACTOR FF43403E
!TEMP5 180 1.0 Models\Effects\MagicCard\Listva\Listva.c2m Models\Effects\MagicCard\Listva\Listva.c2m
MOVEXY  #TEMP5 0 0
ADDHDIR #TEMP5 0 160
ANMEXT #STANDLO #TEMP5 0 0 0 1.0 2000
[END]
