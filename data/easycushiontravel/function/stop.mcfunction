# Stops cushion travel for the player. Every way of stopping goes through here:
# /trigger ect (toggle), sneaking and the timeout (forward), and rejoining (rejoin).
# Runs as the player.
#
# Whether a player is traveling is decided by this tag alone.
tag @s remove ect_traveling
tellraw @s {"text":"Cushion Travel Stopped.","color":"aqua"}
# Reset the idle counter so the next trip starts fresh.
scoreboard players set @s ect_idle 0