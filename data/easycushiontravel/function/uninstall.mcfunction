# Removes the pack cleanly. An admin runs it with /function easycushiontravel:uninstall
# (/function needs op, so regular players can't run it).
#
# Stop everyone who is traveling. This removes ect_traveling and sends the stop message.
# It has to run before the objectives are removed, because stop sets ect_idle.
# The temporary tags (ect_rider, ect_cushion, ect_occupied) never outlive the run that adds
# them, so there's nothing else to clean up.
# A player who is offline right now keeps ect_traveling, because commands can't reach offline
# players. That's harmless once the pack is gone, since nothing reads the tag.
execute as @a[tag=ect_traveling] run function easycushiontravel:stop
# Removing an objective deletes every score on it, for every player (online or not),
# including the fake players #delay, #delay_ticks, and #20 on ect_config.
scoreboard objectives remove ect
scoreboard objectives remove ect_idle
scoreboard objectives remove ect_left
scoreboard objectives remove ect_config
# Tell whoever ran this that it worked. From the server console, @s is the console, so it won't show.
tellraw @s {"text":"Easy Cushion Travel successfully uninstalled.","color":"green"}
# Turn the pack off so tick stops running and /reload doesn't recreate everything. This goes
# last because disabling triggers a reload. The pack's ID depends on how it was installed:
# file/easy_cushion_travel.zip as a zip, file/easy_cushion_travel as a folder. Both are tried,
# and the one that doesn't exist just fails with a harmless "Unknown data pack" error.
datapack disable "file/easy_cushion_travel.zip"
datapack disable "file/easy_cushion_travel"