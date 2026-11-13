execute as @a[tag=ect_traveling] at @s run function easycushiontravel:forward
scoreboard players enable @a ect
execute as @a[scores={ect=1..}] at @s run function easycushiontravel:toggle