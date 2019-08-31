minetest.register_tool("caves_shop:hand_shop", {
    description = "Test",
    inventory_image = "default_apple.png",
    on_use = function(itemstack, user, pointed_thing)
        minetest.show_formspec(user:get_player_name(), "caves_shop:shopformspec", shop.formspec1)
    end,
})

--on_rightclick = function(pos, node, clicker)

minetest.register_node("caves_shop:shop", {
    description = "Vending machine",
    tiles = {
		"shop_top.png", "shop_top.png",
		"shop_side.png", "shop_side.png",
		"shop_side.png", "shop_side.png"
    },
    on_rightclick = function(pos, node, clicker)
        minetest.show_formspec(clicker:get_player_name(), "caves_shop:shopformspec", shop.formspec1)
    end,
    light_source = 4,
    groups = {cracky = 3, stone = 4},
    sounds = default.node_sound_metal_defaults(),
})

shop = {}
shop.formspec1 = "size[8,9]"..
                "label[2.5,0;Vending machine]"..
                "image_button[1,1;1,1;type_6.png;type_6;]"..
                "label[2,1.25;Type 6, cost - 400 gold money]"..
                "image_button[1,2;1,1;plasma_charge.png;plasma_charge;]"..
                "label[2,2.25;Plasma charge, cost - 120 gold money]"..
                "image_button[1,3;1,1;gold.png;gold;]"..
                "label[2,3.25;Gold money, cost - 1 emerald to 3 money]"..
                "list[current_player;main;0,5;8,4;]"..
                "button[7,4;1,1;to_2;>>>]"

shop.formspec2 = "size[8,9]"..
                "label[2.5,0;Vending machine]"..
                "image_button[1,1;1,1;arrow.png;arrow;]"..
                "label[2,1.25;Arrow, cost - 6 gold money for 5 arrows]"..
                "image_button[1,2;1,1;pistol_bullet.png;pistol_bullet;]"..
                "label[2,2.25;Pistol bullets, cost - 14 gold money for 10 bullets]"..
                "image_button[1,3;1,1;default_tool_steelsword.png;steel_sword;]"..
                "label[2,3.25;Steel sword, cost - 89 gold money]"..
                "list[current_player;main;0,5;8,4;]"..
                "button[0,4;1,1;to_1;<<<]"..
                "button[7,4;1,1;to_3;>>>]"

shop.formspec3 = "size[8,9]"..
                "label[2.5,0;Vending machine]"..
                "image_button[1,1;1,1;default_tool_steelpick.png;steel_pick;]"..
                "label[2,1.25;Steel pickaxe, cost - 60 gold money]"..
                "image_button[1,2;1,1;mace_normal.png;mace;]"..
                "label[2,2.25;Mace, cost - 70 gold money]"..
                "list[current_player;main;0,5;8,4;]"..
                "image_button[1,3;1,1;crystal_health.png;health_crystal;]"..
                "label[2,3.25;Health crystal, cost - 56 gold money]"..
                "button[0,4;1,1;to_2;<<<]"..
                "button[7,4;1,1;to_4;>>>]"

shop.formspec4 = "size[8,9]"..
                "label[2.5,0;Vending machine]"..
                "image_button[1,1;1,1;default_steel_ingot.png;steel_ingot;]"..
                "label[2,1.25;Steel ingot, cost - 18 gold money]"..
                "image_button[1,2;1,1;default_diamond.png;diamond;]"..
                "label[2,2.25;diamond, cost - 40 gold money]"..
                "list[current_player;main;0,5;8,4;]"..
                "image_button[1,3;1,1;default_mese_crystal.png;mese_crystal;]"..
                "label[2,3.25;Mese crystal, cost - 40 gold money]"..
                "button[0,4;1,1;to_3;<<<]"

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "caves_shop:shopformspec" then -- Replace this with your form name
        print("Player "..player:get_player_name().." submitted fields "..dump(fields))
        if fields.type_6 ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 400") then
                local leftover = inv:add_item("main", "caves_range:type_6")
                inv:remove_item("main", "caves_resources:gold_money 400")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.plasma_charge ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 120") then
                local leftover = inv:add_item("main", "caves_range:plasma_charge")
                inv:remove_item("main", "caves_resources:gold_money 120")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.gold ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:emerald 1") then
                local leftover = inv:add_item("main", "caves_resources:gold_money 3")
                inv:remove_item("main", "caves_resources:emerald 1")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.arrow ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 6") then
                local leftover = inv:add_item("main", "caves_range:arrow 5")
                inv:remove_item("main", "caves_resources:gold_money 6")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.pistol_bullet ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 14") then
                local leftover = inv:add_item("main", "caves_range:pistol_bullet 10")
                inv:remove_item("main", "caves_resources:gold_money 14")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.steel_sword ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 89") then
                local leftover = inv:add_item("main", "default:sword_steel")
                inv:remove_item("main", "caves_resources:gold_money 89")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.steel_pick ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 60") then
                local leftover = inv:add_item("main", "default:pick_steel")
                inv:remove_item("main", "caves_resources:gold_money 60")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end 
        if fields.mace ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 70") then
                local leftover = inv:add_item("main", "caves_melee:mace_normal")
                inv:remove_item("main", "caves_resources:gold_money 70")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end 
        if fields.health_crystal ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 56") then
                local leftover = inv:add_item("main", "caves_resources:health_crystal")
                inv:remove_item("main", "caves_resources:gold_money 56")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.steel_ingot ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 18") then
                local leftover = inv:add_item("main", "default:steel_ingot")
                inv:remove_item("main", "caves_resources:gold_money 18")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.diamond ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 40") then
                local leftover = inv:add_item("main", "default:diamond")
                inv:remove_item("main", "caves_resources:gold_money 40")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.mese_crystal ~= nil then
            inv = player:get_inventory()
            if inv:contains_item("main", "caves_resources:gold_money 40") then
                local leftover = inv:add_item("main", "default:mese_crystal")
                inv:remove_item("main", "caves_resources:gold_money 40")
                if not leftover:is_empty() then
                    minetest.add_item(player:get_pos(), leftover)
                end
            end
        end
        if fields.to_2 ~= nil then
            minetest.show_formspec(player:get_player_name(), "caves_shop:shopformspec", shop.formspec2)
        end
        if fields.to_1 ~= nil then
            minetest.show_formspec(player:get_player_name(), "caves_shop:shopformspec", shop.formspec1)
        end
        if fields.to_3 ~= nil then
            minetest.show_formspec(player:get_player_name(), "caves_shop:shopformspec", shop.formspec3)
        end
        if fields.to_4 ~= nil then
            minetest.show_formspec(player:get_player_name(), "caves_shop:shopformspec", shop.formspec4)
        end
	end
end)