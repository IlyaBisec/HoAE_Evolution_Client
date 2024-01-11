NAME Large_Teleporter_002
ICON U_FrnOf17
BUILDING
LOCKPOINTS   51  

-4 -4 -3 -4 -2 -4 -1 -4
-4 -3 -3 -3 -2 -3 -1 -3 0 -3 
-4 -2 -3 -2 -2 -2 -1 -2 0 -2 1 -2 
-4 -1 -3 -1 -2 -1 -1 -1 0 -1 1 -1 2 -1 
 -3  0 -2  0 -1  0 0  0 1  0 2  0 3  0 
 -2  1 -1  1 0  1 1  1 2  1 3  1 4  1
 -1  2 0  2 1  2 2  2 3  2 4  2
 0  3 1  3 2  3 3  3 4  3
 1  4 2  4 3  4 4  4

CHECKPOINTS  51

-4 -4 -3 -4 -2 -4 -1 -4
-4 -3 -3 -3 -2 -3 -1 -3 0 -3 
-4 -2 -3 -2 -2 -2 -1 -2 0 -2 1 -2 
-4 -1 -3 -1 -2 -1 -1 -1 0 -1 1 -1 2 -1 
 -3  0 -2  0 -1  0 0  0 1  0 2  0 3  0 
 -2  1 -1  1 0  1 1  1 2  1 3  1 4  1
 -1  2 0  2 1  2 2  2 3  2 4  2
 0  3 1  3 2  3 3  3 4  3
 1  4 2  4 3  4 4  4

SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800
!STANDLO      1 0.6 Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m 
!BUILDLO_0    1 0.6 Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m 
!BUILDLO_1    1 0.6 Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m 
!BUILDLO_2    1 0.6 Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m 
!BUILDLO_3    1 0.6 Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m Models\Bld\DRUID\Large_Teleporter_002\512x256\Large_Teleporter_002.c2m 
MOVEXY #STANDLO   -20 0
MOVEXY #BUILDLO_0 -20 0
MOVEXY #BUILDLO_1 -20 0
MOVEXY #BUILDLO_2 -20 0
MOVEXY #BUILDLO_3 -20 0
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
BORNPOINTS3 2 0 0 0 60 -60 0
GEOMETRY 1 199 32
LIFE     3000
PRICE 1 STONE 1
BUILDSTAGES 300
PROTECTION 3 piercing 15 magical 15 chopping 15
RECTANGLE    0 60 100 80
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
3DBARS 1 -50 0 50 50 50
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 70
NOALTINFO
INVISIBLEONMINIMAP
UNITABSORBER 1
POSPOINTS 1 0 0
INVITEMASK 3
CYLINDER 55 65
SPLITCLUSTERS #STANDLO 500 15 1 1 0
IMMORTAL
PortretDisable True

INVISIBLEONMINIMAP
IMMORTAL
BUILDBAR -5 0 5 0
ShadowScaleX 1.8
ShadowScaleY 2.4
[END]
