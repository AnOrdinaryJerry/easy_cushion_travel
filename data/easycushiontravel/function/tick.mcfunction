# Runs every tick (called by the minecraft:tick tag), as the server, so @s is nobody here.
#
# Convert the configured delay from seconds to ticks. Doing it every tick means
# an admin's change to #delay takes effect right away, without a /reload.
scoreboard players operation #delay_ticks ect_config = #delay ect_config
scoreboard players operation #delay_ticks ect_config *= #20 ect_config
# Clean up players who just came back after leaving. Offline players aren't in @a,
# so this fires on their first tick back. It runs before forward so a returning
# player gets stopped before forward can move them.
execute as @a[scores={ect_left=1..}] run function easycushiontravel:rejoin
# Run the travel loop for everyone who is traveling, as and at each player.
execute as @a[tag=ect_traveling] at @s run function easycushiontravel:forward
# A trigger turns itself off after each use, and new players start with it off,
# so re-enable it for everyone every tick.
scoreboard players enable @a ect
# /trigger ect adds 1 to the player's ect score. Anyone at 1 or more gets toggle.
execute as @a[scores={ect=1..}] at @s run function easycushiontravel:toggle