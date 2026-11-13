scoreboard players operation #delay_ticks ect_config = #delay ect_config
scoreboard players operation #delay_ticks ect_config *= #20 ect_config
execute as @a[scores={ect_left=1..}] run function easycushiontravel:rejoin
execute as @a[tag=ect_traveling] at @s run function easycushiontravel:forward
scoreboard players enable @a ect
execute as @a[scores={ect=1..}] at @s run function easycushiontravel:toggle