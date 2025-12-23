NAME MecBBoi

ICON U_FrnOf17
/ICON3D Models\Units\MecUCan\MecUCanM.C2M Models\Units\MecUCan\MecUCanA_walk2.C2M 5000 1.0 -0.1 0.7 0 
BUILDING
SETANMPARAM -0 -0 1 0

ICONEX 0 0 interf3\PortretsBuilding\MchKot 0
ICONANM 0 0 interf3\PortretsBuilding\MchKot 1 48 1

LOCATION -0 -0 800 800
!STANDLO      1 0.45 Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m
!BUILDLO_0    1 0.45 Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m
!BUILDLO_1    1 0.45 Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m
!BUILDLO_2    1 0.45 Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m
!BUILDLO_3    1 0.45 Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m Models\Bld\MECH\Kotelnaya_D\512x512\Kotelnaya_D.c2m
MOVEXY #STANDLO   60 40
MOVEXY #BUILDLO_0 60 40
MOVEXY #BUILDLO_1 60 40
MOVEXY #BUILDLO_2 60 40
MOVEXY #BUILDLO_3 60 40
BORNPOINTS3 2 -40 -50  0 155 130 0
ADDHDIR #STANDLO 10 160
ADDHDIR #BUILDLO_0 10 160
ADDHDIR #BUILDLO_1 10 160
ADDHDIR #BUILDLO_2 10 160
ADDHDIR #BUILDLO_3 10 160
SOUND 255 #STANDLO ambient_engine
GEOMETRY 1 199 32
LIFE     5500
PRICE 3 GOLD 300 STONE 900 IRON 1200
BUILDSTAGES 15
PROTECTION 3 piercing 15 magical 0 chopping 15
COSTPERCENT 400
MATHERIAL 1 BUILDING
RECTANGLE    0 100 120 120
EXPLMEDIA BUILDING 5
BUILDBAR -15 0 15 0
VISION 0
ROUNDLOCK 8
3DBARS 1 -80 0 80 80 100
ABILITY Settlement
ARTPLACE 3 1
ARTPLACE 4 1
ADDSHOTRADIUS 155
SELTYPE SelBigBuilding 1.8 1.8
ABILITY BuildStage
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_mechanic
DEATH_SOUND building_death
UPG_SOUND upgrade_mechanic
CYLINDER 80 120
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding

!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 46 -155 366 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 79 -155 316 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 103 -154 394 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 73 116 285 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 96 123 361 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 116 119 325 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 148 119 259 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 166 119 294 1.3 2000
!TEMP 180 1.0 Models\Effects\Buildings\parsmoke1.c2m Models\Effects\Buildings\parsmoke1.c2m
MOVEXY  #TEMP 0 0
ADDHDIR #TEMP 0 160
ANMEXT #STANDLO #TEMP 191 119 302 1.3 2000
ShadowScaleX 1.7
ShadowScaleY 1.2
TFACTOR FF919191
[END]
