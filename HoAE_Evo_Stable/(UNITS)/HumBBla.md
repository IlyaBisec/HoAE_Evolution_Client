NAME HumBBla
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0

ICONEX 0 0 interf3\PortretsBuilding\MchMast 0
ICONANM 0 0 interf3\PortretsBuilding\MchMast 1 63 1
LOCATION -0 -0 800 800
!STANDLO      1 0.29 Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m
!BUILDLO_0    1 0.29 Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m
!BUILDLO_1    1 0.29 Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m
!BUILDLO_2    1 0.29 Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m
!BUILDLO_3    1 0.29 Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m Models\Bld\Humans\Knd_kuznica\1024x512\Knd_kuznica.c2m
MOVEXY #STANDLO   0 0
MOVEXY #BUILDLO_0 0 0
MOVEXY #BUILDLO_1 0 0
MOVEXY #BUILDLO_2 0 0
MOVEXY #BUILDLO_3 0 0
ADDHDIR #STANDLO 0 96
ADDHDIR #BUILDLO_0 0 96
ADDHDIR #BUILDLO_1 0 96
ADDHDIR #BUILDLO_2 0 96
ADDHDIR #BUILDLO_3 0 96
GEOMETRY 1 199 32
LIFE     8000
PRICE 2 STONE 100 IRON 500
BUILDSTAGES 70
COSTPERCENT 1000
MATHERIAL 1 BUILDING
RECTANGLE    0 100 130 130
EXPLMEDIA BUILDING 5
BUILDBAR -11 0 11 0
VISION 0
ROUNDLOCK 5
3DBARS 1 -80 30 30 110 80
ADDSHOTRADIUS 100
PROTECTION 3 piercing 15 magical 0 chopping 15
SELTYPE SelBigBuilding 1.2 1.2
EXPA 500
KILLERAWARD             GOLD 111
KILLERAWARDRANDOM       GOLD 27
CYLINDER 50 50
SPLITCLUSTERS #STANDLO 500 15 1 1 0
ABILITY UA_DamagedBuilding
ABILITY UA_DamagedBuilding2
ABILITY UA_DamagedBuilding3
ABILITY UA_DestroyBuilding
ShadowScaleX 2.0
ShadowScaleY 1.7
!TEMP 50 1.00 Models\Bld\Humans\AO\HumBKuzM.c2m Models\Bld\Humans\AO\HumBKuzA.c2m
ANMEXT #STANDLO #TEMP 0 0 0 1.0 10000
[END]
