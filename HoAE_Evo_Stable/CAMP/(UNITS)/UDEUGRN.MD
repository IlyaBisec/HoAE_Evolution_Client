NAME UdeUGrN
ICON U_FrnOf17
ICONEX 0 0 interf3\UnitPortrets\Undead_back 0
ICONANM 0 0 interf3\UnitPortrets\Undead_back 1 43 1
ICONANM 0 0 interf3\UnitPortrets\Undead_neutral 3 3 0
!STAND          1 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_rest1.C2M
ADDHDIR #STAND 0 128
!REST          75 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_rest1.C2M
ADDHDIR #REST 0 128
!REST          75 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_rest2.C2M
ADDHDIR #REST 0 128
!REST          60 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_rest3.C2M
ADDHDIR #REST 0 128
!REST          60 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_rest4.C2M
ADDHDIR #REST 0 128
!MOTION_L      20 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_walk1.C2M
ADDHDIR #MOTION_L 0 128
!PSTAND        1  0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_attack1.C2M
ADDHDIR #PSTAND 0 128 
!ATTACK        40 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_attack1.C2M
ADDHDIR #ATTACK 0 128
!DEATH         100 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_death1.C2M
ADDHDIR #DEATH 0 128
SOUND 26 #DEATH death_sobakamedved
!DEATH         75 0.34 Models\Units\UdeUGra\UdeUGraN.C2M Models\Units\UdeUGra\UdeUGraA_death2.C2M
ADDHDIR #DEATH 0 128
SOUND 26 #DEATH death_sobakamedved
GEOMETRY 1 14 120
DAMAGE   0 50
LIFE     1000
RECTANGLE 0 2 45 65
ATTACK_RADIUS 0 0 135
ATTACK_PAUSE 0 0
SEARCH_ENEMY_RADIUS 500
DET_RADIUS 0 0 7000
MATHERIAL 1 BODY
CANKILL 3 BODY BUILDING WOOD 
PRICE 2 FOOD 200 COAL 500
WEAPONKIND 0 chopping
WEAPON 0 UW_wGravedigger
BUILDSTAGES 3600
VISION 1
STANDGROUND
INFO 0 28
VES 30
MOTIONSTYLE SINGLESTEP
ROTATE 16
MOVEBREAK #MOTION_L
BREAKANIMATION #REST
BREAKANIMATION #PSTAND
BREAKANIMATION #STAND
ADDSHOTRADIUS 10
PROTECTION 4 chopping 12 magical 0 piercing 16 crushing 19
SETACTIVEPOINT0 #ATTACK 13
CANSTORM
ABILITY Drop_ItemDropRelic
ABLDROP Drop_ItemDropRelic 10
ABILITY ua_Drop_Magic_Level_4
ABLDROP ua_Drop_Magic_Level_4 5
COLLISION 32
SELTYPE SelBig 1 1
EXPA 1300
KILLERAWARD             GOLD 577
KILLERAWARDRANDOM       GOLD 144
LOWCOLLISION
ZPOINTS 40 40
UNITRADIUS 16
CYLINDER 45 55
SOUND 13 #ATTACK attack_dubina
!TEMP  1 40 models\empty\empty.c2m models\empty\emptya.c2m
ANMEXT #ATTACK #TEMP 0 0 0 1 0
CANTCAPTURE
NO_HUNGRY
ShadowScaleX 2.4
ShadowScaleY 1.5
SOUND 13 #ATTACK hit_gravedigger
!TEMP  1 40 models\empty\empty.c2m models\empty\emptya.c2m
ANMEXT #ATTACK #TEMP 0 0 0 1 0
SOUND 10 #TEMP attack_sobakamedved
SOUND 9 #MOTION_L giant_step
SOUNDFRAME2 #MOTION_L 19
!TEMP1  1 20 models\empty\empty.c2m models\empty\emptya.c2m
ANMEXT #MOTION_L #TEMP1 0 0 0 1 0
SOUND 4 #TEMP1 giant_step
SOUNDFRAME2 #TEMP1 14
NIKAKIXMAM
TFACTOR FF756E6B
NOCOLLISION
[END]
