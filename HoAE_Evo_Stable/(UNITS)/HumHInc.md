NAME HumHInc
ICON U_FrnOf17
ICONEX 0 0 interf3\UnitPortrets\Ranger 0
ICONSET 3 0 0 interf3\UnitPortrets\Ranger1 0 100 1
ICONSET 1 0 0 interf3\UnitPortrets\Ranger2 0 100 1
!STAND          1 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_stand2.C2M
ADDHDIR #STAND 0 128
!REST          60 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_stand2.C2M
ADDHDIR #REST 0 128
!REST          120 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_stand3.C2M
ADDHDIR #REST 0 128
!MOTION_L      36 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_walk1.C2M
ADDHDIR #MOTION_L 0 128
!MOTION_R      62 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_run1.C2M
ADDHDIR #MOTION_R 0 128                                                        
!PSTAND        1  0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_attack1.C2M
ADDHDIR #PSTAND 0 128 
!ATTACK        70 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_attack1.C2M
ADDHDIR #ATTACK 0 128
/!DEATH         40 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_death1.C2M
/ADDHDIR #DEATH 0 128
/!SPELL        70 0.21 Models\Units\HumHTor\HumHToMM.C2M Models\Units\HumHTor\HumHTorA_spell1.C2M
/ADDHDIR #SPELL 0 128
ROTATE 32
SPEEDSCALE 139
GEOMETRY 1 40 36
DAMAGE   0 16
LIFE     350
RECTANGLE 0 0 30 75
ATTACK_RADIUS 0 15 60
ATTACK_PAUSE 0 0
SEARCH_ENEMY_RADIUS 250
DET_RADIUS 0 0 8000
MATHERIAL 1 BODY
CANKILL 3 BODY BUILDING WOOD
ATTMASK 0 3 BODY WOOD BUILDING
PRICE 1 FOOD 100
WEAPONKIND 0 chopping
WEAPON 0 UW_Splash40
BUILDSTAGES 100
VISION 8
STANDGROUND
VES 30
MOTIONSTYLE SINGLESTEP
MOVEBREAK #MOTION_L
MOVEBREAK #ATTACK
BREAKAFTERFRAME #ATTACK 19
BREAKANIMATION #REST
BREAKANIMATION #PSTAND
BREAKANIMATION #STAND
ADDSHOTRADIUS 8
PROTECTION 4 chopping 7 magical 3 piercing 9 crushing 5
UNITRADIUS 16
ZPOINTS 40 40
SETACTIVEPOINT0 #ATTACK 19
CANSTORM
VISITORMASK 1
PLACEINTRANSPORT 25
LOWCOLLISION
DAMAGEONBUILDINGMULTIPLICATOR 10
COLUMN 3
CYLINDER 20 50
EXPA 750
NO_HUNGRY
INCORPOREAL
PortretHeroFile Interf3\heroesPictures\Elhant_Ranger
SelPrio 5
NIKAKIXMAM
SELTYPE SelHero1 1 1
SELSHIFT 0
ABILITY HeroAbilityHumansMP
ABILITY HeroAura_aRun_R
ABILITY HA_aHeroLight
ABILITY sa_Inquisitor_Bless
ABILITY sa_Inquisitor_EnchantArmor
ABILITY sa_Inquisitor_EnchantWeapon
ABILITY sa_Inquisitor_EnchantHealth
ABILITY sa_Inquisitor_FirstAid
ABILITY sa_Inquisitor_Net
ABILITY sa_Inquisitor_ChokingNet
ABILITY sa_Inquisitor_Silence
ABILITY sa_Inquisitor_ManaBurn
ABILITY sa_Inquisitor_CleansingFire
ABILITY sa_Inquisitor_Whirlwind
ABILITY sa_Inquisitor_Stun
ABILITY sa_Inquisitor_Range
ABILITY sa_Inquisitor_Endurance
ABILITY sa_Inquisitor_Sharpshoot
ABILITY sa_Inquisitor_FastShoot
ABILITY sa_Inquisitor_Poison
ABILITY sa_Inquisitor_Strafe
AntiMage True
ABILITY Treasure_Weapon_1
ABILITY Bottle20
ABILITY Bottle9
ABILITY MC_aSummonPeasants_Human
[END]
