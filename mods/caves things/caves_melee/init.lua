minetest.register_tool("caves_melee:mace", {
	description = "Mace",
	inventory_image = "mace_normal.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "mace_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("caves_melee:blood_hammer", {
	description = ""..core.colorize("#660000", "Blood hammer"),
	inventory_image = "blood_hammer.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=14},
	},
	sound = {breaks = "mace_breaks"},
	groups = {sword = 1},
	on_use = function(itemstack, user, pointed_thing, uses)
		if pointed_thing.type ~= "object" then return end
		local obj = pointed_thing.ref
		obj:punch(user, 14.0, {damage_groups = {fleshy = 14, knockback=9}}, nil)
		minetest.item_eat(-2)(itemstack, user, pointed_thing, uses)
	end,
})

minetest.register_tool("caves_melee:mace_gold", {
	description = "Midas Mace",
	inventory_image = "mace_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=28, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "mace_breaks"},
	groups = {sword = 1}
})

minetest.register_craft({
	output = "caves_melee:mace",
	recipe = {
		 {"default:steel_ingot", "default:stick", "default:steel_ingot"},
		 {"default:steel_ingot", "default:stick", "default:steel_ingot"},
		 {"", "default:stick", ""}
		 }
})

minetest.register_craft({
	output = "caves_melee:mace_gold",
	recipe = {
		 {"default:gold_ingot", "default:stick", "default:gold_ingot"},
		 {"default:gold_ingot", "default:stick", "default:gold_ingot"},
		 {"", "default:stick", ""}
		 }
})

minetest.register_craft({
	output = "caves_melee:blood_hammer",
	recipe = {
		 {"default:cobble", "default:cobble", "default:cobble"},
		 {"default:cobble", "caves_craft:blood_crystal", "default:cobble"},
		 {"", "caves_craft:heavy_stick", ""},
		 {"", "caves_craft:heavy_stick", ""}
		 }
})