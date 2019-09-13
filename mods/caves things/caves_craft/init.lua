minetest.register_craftitem("caves_craft:fire_element", {
    description = ""..core.colorize("#FFBB00", "Fire element"),
    inventory_image = "fire_element.png",
})

minetest.register_craftitem("caves_craft:acid_element", {
    description = ""..core.colorize("#11DD00", "Acid element"),
    inventory_image = "acid_element.png",
})

minetest.register_craftitem("caves_craft:electro_element", {
    description = ""..core.colorize("#0000FF", "Electro element"),
    inventory_image = "electro_element.png",
})

minetest.register_craftitem("caves_craft:plasma_element", {
    description = ""..core.colorize("#00FF44", "Plasma element"),
    inventory_image = "plasma_element.png",
})

minetest.register_craftitem("caves_craft:simple_element", {
    description = ""..core.colorize("#555500", "Simple element"),
    inventory_image = "simple_element.png",
})

minetest.register_craftitem("caves_craft:absorption_crystal", {
    description = ""..core.colorize("#990099", "Absorption crystal"),
    inventory_image = "absorption_crystal.png",
})

minetest.register_craftitem("caves_craft:necro_crystal", {
    description = ""..core.colorize("#990099", "Necro crystal"),
    inventory_image = "necro_crystal.png",
})

minetest.register_craft({
	output = "caves_craft:fire_element 10",
	recipe = {
		 {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		 {"default:steel_ingot", "bucket:bucket_lava", "default:steel_ingot"},
		 {"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"}
         },
    replacements = {
        {"bucket:bucket_lava", "bucket:bucket_empty"}
    },
})

minetest.register_craft({
	output = "caves_craft:simple_element 8",
	recipe = {
		 {"", "default:steel_ingot", ""},
		 {"default:steel_ingot", "", "default:steel_ingot"},
		 {"", "default:steel_ingot", ""}
         },
})

minetest.register_craft({
	output = "caves_craft:acid_element 6",
	recipe = {
		 {"flowers:mushroom_red", "default:steel_ingot", "flowers:mushroom_red"},
		 {"default:steel_ingot", "bucket:bucket_water", "default:steel_ingot"},
		 {"flowers:mushroom_red", "default:steel_ingot", "flowers:mushroom_red"}
         },
    replacements = {
        {"bucket:bucket_water", "bucket:bucket_empty"}
    },
})

minetest.register_craft({
	output = "caves_craft:electro_element 8",
	recipe = {
		 {"", "default:steel_ingot", ""},
		 {"default:steel_ingot", "default:mese_crystal_fragment", "default:steel_ingot"},
		 {"", "default:steel_ingot", ""}
         },
})

minetest.register_craft({
	output = "caves_craft:plasma_element 2",
	recipe = {
		 {"caves_craft:electro_element", "caves_craft:acid_element"}
         },
})

minetest.register_craft({
	output = "caves_craft:absorption_crystal 8",
	recipe = {
		 {"", "default:steel_ingot", ""},
		 {"default:steel_ingot", "caves_resources:health_crystal", "default:steel_ingot"},
		 {"", "default:steel_ingot", ""}
         },
})


minetest.register_craft({
	output = "caves_craft:necro_crystal 8",
	recipe = {
		 {"", "default:steel_ingot", ""},
		 {"default:steel_ingot", "bones:bones", "default:steel_ingot"},
		 {"", "default:steel_ingot", ""}
         },
})

local modpath = minetest.get_modpath(minetest.get_current_modname())
dofile(modpath.."/api.lua")

minetest.register_node("caves_craft:util", {
    description = "Utiliser",
    tiles = {
		"util.png", "util.png",
		"util.png", "util.png",
		"util.png", "util_front.png"
    },
    on_rightclick = function(pos, node, clicker)
        minetest.show_formspec(clicker:get_player_name(), "caves_craft:utilformspec", util.formspec)
    end,
    light_source = 4,
    groups = {cracky = 3, stone = 4},
	sounds = default.node_sound_metal_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", util.formspec)
		local inv = meta:get_inventory()
		inv:set_size('in', 1)
		inv:set_size('out', 9)
		minetest.get_node_timer(pos):start(1)
	end,
	on_timer = function(pos, elapsed)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("in") then
			util.craft(inv)
		end
		minetest.get_node_timer(pos):start(1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("in") and inv:is_empty("in")
	end,
})

util.register_craft({
	input = "caves_range:arrow_gun_loaded0",
	output = {"caves_craft:simple_element 8"},
})

util.register_craft({
	input = "caves_resources:drill_normal",
	output = {"caves_craft:simple_element 8"},
})

util.register_craft({
	input = "caves_resources:drill_poweruped",
	output = {"caves_craft:simple_element 8",
			  "caves_craft:electro_element 2"},
})

util.register_craft({
	input = "caves_resources:drill_diamond",
	output = {"caves_craft:simple_element 8",
			  "caves_craft:electro_element 2",
			  "default:diamond"},
})

util.register_craft({
	input = "default:pick_wood",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:pick_stone",
	output = {"default:stick 2",
			  "default:stone"},
})

util.register_craft({
	input = "default:pick_steel",
	output = {"default:stick 2",
			  "default:steel_ingot"},
})

util.register_craft({
	input = "default:pick_bronze",
	output = {"default:stick 2",
			  "default:bronze_ingot"},
})

util.register_craft({
	input = "default:pick_mese",
	output = {"default:stick 2",
			  "default:mese_crystal_fragment"},
})

util.register_craft({
	input = "default:pick_diamond",
	output = {"default:stick 2",
			  "default:diamond"},
})

util.register_craft({
	input = "default:shovel_wood",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:shovel_stone",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:shovel_bronze",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:shovel_steel",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:shovel_mese",
	output = {"default:stick 2"},
})