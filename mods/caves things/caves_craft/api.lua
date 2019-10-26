function split(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

util = {}
util.registered_crafts = {}
util.formspec = "size[8,9]"..
				"label[3.5,0;Utiliser]"..
				"list[context;in;2,0.5;1,1;]"..
				"list[context;out;5,0.5;3,3;]"..
				"list[current_player;main;0,4.25;8,1;]"..
				"list[current_player;main;0,5.5;8,3;8]"

util.register_craft = function(def)
	--[[
		usage: 
		util.register_craft({
			input = <string>,
			output = <list-like table>,
		})
	--]]
	if def.input and def.output then
		table.insert(util.registered_crafts, def)
	else
		print("Error: you must fill input and output fields")
	end
end

util.craft = function(inv, pos)
	local stack = split(inv:get_list("in", 0)[1]:to_string())
	local item = stack[1]
	for _, craft in pairs(util.registered_crafts) do
		if craft.input == item then
			inv:remove_item("in", item.." 1")
			for _, o in pairs(craft.output) do 
				local leftover = inv:add_item("out", o)
				if leftower then minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, leftover) end
			end
			return true
		end
	end
end