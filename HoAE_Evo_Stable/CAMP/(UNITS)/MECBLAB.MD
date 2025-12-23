NAME MecBLab
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0

ICONEX 0 0 interf3\PortretsBuilding\MchAlh 0
ICONANM 0 0 interf3\PortretsBuilding\MchAlh 1 59 1

LOCATION -0 -0 800 800
!STANDLO      1 0.51 Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m
!BUILDLO_0    1 0.51 Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m
!BUILDLO_1    1 0.51 Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m
!BUILDLO_2    1 0.51 Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m
!BUILDLO_3    1 0.51 Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m Models\Bld\MECH\Mech_Alximic\512x512\Mech_Alximic.c2m
MOVEXY #STANDLO   8 20
MOVEXY #BUILDLO_0 8 90
MOVEXY #BUILDLO_1 8 90
MOVEXY #BUILDLO_2 8 90
MOVEXY #BUILDLO_3 8 90
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
LIFE     5500
PRICE 2 STONE 300 GOLD 300
BUILDSTAGES 8
COSTPERCENT 1000
MATHERIAL 1 BUILDING
RECTANGLE    0 80 150 120
EXPLMEDIA BUILDING 5
BUILDBAR -14 0 14 0
VISION 0
ROUNDLOCK 8
3DBARS 1 -80 0 100 70 140
ADDSHOTRADIUS 155
TORG
PROTECTION 3 piercing 15 magical 0 chopping 15
SELTYPE SelBigBuilding 1.9 1.9
ABILITY BuildStage
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_mechanic
DEATH_SOUND building_death
UPG_SOUND upgrade_mechanic
CYLINDER 85 120
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding

!TEMP 180 1.0 Models\Effects\Buildings\green_smoke.c2m Models\Effects\Buildings\green_smoke.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 95 -100  258 1.0 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 12 35 350 1.0 2000
FORMFACTOR 512
ShadowScaleX 2.3
ShadowScaleY 1.4
TFACTOR FF919191
[END]
