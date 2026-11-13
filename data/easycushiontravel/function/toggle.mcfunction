# Starts or stops cushion travel for a player who ran /trigger ect.
# Called by tick, as the player who triggered it, at their position.
#
# Reset the trigger score so this only runs once per /trigger.
# This has to come before the early return below. If it came after, the stop path
# would skip it, the score would stay at 1, and the next tick would run toggle
# again and start travel right back up.
scoreboard players set @s ect 0
# Already traveling: stop, then return so the start line below never runs.
execute if entity @s[tag=ect_traveling] run return run function easycushiontravel:stop
# Only reached when the player wasn't traveling.
function easycushiontravel:start