tag @s add ect_rider
execute as @s at @s as @e[type=minecraft:cushion,distance=..3.5] on passengers on vehicle run tag @s add ect_occupied
execute as @s at @s as @e[type=minecraft:cushion,distance=..3.5,tag=!ect_occupied] at @s facing entity @p[tag=ect_rider] eyes positioned ^ ^ ^1 rotated as @p[tag=ect_rider] positioned ^ ^ ^1 if entity @s[distance=..0.2] at @s run tag @s add ect_cushion
tag @s remove ect_rider
tag @e[type=minecraft:cushion] remove ect_occupied