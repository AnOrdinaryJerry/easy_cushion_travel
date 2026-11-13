# Wall check: walks a straight line from the player's eyes to the cushion find picked,
# a quarter block at a time, and removes ect_cushion if a solid block is in the way.
# Called by find, and by itself one step further along each time.
# Context: as the player, positioned at the current point on the line, rotated to face
# the cushion. @s is still the player because nothing in this chain uses "as".
# "Solid" means any block not in #easycushiontravel:passable (tags/block/passable.json).
# JSON files can't hold comments, so that list is explained here instead.
#
# draws each point of the ray so you can see its path. For testing.
# particle end_rod ~ ~ ~
# Reached the cushion: every point before this one was clear, so keep the tag and stop.
# This has to come before the wall check. The line ends at the cushion's position, right on
# top of the block it sits on, so checking for walls first would hit that block.
execute if entity @e[type=minecraft:cushion,tag=ect_cushion,distance=..0.5] run return 1
# A block that isn't passable is in the way: reject the cushion and stop.
execute unless block ~ ~ ~ #easycushiontravel:passable run return run tag @e[type=cushion,tag=ect_cushion] remove ect_cushion
# Neither: step a quarter block forward (^ follows the rotation, which is aimed at the cushion)
# and check again. The line points straight at the cushion, so this always ends at one of the
# two returns above, after about 12 steps for a cushion 3 blocks away.
execute positioned ^ ^ ^0.25 run function easycushiontravel:ray