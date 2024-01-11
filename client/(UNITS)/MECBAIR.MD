NAME MecBAir
ICON U_FrnOf17
/ICON3D Models\Units\MecUZeS\MecUZeSM_fly.C2M Models\Units\MecUZeS\MecUZeSA_fly.C2M 5000 1.0 -0.1 0.2 0 

ICONEX 0 0 interf3\PortretsBuilding\MchAir 0
ICONANM 0 0 interf3\PortretsBuilding\MchAir 1 96 1

BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.41 Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m
!BUILDLO_0    1 0.41 Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m
!BUILDLO_1    1 0.41 Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m
!BUILDLO_2    1 0.41 Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m
!BUILDLO_3    1 0.41 Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m Models\Bld\MECH\Mech_Air_factory2\512x512\Mech_Air_factory2.c2m
MOVEXY #STANDLO   0 0
MOVEXY #BUILDLO_0 0 0
MOVEXY #BUILDLO_1 0 0
MOVEXY #BUILDLO_2 0 0
MOVEXY #BUILDLO_3 0 0
BORNPOINTS3 2 0 -50 0 0 -120 200  
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
SOUND 255 #STANDLO ambient_engine
GEOMETRY 1 199 32
LIFE     8000
PRICE 5 WOOD 1000 STONE 1000 IRON 300 COAL 300 GOLD 300
BUILDSTAGES 100
COSTPERCENT 400
MATHERIAL 1 BUILDING                 
RECTANGLE    0 150 150 150
EXPLMEDIA BUILDING 5
BUILDBAR -15 0 15 0
VISION 0
ROUNDLOCK 8
3DBARS 1 -70 0 70 70 100
!TEMP 180 1 Models\Buildings\MecBAir\M_Masterskaja_Ell.C2M Models\Buildings\MecBAir\M_Masterskaja_Ell_A.C2M
ANMEXT #STANDLO #TEMP 0 0 0 1.0 2000
TFACTOR FF919191
ADDSHOTRADIUS 155
ARTPLACE 5 1
ARTPLACE 6 1
PROTECTION 3 piercing 15 magical 0 chopping 15
SELTYPE SelBigBuilding 1.7 1.7
ABILITY BuildStage
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
SELECT_SOUND interface_click
BORN_SOUND building_ready_mechanic
DEATH_SOUND building_death
UPG_SOUND upgrade_mechanic
CYLINDER 90 120
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.3
ShadowScaleY 1.3
[END]
