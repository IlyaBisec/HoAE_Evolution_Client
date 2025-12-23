NAME orc_shamanhouse
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.450 Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m 
!BUILDLO_0    1 0.450 Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m 
!BUILDLO_1    1 0.450 Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m 
!BUILDLO_2    1 0.450 Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m 
!BUILDLO_3    1 0.450 Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m Models\Bld\NETRAL\orc_shamanhouse\512x512\orc_shamanhouse.c2m 
MOVEXY #STANDLO   0 0
MOVEXY #BUILDLO_0 0 0
MOVEXY #BUILDLO_1 0 0
MOVEXY #BUILDLO_2 0 0
MOVEXY #BUILDLO_3 0 0
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
RECTANGLE    0 0 80 120
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 1 -50 0 50 50 50
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 140
ROUNDLOCK 7
SPLITCLUSTERS #STANDLO 500 15 1 1 0
CYLINDER 110 220
BUILDBAR -7 0 7 0
ShadowScaleX 1.1
ShadowScaleY 1.0
PortretDisable True
[END]
