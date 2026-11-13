function easycushiontravel:find
execute if entity @e[type=cushion,tag=ect_cushion] run ride @s dismount
ride @s mount @e[type=minecraft:cushion,tag=ect_cushion,limit=1,sort=nearest]
tag @e[type=minecraft:cushion,tag=ect_cushion] remove ect_cushion