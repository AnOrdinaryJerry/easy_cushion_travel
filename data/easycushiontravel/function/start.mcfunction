# Starts cushion travel, but only if the player is looking at a cushion.
# Called by toggle, as the player, at their position.
#
# find tags the cushion the player is looking at with ect_cushion (or tags nothing).
function easycushiontravel:find
# Not looking at a cushion: tell them and exit. Nothing was tagged on this path,
# so there's nothing to clean up.
execute unless entity @e[type=cushion,tag=ect_cushion,sort=nearest,limit=1] run return run tellraw @s {"text":"Look at a cushion first!","color":"red"}
tag @s add ect_traveling
tellraw @s {"text":"Cushion Travel Started.","color":"green"}
# Remove find's temporary tag. A leftover could make forward pick the wrong cushion next tick.
tag @e[type=cushion,tag=ect_cushion] remove ect_cushion
# Start the idle counter fresh in case an old value was left over.
scoreboard players set @s ect_idle 0