tellraw @a {"text":"Easy Cushion Travel Loaded!","color":"green"}
scoreboard objectives add ect trigger
scoreboard objectives add ect_idle dummy
scoreboard objectives add ect_config dummy
scoreboard players set #20 ect_config 20
scoreboard objectives add ect_left minecraft.custom:minecraft.leave_game
execute unless score #delay ect_config matches 0.. run scoreboard players set #delay ect_config 3