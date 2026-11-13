# Runs when the pack loads and on every /reload (called by the minecraft:load tag).
# Runs as the server, so @s is nobody here.
#
# Everything this pack uses:
#   Objectives: ect (the trigger players run), ect_idle (ticks since last hop),
#               ect_config (settings and constants), ect_left (counts how often a player left)
#   Tags: ect_traveling (player is traveling)
#         ect_rider (temporary: the current player inside find)
#         ect_cushion (temporary: the cushion find picked)
#         ect_occupied (temporary: cushions that already have a passenger)
#   Fake players on ect_config: #delay (seconds, configurable), #delay_ticks (#delay x 20, set in tick),
#                               #20 (constant used for the conversion)
#
# Adding an objective that already exists just fails harmlessly, so this is safe to rerun.
scoreboard objectives add ect trigger
scoreboard objectives add ect_idle dummy
scoreboard objectives add ect_config dummy
# Scoreboard math can only multiply by another score, so 20 needs a score of its own.
scoreboard players set #20 ect_config 20
scoreboard objectives add ect_left minecraft.custom:minecraft.leave_game
# Seconds to wait before stopping when the player isn't looking at a cushion.
# Admins can change it with: /scoreboard players set #delay ect_config <seconds>
# Only set the default when #delay is missing (an unset score matches no range),
# so a custom value survives /reload. A negative value also gets reset to the default.
execute unless score #delay ect_config matches 0.. run scoreboard players set #delay ect_config 3