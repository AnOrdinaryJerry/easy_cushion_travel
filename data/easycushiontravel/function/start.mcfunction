function easycushiontravel:find
execute unless entity @e[type=cushion,tag=ect_cushion,sort=nearest,limit=1] run return run tellraw @s {"text":"Look at a cushion first!","color":"red"}
tag @s add ect_traveling
tellraw @s {"text":"Cushion Travel Started.","color":"green"}
tag @e[type=cushion,tag=ect_cushion] remove ect_cushion