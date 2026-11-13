execute if predicate easycushiontravel:sneaking run return run function easycushiontravel:stop
function easycushiontravel:find
execute if entity @e[type=cushion,tag=ect_cushion] run scoreboard players set @s ect_idle 0
execute unless entity @e[type=cushion,tag=ect_cushion] run scoreboard players add @s ect_idle 1
execute if score @s ect_idle > #delay_ticks ect_config run return run function easycushiontravel:stop
execute if entity @e[type=cushion,tag=ect_cushion] run ride @s dismount
ride @s mount @e[type=minecraft:cushion,tag=ect_cushion,limit=1,sort=nearest]
tag @e[type=minecraft:cushion,tag=ect_cushion] remove ect_cushion