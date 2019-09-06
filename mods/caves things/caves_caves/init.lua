minetest.register_biome({
    name = "caves_cave",
    node_top = "default:cobble",
    depth_top = 3,
    node_filler = "default:stone",
    depth_filler = 1,
    node_riverbed = "default:stone",
    depth_riverbed = 6,
    node_dungeon = "default:cobble",
    node_dungeon_alt = "default:stonebrick",
    node_dungeon_stair = "stairs:stair_cobble",
    vertical_blend = 2,
    y_max = -100,
    y_min = -31000,
    heat_point = 50,
    humidity_point = 40,
})

minetest.register_decoration({
    name = "flowers:mushroom_red",
    deco_type = "simple",
    place_on = {"default:stone"},
    sidelen = 16,
    noise_params = {
        offset = 0,
        scale = 0.006,
        spread = {x = 100, y = 100, z = 100},
        seed = 436,
        octaves = 3,
        persist = 0.6
    },
    y_max = -100,
    y_min = -31000,
    decoration = "flowers:mushroom_red",
})

minetest.register_biome({
    name = "caves_lava_cave",
    node_top = "default:desert_cobble",
    depth_top = 4,
    node_filler = "default:desert_stone",
    depth_filler = 2,
    node_riverbed = "default:lava_source",
    depth_riverbed = 6,
    node_dungeon = "default:stone_block",
    node_dungeon_alt = "default:stone_block",
    node_dungeon_stair = "stairs:stair_cobble",
    vertical_blend = 6,
    y_max = -100,
    y_min = -31000,
    heat_point = 50,
    humidity_point = 40,
})