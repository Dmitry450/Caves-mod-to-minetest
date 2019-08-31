minetest.register_craft({
	output = 'caves_range:arrow 10',
	recipe = {
		{'default:stick', 'default:stick', 'default:flint'}
	}
})

local timer = 0
minetest.register_globalstep(function(dtime, player)
	timer = timer + 0.1;
	if timer >= 1 then
		for _, player in pairs(minetest.get_connected_players()) do
			local controls = player:get_player_control()
			local recharge = true
			if player:get_wielded_item():get_name() == "caves_range:arrow_gun_loaded0" and player:get_inventory():contains_item("main", "caves_range:arrow 1") and controls.RMB then
				player:set_wielded_item("caves_range:arrow_gun_loaded1")
        		minetest.sound_play("arrow_load", {player})
				player:get_inventory():remove_item("main", "caves_range:arrow")
				recharge = false
    		end
			if player:get_wielded_item():get_name() == "caves_range:arrow_gun_loaded1" and player:get_inventory():contains_item("main", "caves_range:arrow 1") and controls.RMB and recharge then
				player:set_wielded_item("caves_range:arrow_gun_loaded2")
    	    	minetest.sound_play("arrow_load", {player})
				player:get_inventory():remove_item("main", "caves_range:arrow")
				recharge = false
    		end
			if player:get_wielded_item():get_name() == "caves_range:arrow_gun_loaded2" and player:get_inventory():contains_item("main", "caves_range:arrow 1") and controls.RMB and recharge then
				player:set_wielded_item("caves_range:arrow_gun_loaded3")
        		minetest.sound_play("arrow_load", {player})
        		player:get_inventory():remove_item("main", "caves_range:arrow")
			end
			timer = 0
		end
	end
end)


minetest.register_craftitem("caves_range:arrow_gun_loaded0", {
	stack_max= 1,
	wield_scale = {x=1.25,y=1.25,z=1.5},
	description = ""..core.colorize("#35cdff","Arrow gun\n")..core.colorize("#FFFF00", "loaded arrows: ")..core.colorize("#FF0000", "0"),
	range = 0,
	inventory_image = "arrow_gun.png",
})

minetest.register_craftitem("caves_range:arrow", {
	stack_max= 80,
	wield_scale = {x=1.25,y=1.25,z=1.5},
	description = "Arrow",
	range = 0,
	inventory_image = "arrow.png",
})


minetest.register_craftitem("caves_range:arrow_gun_loaded1", {
	description = ""..core.colorize("#35cdff","Arrow gun\n")..core.colorize("#FFFF00", "loaded arrows: ")..core.colorize("#FF9900", "1"),
	wield_scale = {x=1.25,y=1.25,z=1.5},
	range = 0,
	inventory_image = "arrow_gun.png",
	on_use = function(itemstack, user, pointed_thing)
		timer = 0
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "caves_range:arrow_flying")
			if obj then
				minetest.sound_play("arrow_gun_shoot", {user})
				obj:setvelocity({x=dir.x * 45, y=dir.y * 45, z=dir.z * 45})
				obj:setacceleration({x=dir.x * math.random(-1.5,1.5), y=math.random(-1.5,1.5), z=dir.z * math.random(-1.5,1.5)})
				obj:setyaw(yaw + math.pi)
			pos.y = pos.y + 0
			local ent = obj:get_luaentity()
			if ent then
				ent.player = ent.player or user
			itemstack = "caves_range:arrow_gun_loaded0"
				end
			end
		end
		return itemstack
	end,
})

minetest.register_craftitem("caves_range:arrow_gun_loaded2", {
	description = ""..core.colorize("#35cdff","Arrow gun\n")..core.colorize("#FFFF00", "loaded arrows: ")..core.colorize("#FFFF00", "2"),
	wield_scale = {x=1.25,y=1.25,z=1.5},
	range = 0,
	inventory_image = "arrow_gun.png",
	on_use = function(itemstack, user, pointed_thing)
		timer = 0
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "caves_range:arrow_flying")
			if obj then
				minetest.sound_play("arrow_gun_shoot", {user})
				obj:setvelocity({x=dir.x * 45, y=dir.y * 45, z=dir.z * 45})
				obj:setacceleration({x=dir.x * math.random(-1.5,1.5), y=math.random(-1.5,1.5), z=dir.z * math.random(-1.5,1.5)})
				obj:setyaw(yaw + math.pi)
			pos.y = pos.y + 0
			local ent = obj:get_luaentity()
			if ent then
				ent.player = ent.player or user
			itemstack = "caves_range:arrow_gun_loaded1"
				end
			end
		end
		return itemstack
	end,
})

minetest.register_craftitem("caves_range:arrow_gun_loaded3", {
	description = ""..core.colorize("#35cdff","Arrow gun\n")..core.colorize("#FFFF00", "loaded arrows: ")..core.colorize("#00FF00", "3"),
	wield_scale = {x=1.25,y=1.25,z=1.5},
	range = 0,
	inventory_image = "arrow_gun.png",
	on_use = function(itemstack, user, pointed_thing)
		timer = 0
		local inv = user:get_inventory()
		local pos = user:getpos()
		local dir = user:get_look_dir()
		local yaw = user:get_look_yaw()
		if pos and dir and yaw then
			pos.y = pos.y + 1.6
			local obj = minetest.add_entity(pos, "caves_range:arrow_flying")
			if obj then
				minetest.sound_play("arrow_gun_shoot", {user})
				obj:setvelocity({x=dir.x * 45, y=dir.y * 45, z=dir.z * 45})
				obj:setacceleration({x=dir.x * math.random(-1.5,1.5), y=math.random(-1.5,1.5), z=dir.z * math.random(-1.5,1.5)})
				obj:setyaw(yaw + math.pi)
			pos.y = pos.y + 0
			local ent = obj:get_luaentity()
			if ent then
				ent.player = ent.player or user
			itemstack = "caves_range:arrow_gun_loaded2"
				end
			end
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = 'caves_range:arrow_gun_loaded0',
	recipe = {
		{'', 'caves_craft:simple_element', ''},
		{'caves_craft:simple_element', 'farming:string', 'caves_craft:simple_element'},
		{'', 'caves_craft:simple_element', ''},
	}
})

local arrow = {
	physical = false,
	timer = 0,
	visual = "sprite",
	visual_size = {x=0.3, y=0.3},
	textures = {"bullet.png"},
	lastpos= {},
	collisionbox = {0, 0, 0, 0, 0, 0},
}
arrow.on_step = function(self, dtime, node, pos)
	self.timer = self.timer + dtime
	local tiem = 0.002
	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if self.timer > 0.065 then
		local objs = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 1.25)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
				if obj:get_luaentity().name ~= "caves_range:arrow_flying" and obj:get_luaentity().name ~= "__builtin:item" then
					if math.random(1, 100) <= 29 then
					local damage = math.random(15,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=18},
					}, nil)
					minetest.sound_play("bullet_impact_stone", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
					else
					local damage = math.random(7,12)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage, knockback=9},
					}, nil)
					minetest.sound_play("bullet_impact_stone", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				end
			end
			else
				if math.random(1, 100) <= 29 then
				local damage = math.random(15,22)
					obj:punch(self.object, 1.0, {
						full_punch_interval = 1.0,
						damage_groups= {fleshy = damage},
					}, nil)
					minetest.sound_play("bullet_impact_stone", {pos = self.lastpos, gain = 0.8})
					self.object:remove()
				else
				local damage = math.random(7,12)
				obj:punch(self.object, 1.0, {
					full_punch_interval = 1.0,
					damage_groups= {fleshy = damage},
				}, nil)
				minetest.sound_play("bullet_impact_stone", {pos = self.lastpos, gain = 0.8})
				self.object:remove()
		end
	end
		if timer >= 0.002 + tiem then
		tiem = tiem + 0.002 
			end
		if self.timer >= 4.0 then
		self.object:remove()
			end
	if self.lastpos.x ~= nil then
		if minetest.registered_nodes[node.name].walkable then
			if not minetest.setting_getbool("creative_mode") then
			end
			minetest.sound_play("bullet_impact_stone", {pos = self.lastpos, gain = 0.8})
		if node.name == "rangedweapons:barrel" or
		node.name == "doors:door_glass_a" or
		node.name == "doors:door_glass_b" or
		node.name == "xpanes:pane" or
		node.name == "xpanes:pane_flat" or
		node.name == "vessels:drinking_glass" or
		node.name == "vessels:glass_bottle" or
		   node.name == "default:glass" then
		minetest.get_node_timer(pos):start(0)
		end
		self.object:remove()
	end
	end
	self.lastpos= {x = pos.x, y = pos.y, z = pos.z}
	end
	end
	end


minetest.register_entity("caves_range:arrow_flying", arrow)


