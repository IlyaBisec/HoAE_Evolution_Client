NAME Altar_necro_attack_R
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.4 Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m 
!BUILDLO_0    1 0.4 Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m 
!BUILDLO_1    1 0.4 Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m 
!BUILDLO_2    1 0.4 Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m 
!BUILDLO_3    1 0.4 Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m Models\Bld\UNDED\Altar_necro_attack_R\512x512\Altar_necro_attack_R.c2m 
MOVEXY #STANDLO   -10 10
MOVEXY #BUILDLO_0 -10 10
MOVEXY #BUILDLO_1 -10 10
MOVEXY #BUILDLO_2 -10 10
MOVEXY #BUILDLO_3 -10 10
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
RECTANGLE    0 60 80 110
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 1 -50 05 25 50 90
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 98
ROUNDLOCK 4
NOALTINFO
INVISIBLEONMINIMAP
CYLINDER 30 70
ABILITY BonusAttack
CAPTURE
SPLITCLUSTERS #STANDLO 500 15 1 1 0
IMMORTAL
PortretDisable True

INVISIBLEONMINIMAP
IMMORTAL
BUILDBAR -3 0 3 0
ShadowScaleX 2.3
ShadowScaleY 1.0
[END]
