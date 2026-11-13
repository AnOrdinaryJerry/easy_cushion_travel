# Cleans up a player who left the game and came back.
# Called by tick for players whose ect_left score is 1 or more, as the player.
#
# ect_left counts how many times the player has left. Reset it so this runs once per rejoin.
scoreboard players set @s ect_left 0 
# If they left mid-trip they still have ect_traveling, so stop them properly.
execute if entity @s[tag=ect_traveling] run function easycushiontravel:stop