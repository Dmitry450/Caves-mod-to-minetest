function pb(pos, user, pt)
	
	local placeBlock = true
	--print("Trying change block on position: x = "..pos.x.." y = "..pos.y.." z = "..pos.z)
	local under = minetest.get_node(pos)
	if under.name ~= "default:cobble" and under.name ~= "default:stone" then
		--print("This isn't cobble or stone")
		--print("This is:")
		--print(under.name)
		placeBlock = false
	end
	if minetest.is_protected(pt.under, user:get_player_name()) then
		--print("This area is protected")
		minetest.record_protection_violation(pt.under, user:get_player_name())
		placeBlock = false
	end
	local newNode = "default:stone_with_gold"
	if math.random(1, 2) == 2 then newNode = "caves_resources:emerald_ore" end
	if placeBlock then 
		minetest.set_node(pos, {name = newNode})
	end
end

function transmytate(itemstack, user, pointed_thing, uses)
	
	local pt = pointed_thing
	if not pt then
		--print("There isn't pointed thing")
		return
	end
	if pt.type ~= "node" then
		--print("This isn't node")
		return
	end
	local firstPos = pt.under
	local pos = pt.under
	minetest.sound_play("activate_new", {user})
	pb(pos, user, pt)
	pb({x=pos.x, y=pos.y+1, z=pos.z}, user, pt)
	pb({x=pos.x, y=pos.y-1, z=pos.z}, user, pt)
	pb({x=pos.x+1, y=pos.y, z=pos.z}, user, pt)
	pb({x=pos.x-1, y=pos.y, z=pos.z}, user, pt)
	pb({x=pos.x, y=pos.y, z=pos.z+1}, user, pt)
	pb({x=pos.x, y=pos.y, z=pos.z-1}, user, pt)
	if not (creative and creative.is_enabled_for
	and creative.is_enabled_for(user:get_player_name())) then
		itemstack:take_item()
	end
	return itemstack
end

minetest.register_craftitem("caves_resources:transmutation_scroll", {
	description = "Scroll of Transmutation\nReplaces some cobble or stone\nto golden or emerald ore",
	inventory_image = "scroll_of_transmutation.png",
	on_use = function(itemstack, user, pointed_thing, uses)
		return transmytate(itemstack, user, pointed_thing, uses)
	end
})

minetest.register_craftitem("caves_resources:emerald", {
	description = ""..core.colorize("#00CC00","Emerald"),
	inventory_image = "emerald.png",
})

minetest.register_craftitem("caves_resources:gold_money", {
	description = ""..core.colorize("#FFDD00","Gold"),
	inventory_image = "gold.png",
})

minetest.register_craftitem("caves_resources:health_crystal", {
	description = ""..core.colorize("#FF0000", "Health Crystal\n")..core.colorize("#00FF00", "Instantly restores a\nsuffelent amount\nof health"),
	inventory_image = "crystal_health.png",
	on_use = minetest.item_eat(7),
})

minetest.register_node("caves_resources:emerald_ore", {
	description = "Emerald Ore",
	tiles ={"emerald_ore.png"},
	is_ground_content = false,
	groups = {cracky=3, stone = 1},
	drop = "caves_resources:emerald",
	light_source = 3,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "caves_resources:emerald_ore",
    wherein        = "default:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 3,
    clust_size     = 2,
    y_max          = 255,
    y_min          = -255,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "caves_resources:emerald_ore",
    wherein        = "default:stone",
    clust_scarcity = 15 * 15 * 15,
    clust_num_ores = 5,
    clust_size     = 2,
    y_max          = 0,
    y_min          = -1024,
})

minetest.register_craft({
	output = "caves_resources:gold_money 4",
	recipe = {
         {"default:gold_lump"}
	}
})

minetest.register_tool("caves_resources:drill_normal", {
	description = ""..core.colorize("#999900", "Drill"),
	inventory_image = "drill_normal.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=2.00, [2]=1.50, [3]=0.70}, uses=32, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "drill_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("caves_resources:drill_poweruped", {
	description = ""..core.colorize("#0000FF", "Drill Poweruped"),
	inventory_image = "drill_poweruped.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=38, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "drill_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("caves_resources:drill_diamond", {
	description = ""..core.colorize("#00FFFF", "Diamond Drill"),
	inventory_image = "drill_diamond.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[1]=1.00, [2]=0.85, [3]=0.22}, uses=44, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "drill_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_craft({
	output = "caves_resources:drill_normal",
	recipe = {
		 {"caves_craft:simple_element", "default:steel_ingot", "caves_craft:simple_element"},
		 {"default:copper_ingot", "caves_craft:electro_element", "default:copper_ingot"},
		 {"caves_craft:simple_element", "default:steel_ingot", "caves_craft:simple_element"}
		 }
})

minetest.register_craft({
	output = "caves_resources:drill_poweruped",
	recipe = {
		 {"caves_craft:simple_element", "default:tin_ingot", "caves_craft:simple_element"},
		 {"caves_craft:electro_element", "default:tin_ingot", "caves_craft:electro_element"},
		 {"caves_craft:simple_element", "caves_craft:electro_element", "caves_craft:simple_element"}
		 }
})

minetest.register_craft({
	output = "caves_resources:drill_diamond",
	recipe = {
		 {"caves_craft:electro_element", "default:diamond", "caves_craft:electro_element"},
		 {"default:steel_ingot", "default:diamond", "default:steel_ingot"},
		 {"caves_craft:electro_element", "caves_craft:simple_element", "caves_craft:electro_element"}
		 }
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "caves_resources:emerald_ore",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = 31000,
	y_min          = 1025,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "caves_resources:emerald_ore",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 2,
	clust_size     = 3,
	y_max          = 31000,
	y_min          = 1025,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "caves_resources:emerald_ore",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_max          = 31000,
	y_min          = 1025,
})

dungeon_loot.register({name = "caves_resources:drill_normal", chance = 0.4})
dungeon_loot.register({name = "caves_resources:health_crystal", chance = 0.4, count = {1, 2}})
dungeon_loot.register({name = "caves_resources:gold_money", chance = 0.7, count = {7, 9}})
dungeon_loot.register({name = "caves_resources:emerald", chance = 0.4, count = {3, 5}})
dungeon_loot.register({name = "caves_resources:drill_poweruped", chance = 0.3})
dungeon_loot.register({name = "caves_resources:transmutation_scroll", chance = 0.3, count = {1, 3}})