NAME EffBApl
ICON U_FrnOf17

ICONEX 0 0 interf3\PortretsBuilding\DruBApl 0
ICONANM 0 0 interf3\PortretsBuilding\DruBApl 1 60 1

CHECKPOINTS        1 1 1
BUILDLOCKPOINTS    1 1 1
BUILDPOINTS        4 2 2 -2 -2 2 -2 -2 2
BUILDING
SETANMPARAM -0 -0 1 0              
LOCATION -0 -0 800 800
!STANDLO    1 0.3 Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m
//!BUILDLO_0    1 0.3 Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m
!BUILDLO_1    1 0.3 Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m
!BUILDLO_2    1 0.3 Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m
!BUILDLO_3    1 0.3 Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m Models\Effects\MagicCard\TreeOfLife\1024x512\Tree_Food_resurs.c2m
MOVEXY #STANDLO   20 0
MOVEXY #BUILDLO_0 20 0
MOVEXY #BUILDLO_1 20 0
MOVEXY #BUILDLO_2 20 0
MOVEXY #BUILDLO_3 20 0
ADDHDIR #STANDLO 0 160
ADDHDIR #BUILDLO_0 0 160
ADDHDIR #BUILDLO_1 0 160
ADDHDIR #BUILDLO_2 0 160
ADDHDIR #BUILDLO_3 0 160
GEOMETRY 1 199 32
PRICE 1 WOOD 15
LIFE     150
MATHERIAL 1 BUILDING
BUILDSTAGES 3
RECTANGLE    0 100 100 100
EXPLMEDIA BUILDING 5
PROTECTION 2 piercing 10 crushing 5
BUILDBAR -5 0 5 0
VISION 1
//SPRITEOBJECT
//EXSPRITES  D00 3 6 44 0
//BORNSPRITE D00
ADDSHOTRADIUS 100
NOALTINFO
NOCOLLISION
SELTYPE SelBigBuilding 0.65 0.65
CYLINDER 20 50
SPLITCLUSTERS #STANDLO 500 15 1 1 0
PortretDisable True
ABILITY MC_aTreeOfLife_Graph
[END]
