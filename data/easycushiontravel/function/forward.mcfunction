# The travel loop: hops the player onto the cushion they're looking at.
# Called by tick every tick for players tagged ect_traveling, as the player, at the player.
#
# Sneaking stops travel. This has to be the first line, so the player is stopped
# before find and the mount below can put them back on a cushion.
execute if predicate easycushiontravel:sneaking run return run function easycushiontravel:stop
# Tags the cushion the player is looking at with ect_cushion (or nothing).
function easycushiontravel:find
# Found a cushion: reset the idle counter. No cushion: count one more idle tick.
execute if entity @e[type=cushion,tag=ect_cushion] run scoreboard players set @s ect_idle 0
execute unless entity @e[type=cushion,tag=ect_cushion] run scoreboard players add @s ect_idle 1
# Timeout. Uses > instead of >= so a delay of 0 means "stop on the first miss".
# With >=, the counter of 0 after a hop would already count as timed out.
# Nothing is tagged on this path, so returning early skips no cleanup.
execute if score @s ect_idle > #delay_ticks ect_config run return run function easycushiontravel:stop
# /ride refuses to mount someone who is already riding, so dismount first. Only do it
# when a cushion was found, or looking away would knock the player off every tick.
execute if entity @e[type=cushion,tag=ect_cushion] run ride @s dismount
# Fails quietly when nothing is tagged.
ride @s mount @e[type=minecraft:cushion,tag=ect_cushion,limit=1,sort=nearest]
# Remove find's temporary tag in the same run that created it.
tag @e[type=minecraft:cushion,tag=ect_cushion] remove ect_cushion