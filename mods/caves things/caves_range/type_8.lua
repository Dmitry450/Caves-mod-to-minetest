minetest.register_craft({
	output = 'caves_range:type_8',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'caves_craft:simple_element'},
		{'caves_craft:electro_element', 'caves_craft:electro_element', 'caves_craft:electro_element'}, 
		{'default:steel_ingot', 'default:steel_ingot', 'caves_craft:simple_element'},
	}
})

minetest.register_craftitem("caves_range:electro_charge", {
	stack_max= 30,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	range = 0,
		description = ""..core.colorize("#ffff00","Electro charge"),
	inventory_image = "electro_charge.png",
})

minetest.register_craft({
	output = 'caves_range:electro_charge',
	recipe = {
		{'', 'default:copper_ingot', ''},
		{'default:copper_ingot', 'caves_craft:electro_element', 'default:copper_ingot'},
		{'', 'default:copper_ingot', ''},
	}
})

minetest.register_craftitem("caves_range:type_8", {
	stack_max= 1,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	range = 0,
		description = ""..core.colorize("#35cdff","Type-8 \"Mjolnir\"\n")..core.colorize("#00FF00", "Experemental electro gun.\n")..core.colorize("#FF0000", "Use with caution!\n")..core.colorize("#000099", "(press RMB to charge)"),
	inventory_image = "type_8.png",
	on_use = function(user)
		minetest.sound_play("type_empty", {user})
	end,
})

local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + dtime;
	if timer >= 0.001 then
	for _, player in pairs(minetest.get_connected_players()) do
		local inv = player:get_inventory()
		local controls = player:get_player_control()
		if player:get_wielded_item():get_name() == "caves_range:type_8" 
		and inv:contains_item("main", "caves_range:electro_charge")then
		if controls.RMB then
		inv:remove_item("main", "caves_range:electro_charge")
		player:set_wielded_item("caves_range:type_8_charging")
				end
		timer = 0
				minetest.sound_play("", {player})



	end

	if timer >= 1.25 and
		 player:get_wielded_item():get_name() == "caves_range:type_8_charging" then
		player:set_wielded_item("caves_range:type_8_charged")
		timer = 0
				minetest.sound_play("type_charged", {player})



		end
			end
				end
				end)


minetest.register_craftitem("caves_range:type_8_charging", {
	stack_max= 1,
	range = 0,
	wield_scale = {x=2.5,y=2.5,z=3.75},
	description = "**RELOADING type-8**",
	groups = {not_in_creative_inventory = 1},
	inventory_image = "type_8.png",
})


minetest.register_tool("caves_range:type_8_charged", {
		description = ""..core.colorize("#35cdff","Type-8 \"Mjolnir\"\n")..core.colorize("#00FF00", "Experemental electro gun\n")..core.colorize("#FF0000", "Use with caution\n")..core.colorize("#FF9900", "Charged"),
	range = 0,
	groups = {not_in_creative_inventory = 1},
	wield_scale = {x=2.5,y=2.5,z=3.75},
	inventory_image = "type_8_charged.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "caves_range:electro_blast")
			if obj then
				minetest.sound_play("type_blast", {object=obj})
				obj:setvelocity({x=dir.x * 15, y=dir.y * 15, z=dir.z * 15})
				obj:setyaw(yaw + math.pi)
				local ent = obj:get_luaentity()
				if ent then
					ent.player = ent.player or user
			itemstack = "caves_range:type_8"
				end
			end
		end
		return itemstack
	end,
})


local electro_boom = {
	name = "caves_range:electro_boom",
	--description = "DuN mInD mEh...",
	radius = 3.5,
	tiles = {
		side = "invisible.png",
		top = "invisible.png",
		bottom = "invisible.png",
		burning = "invisible.png"
	},
}
tnt.register_tnt(electro_boom)



local caves_range_electro_blast = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.0, y=0.0},
	textures = {"electro_blast.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}

local caves_range_electrized_air = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.1, y=0.1},
	textures = {"electro_blast.png"},
	lastpos = {},
	collisionbox = {0, 0, 0, 0, 0, 0},
	_time_to_blast = nil,
	_time_to_effect = 0,
}

caves_range_electrized_air.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	self._time_to_effect = self._time_to_effect + dtime
	if self._time_to_blast == nil then
		self._time_to_blast = math.random(3, 5)
	end
	local pos = self.object:getpos()
	if self._time_to_effect >= 1 + math.random(1, 6)/10 then
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+2, z=pos.z},
			velocity = 2,
			  acceleration = {x=math.random(-1, 1), y=-4, z=math.random(-1, 1)},
			expirationtime = 5,
			size = 8,
			collisiondetection = true,
			vertical = true,
			texture = "electroP.png",
			glow = 15,
		})
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+2, z=pos.z},
			velocity = 2,
			  acceleration = {x=math.random(-1, 1), y=-4, z=math.random(-1, 1)},
			expirationtime = 5,
			size = 8,
			collisiondetection = true,
			vertical = true,
			texture = "electroP.png",
			glow = 15,
		})
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+2, z=pos.z},
			velocity = 2,
			  acceleration = {x=math.random(-1, 1), y=-4, z=math.random(-1, 1)},
			expirationtime = 5,
			size = 8,
			collisiondetection = true,
			vertical = true,
			texture = "electroP.png",
			glow = 15,
		})
		minetest.add_particle({
			pos = {x=pos.x, y=pos.y+2, z=pos.z},
			velocity = 2,
			  acceleration = {x=math.random(-1, 1), y=-4, z=math.random(-1, 1)},
			expirationtime = 5,
			size = 8,
			collisiondetection = true,
			vertical = true,
			texture = "electroP.png",
			glow = 15,
		})
		minetest.sound_play("electro", {object=self.object})
		self._time_to_effect = 0
	end
	if self.timer > self._time_to_blast then
		tnt.boom(pos, electro_boom)
		minetest.sound_play("electro", {object=self.object})
		minetest.sound_play("electro", {object=self.object})
		minetest.sound_play("electro", {object=self.object})
		-- For loud effect
		self.object:remove()
	end
end

caves_range_electro_blast.on_step = function(self, dtime, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)
	if self.timer >= 0.002 then
	tiem = tiem + 0.002 
	end
	if self.timer >= 0.375 then
	local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.5)
		for k, obj in pairs(objs) do
		if obj:get_luaentity() ~= nil then
		if obj:get_luaentity().name ~= "caves_range:electro_blast" and obj:get_luaentity().name ~= "__builtin:item" then
		tnt.boom(pos, electro_boom)
		minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z - 2}, "caves_range:electrized_air")
		minetest.add_entity({x = pos.x - 4, y = pos.y+1, z = pos.z - 1}, "caves_range:electrized_air")
		minetest.add_entity({x = pos.x + 1, y = pos.y+1, z = pos.z - 4}, "caves_range:electrized_air")
		minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z + 2}, "caves_range:electrized_air")
		minetest.sound_play("thunder", {object=self.object})
		self.object:remove()
			end
		end
	end
end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
			tnt.boom(pos, electro_boom)
			minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z - 2}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x - 4, y = pos.y+1, z = pos.z - 1}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x + 1, y = pos.y+1, z = pos.z - 4}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z + 2}, "caves_range:electrized_air")
			minetest.sound_play("thunder", {object=self.object})
		self.object:remove()
			end
		if self.timer >= 7.5 then
			tnt.boom(pos, electro_boom)
			minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z - 2}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x - 4, y = pos.y+1, z = pos.z - 1}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x + 1, y = pos.y+1, z = pos.z - 4}, "caves_range:electrized_air")
			minetest.add_entity({x = pos.x + 3, y = pos.y+1, z = pos.z + 2}, "caves_range:electrized_air")
			minetest.sound_play("thunder", {object=self.object})
		self.object:remove()
		end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
end

minetest.register_entity("caves_range:electro_blast", caves_range_electro_blast)
minetest.register_entity("caves_range:electrized_air", caves_range_electrized_air)


print("type-8 initialized")