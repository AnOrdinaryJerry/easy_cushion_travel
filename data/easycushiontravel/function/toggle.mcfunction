scoreboard players set @s ect 0
execute if entity @s[tag=ect_traveling] run return run function easycushiontravel:stop
function easycushiontravel:start