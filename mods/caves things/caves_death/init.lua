minetest.register_on_dieplayer(function(player)
    --[[
    print("player ded lol")
    minetest.sound_play("gamover_mix", {position=player:get_pos()}, hear_distance = 2) --TODO
    --]]
end)