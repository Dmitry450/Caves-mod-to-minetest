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