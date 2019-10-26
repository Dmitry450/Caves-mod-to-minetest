
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
    description = ""..core.colorize("#555500", "Simple component"),
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

minetest.register_craftitem("caves_craft:blood_crystal", {
    description = ""..core.colorize("#990000", "Blood crystal"),
    inventory_image = "blood_crystal.png",
})

minetest.register_craftitem("caves_craft:heavy_stick", {
    description = ""..core.colorize("#5555ff", "Heavy stick"),
    inventory_image = "heavy_stick.png",
})

minetest.register_craftitem("caves_craft:teleport_module", {
    description = ""..core.colorize("#009944", "Teleport module"),
	inventory_image = "teleport_module.png",
	on_use = function(itemstack, user, pointed_thing, uses)
		if not pointed_thing then return end
		if pointed_thing.type ~= 'node' then return end
		local pos = pointed_thing.under
		local node = minetest.get_node(pos)
		if node.name ~= 'caves_shop:shop_not_active' then return end
		if minetest.is_protected(node, user:get_player_name()) then return end
		minetest.set_node(pos, {name = 'caves_shop:shop'})
		minetest.sound_play('scanner_use', {user})
		user:get_inventory():remove_item("main", "caves_craft:teleport_module 1")
    end,
})

minetest.register_craft({
	output = "caves_craft:teleport_module 4",
	recipe = {
		 {"caves_craft:electro_element", "default:mese_crystal", "caves_craft:electro_element"},
		 {"caves_craft:simple_element", "default:glass", "caves_craft:simple_element"},
		 {"caves_craft:simple_element", "default:glass", "caves_craft:simple_element"},
		 {"caves_craft:electro_element", "default:mese_crystal", "caves_craft:electro_element"}
         },
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
		 {"default:steel_ingot", "default:copper_ingot", "default:steel_ingot"},
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

minetest.register_craft({
	output = "caves_craft:workspace",
	recipe = {
		 {"default:copper_ingot", "default:steel_ingot", "default:copper_ingot"},
		 {"default:steel_ingot", "", "default:steel_ingot"},
		 {"default:copper_ingot", "default:steel_ingot", "default:copper_ingot"}
         },
})

minetest.register_node("caves_craft:workspace", {
	description = "Crafting table",
	tiles = {"crafttable.png"},
	legacy_facedir_simple = true,
	on_rightclick = function(pos, node, clicker)
		local inv = clicker:get_inventory()
		inv:set_width("craft", 4)
		inv:set_size("craft", 16)
        minetest.show_formspec(clicker:get_player_name(), "caves_craft:craftformspec", [[
			size[8,9]
			list[current_player;craft;1.75,0.5;4,4;]
			list[current_player;craftpreview;5.75,1.5;1,1;]
			list[current_player;main;0,4.75;8,1;]
			list[current_player;main;0,6;8,3;8]
		]])
	end,
	groups = {cracky = 3},
})

minetest.register_craft({
	output = "caves_craft:util",
	recipe = {
		 {"default:copper_ingot", "default:tin_ingot", "default:copper_ingot"},
		 {"default:mese_crystal_fragment", "default:steel_ingot", "default:mese_crystal_fragment"},
		 {"default:copper_ingot", "default:tin_ingot", "default:copper_ingot"}
         },
})

minetest.register_craft({
	output = "caves_craft:heavy_stick 6",
	recipe = {
		 {"default:steel_ingot", "default:stick", "default:steel_ingot"},
		 {"default:steel_ingot", "default:stick", "default:steel_ingot"},
		 {"default:steel_ingot", "default:stick", "default:steel_ingot"}
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
			local sound = util.craft(inv, pos)
			if sound then minetest.sound_play("util0", {position=pos, hear_distance = 5}) end
		end
		minetest.get_node_timer(pos):start(1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("in") and inv:is_empty("out")
	end,
})

util.register_craft({
	input = "caves_range:arrow_gun_loaded0",
	output = {"caves_craft:simple_element 3"},
})

util.register_craft({
	input = "caves_range:arrow_gun_loaded1",
	output = {"caves_craft:simple_element 3",
			  "caves_range:arrow 1"},
})

util.register_craft({
	input = "caves_range:arrow_gun_loaded2",
	output = {"caves_craft:simple_element 3",
			  "caves_range:arrow 2"},
})

util.register_craft({
	input = "caves_range:arrow_gun_loaded3",
	output = {"caves_craft:simple_element 3",
			  "caves_range:arrow 3"},
})

util.register_craft({
	input = "caves_resources:drill_normal",
	output = {"caves_craft:simple_element 2"},
})

util.register_craft({
	input = "caves_resources:drill_poweruped",
	output = {"caves_craft:simple_element 3",
			  "caves_craft:electro_element 2"},
})

util.register_craft({
	input = "caves_resources:drill_diamond",
	output = {"caves_craft:simple_element 3",
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
			  "default:cobble"},
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
			  "default:mese_crystal_fragment 3"},
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

util.register_craft({
	input = "default:shovel_diamond",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:sword_mese",
	output = {"default:stick",
			  "default:mese_crystal_fragment 2"},
})

util.register_craft({
	input = "default:sword_steel",
	output = {"default:stick",
			  "default:steel_ingot"},
})

util.register_craft({
	input = "default:sword_stone",
	output = {"default:stick",
			  "default:cobble"},
})

util.register_craft({
	input = "default:sword_bronze",
	output = {"default:stick",
			  "default:bronze_ingot"},
})

util.register_craft({
	input = "default:sword_diamond",
	output = {"default:stick",
			  "default:diamond"},
})

util.register_craft({
	input = "default:axe_wood",
	output = {"default:stick 2"},
})

util.register_craft({
	input = "default:axe_stone",
	output = {"default:stick 2",
			  "default:cobble"},
})

util.register_craft({
	input = "default:axe_steel",
	output = {"default:stick 2",
			  "default:steel_ingot"},
})

util.register_craft({
	input = "default:axe_bronze",
	output = {"default:stick 2",
			  "default:bronze_ingot"},
})

util.register_craft({
	input = "default:axe_mese",
	output = {"default:stick 2",
			  "default:mese_crystal_fragment 3"},
})

util.register_craft({
	input = "default:axe_diamond",
	output = {"default:stick 2",
			  "default:diamond"},
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "caves_craft:craftformspec" then
		local inv = player:get_inventory()
		inv:set_width('craft', 9)
	end
end)