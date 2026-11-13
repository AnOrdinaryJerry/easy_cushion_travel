tag @s add ect_rider
execute as @s at @s as @e[type=minecraft:cushion,distance=..3.5] at @s facing entity @p[tag=ect_rider] eyes positioned ^ ^ ^1 rotated as @p[tag=ect_rider] positioned ^ ^ ^1 if entity @s[distance=..0.2] at @s run tag @s add ect_cushion
tag @s remove ect_rider