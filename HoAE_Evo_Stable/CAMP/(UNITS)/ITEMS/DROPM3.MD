NAME DropM3
ICON U_FrnOf17
!STAND  1 0.4 Models\Drop\treasure_eliteM1.C2M Models\Drop\treasure_eliteA.C2M
*PATTACK  2 30 0.4 Models\Drop\treasure_eliteM1.C2M Models\Drop\treasure_eliteA.C2M 0 0.000 0.999 1 0.4 Models\Drop\treasure_eliteM2.C2M Models\Drop\treasure_eliteA.C2M 0 0.999 1.000
*UATTACK  2 1 0.4 Models\Drop\treasure_eliteM2.C2M Models\Drop\treasure_eliteA.C2M 0 0.999 1.000 30 0.4 Models\Drop\treasure_eliteM1.C2M Models\Drop\treasure_eliteA.C2M 0 0.999 0.000
*PSTAND 1 1 0.4 Models\Drop\treasure_eliteM2.C2M Models\Drop\treasure_eliteA.C2M 0 0.999 1.000
*DEATH  2 30 0.4 Models\Drop\treasure_eliteM1.C2M Models\Drop\treasure_eliteA.C2M 0 0.000 0.999 1 0.4 Models\Drop\treasure_eliteM2.C2M Models\Drop\treasure_eliteA.C2M 0 0.999 1.000
ADDHDIR #STAND 0 128
ADDHDIR #ATTACK 0 128
ADDHDIR #PSTAND 0 128
ADDHDIR #UATTACK 0 128
ADDHDIR #PATTACK 0 128
LIFE 15
PROTECTION 4 piercing 50 magical 50 crushing 50 chopping 50
GEOMETRY 1 10 1
BUILDSTAGES 10
ROTATE 1
INFO 3 8
RECTANGLE    0 20 50 50
MATHERIAL 1 STENA
PRICE 1 STONE 1
MOTIONSTYLE SINGLESTEP
NOFARM
ABILITY ChestMC
LOWCOLLISION
INVISIBLEONMINIMAP
CYLINDER 20 25
FLYPARAM 1 1
INCORPOREAL
ShadowScaleX 2.0
ShadowScaleY 2.0
PortretDisable True
SOUND 2 #PATTACK open_chest
SOUND 2 #UATTACK open_chest
SelPrio 6
ABILITY	UA_aMagicImmunity_Sunduk
[END]
