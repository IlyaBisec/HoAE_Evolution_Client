NAME livre_necro_gauche_R
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.4 Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m 
!BUILDLO_0    1 0.4 Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m 
!BUILDLO_1    1 0.4 Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m 
!BUILDLO_2    1 0.4 Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m 
!BUILDLO_3    1 0.4 Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m Models\Bld\UNDED\livre_necro_gauche_R\512x256\livre_necro_gauche_R.c2m 
MOVEXY #STANDLO   70 -20
MOVEXY #BUILDLO_0 70 -20
MOVEXY #BUILDLO_1 70 -20
MOVEXY #BUILDLO_2 70 -20
MOVEXY #BUILDLO_3 70 -20
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 0 0 0 100 80 0
GEOMETRY 1 199 32
LIFE     3000
PRICE 1 STONE 1
BUILDSTAGES 300
PROTECTION 3 piercing 15 magical 15 chopping 15
RECTANGLE    0 60 180 110
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 1 -40 -10 60 40 50
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 98
ROUNDLOCK 4
NOALTINFO
INVISIBLEONMINIMAP
CYLINDER 40 85
SPLITCLUSTERS #STANDLO 500 15 1 1 0
IMMORTAL
PortretDisable True

INVISIBLEONMINIMAP
IMMORTAL
*TEMP 1 10 1.00 Models\Anim_Objects\UndUBoLM.C2M Models\Anim_Objects\UndUBoLA.C2M 0 0.0 1.0
ANMEXT #STANDLO #TEMP 0 0 0 1.0 10000
BUILDBAR -4 0 4 0
ShadowScaleX 2.3
ShadowScaleY 1.0
[END]
