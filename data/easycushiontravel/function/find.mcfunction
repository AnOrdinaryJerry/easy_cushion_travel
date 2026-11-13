# Finds the cushion the player is looking at and tags it ect_cushion.
# Called by forward and start, as the player, at the player.
#
# LEAVES BEHIND: ect_cushion on the chosen cushion, or on nothing if the player
# isn't looking at one. Whoever called find has to remove ect_cushion when done.
#
# Mark the current player so the look check can point back at them after @s becomes a cushion.
tag @s add ect_rider
# Tag every nearby cushion that has a passenger as ect_occupied. Going to the passenger
# and back to its vehicle only completes when someone is sitting there. This also catches
# the cushion the player is sitting on, which is why looking straight down does nothing.
execute as @s at @s as @e[type=minecraft:cushion,distance=..3.5] on passengers on vehicle run tag @s add ect_occupied
# Look check (not a raycast). From each free cushion: face the player's eyes and step 1 block,
# then turn to the player's look direction and step 1 more. If the player is looking right
# at the cushion, the second step undoes the first and you land back on the cushion.
# distance=..0.2 is how close you have to land, so it sets how precise the aim has to be.
execute as @s at @s as @e[type=minecraft:cushion,distance=..3.5,tag=!ect_occupied] at @s facing entity @p[tag=ect_rider] eyes positioned ^ ^ ^1 rotated as @p[tag=ect_rider] positioned ^ ^ ^1 if entity @s[distance=..0.2] at @s run tag @s add ect_cushion
# Remove the temporary tags. ect_cushion stays for the caller.
tag @s remove ect_rider
tag @e[type=minecraft:cushion] remove ect_occupied