sounds = {
    water = {"water"},
    lava = {"lava1"},
    gravel = {"gravel1"},
    dungeon = {"dungeon1", "dungeon2"},
    stone = {"stone1", "stone2"},
}
local timer = 0
if minetest.settings:get_bool("caves_sounds") then
    minetest.register_globalstep(function(dtime, player)
	    timer = timer + 0.1;
    	if timer >= 25 then
            for _, player in pairs(minetest.get_connected_players()) do
                local pos = player:get_pos()
                if pos.y < -20 then -- Player in cave
                    pos.x = pos.x + math.random(-10, 10)
                    pos.z = pos.z + math.random(-10, 10)
                    print(minetest.get_node(pos).name)
                    local sound = "stone1"
                    if minetest.get_node(pos).name == "default:stone" then
                        sound = sounds.stone[math.random(1, 2)]
                    elseif minetest.get_node(pos).name == "default:water_source" or
                           minetest.get_node(pos).name == "default:water_flowing" then
                        sound = sounds.water[1]
                    elseif minetest.get_node(pos).name == "default:lava_source" then
                        sound = sounds.lava[1]
                    elseif minetest.get_node(pos).name == "default:stone_block" then
                        sound = sounds.dungeon[2]
                    elseif minetest.get_node(pos).name == "default:stone_block" then
                        sound = sounds.dungeon[2]
                    elseif minetest.get_node(pos).name == "default:cobble" or 
                           minetest.get_node(pos).name == "default:mossycobble" then
                        sound = sounds.dungeon[1]
                    else
                        sound = sounds.stone[1]
                    end
                    print("Playing sound '"..sound.."' at "..dump(pos))
                    minetest.sound_play(sound, {position = pos, hear_distance = 20})
                    timer = 0
                end
            end
        end
    end)
end