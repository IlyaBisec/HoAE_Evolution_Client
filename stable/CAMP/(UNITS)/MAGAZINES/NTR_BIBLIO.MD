NAME  Ntr_Biblio
ICON U_FrnOf17
BUILDING
SETANMPARAM -0 -0 1 0
LOCATION -0 -0 800 800

ICONEX 0 0 interf3\PortretsBuilding\_inv_Library 0
ICONANM 0 0 interf3\PortretsBuilding\_inv_Library 1 18 1

!STANDLO      1 0.4 Models\Bld\NETRAL\viex_biblio02\1024x512\viex_biblio02.c2m Models\Bld\NETRAL\viex_biblio02\1024x512\viex_biblio02.c2m
MOVEXY #STANDLO    20 0
MOVEXY #BUILDLO_0  20 0
MOVEXY #BUILDLO_1  20 0
MOVEXY #BUILDLO_2  20 0
MOVEXY #BUILDLO_3  20 0
ADDHDIR #STANDLO 0 226
ADDHDIR #BUILDLO_0 0 226
ADDHDIR #BUILDLO_1 0 226
ADDHDIR #BUILDLO_2 0 226
ADDHDIR #BUILDLO_3 0 226
BORNPOINTS3 2 0 0 0 100 80 0
GEOMETRY 1 199 32
LIFE     3000
PRICE 1 STONE 1
BUILDSTAGES 300
PROTECTION 3 piercing 15 magical 15 chopping 15
RECTANGLE    0 60 80 60
MATHERIAL 1 BUILDING
EXPLMEDIA BUILDING 5
BUILDBAR -9 0 9 0
3DBARS 1 -28 -3 15 25 50
INFO 3 8
COSTPERCENT 300
VISION 0
MFARM 200
ADDSHOTRADIUS 185
ROUNDLOCK 10

ABILITY ShopMagicCard

/ABILITY MagicCardFear
/ABILITY MagicCardSwarmOfInsects
/ABILITY MagicCardPolymorph
/ABILITY MagicCardFreeze1
/ABILITY MagicCardLightningEye
/ABILITY MagicCardStatueOfRage
/ABILITY MagicCardIllusion
/ABILITY MagicCardFlashToStone
/ABILITY MagicCardVortex
/ABILITY MagicCardMagicSemena1
/ABILITY MagicCardFireBall1

/ABILITY MC_aDesease
/ABILITY MC_aAirSupport
/ABILITY MC_aTreeOfLife
/ABILITY MC_aGhostlyPrison
/ABILITY MC_aSummonDjin
/ABILITY MC_aWallOfRoots
/ABILITY MC_aCallOfNature
/ABILITY MC_aSummons
/ABILITY MC_aRoamFires
/ABILITY MC_aLightningStorm
/ABILITY MC_aFireStorm
/ABILITY MC_aStatueOfRage
/ABILITY MC_aDryUp
/ABILITY MC_aTornado
/ABILITY MC_aHurricane
/ABILITY MC_aStorm
/ABILITY MC_aAcidWave
/ABILITY MC_aWhiteMagic_Heal
/ABILITY MC_aStoneFist
/ABILITY MagicCardMagicSemena1
/ABILITY MC_aDecay
/ABILITY MC_aUnsummon
/ABILITY MC_aStealLife
/ABILITY MC_aRuneOfFire
/ABILITY MC_aFireRing
/ABILITY MC_aNecromancy
/ABILITY MC_aHolyLight
/ABILITY MC_aMagmaBall
/ABILITY MagicCardFreeze1
/ABILITY MC_aAbsorbMagic
/ABILITY MC_aStatueOfRage
/ABILITY MC_aTrap
/ABILITY MC_aAuraOfFire
/ABILITY MC_aIllusion
/ABILITY MC_aPolymorph
/ABILITY MagicCardStatueOfRage
/ABILITY MagicCardLightningEye
/ABILITY MagicCardSwarmOfInsects
/ABILITY MagicCardInvisibility
/ABILITY MagicCardFireBall1
/ABILITY MC_aAcid
/ABILITY MC_aRiseOfUndeads
/ABILITY MagicCardMagicSemena1
/ABILITY MagicCardFear
/ABILITY MC_aPolymorph
/ABILITY MagicCardStatueOfRage
/ABILITY MagicCardIllusion
/ABILITY MagicCardFlashToStone
/ABILITY MagicCardVortex
/ABILITY MagicCardDeathTrick
/ABILITY MagicCardGolem
/ABILITY MagicCardEarthquake1

ABILITY MagicCardStoneSkin
ABILITY MC_aIllusion
ABILITY MC_aFarSight
ABILITY MC_aLastBreath
ABILITY MC_aHolyLight
ABILITY MC_aDecay
ABILITY MC_aAcidWave
ABILITY MC_aRiseOfUndeads
ABILITY MC_aCallOfNature
ABILITY MC_aNecromancy
ABILITY MC_aTreeOfLife
ABILITY MC_aWordofBanish
ABILITY MC_aChillArrow
ABILITY MC_aEnchant
ABILITY MC_aGrenade
ABILITY MC_aLandmine
ABILITY MC_aAuraOfFire
ABILITY MagicCardMagicSemena1
ABILITY MC_aWordofBanish
ABILITY MagicCardFear

CAPTURE
IMMORTAL
ABILITY UA_aUseBuilding
FORMFACTOR 470
CYLINDER 100 80
SPLITCLUSTERS #STANDLO 500 15 1 1 0
PortretDisable True
NOALTINFO
INVISIBLEONMINIMAP
IMMORTAL
[END]
