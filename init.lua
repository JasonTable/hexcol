print("Registering hexcol nodes and items.")

-- sound support
local block_sound = {}

if minetest.get_modpath("default") then
	block_sound = default.node_sound_stone_defaults()
elseif minetest.get_modpath("mcl_sounds") then
	block_sound = mcl_sounds.node_sound_stone_defaults()
end

local nodegroup = {cracky = 1,not_in_creative_inventory = 1}
local itemgroup = {hex = 1}
if not minetest.settings:get_bool("hexcol_inv", true) then
    itemgroup.not_in_creative_inventory = 1
end

for i = 0,15,1 
do 
    local hex = string.format("%x", i)
    minetest.register_node("hexcol:"..hex.."xx", {
        description = "#"..hex.."xx",
        tiles = {"white.png"},
        sounds = block_sound,
        groups = nodegroup,
        paramtype = "light",
        paramtype2 = "color",
        palette = hex.."xx.png",
        sunlight_propagates = true,
        preserve_metadata = function(pos, oldnode, oldmeta, drops)
            local h = hex..string.format("%02x",oldnode.param2)
            drops[1] = ItemStack("hexcol:"..h)
        end,
    })
end

for i = 0,4095,1 
do 
    local hex = string.format("%03x", i)
    local firsthex = string.sub(hex,1,1)
    local p2hex = string.sub(hex,2,3)
    minetest.register_craftitem("hexcol:"..hex, {
        description = "#"..hex,
        inventory_image = "white.png",
        color = "#"..hex,
        groups = itemgroup,
        sounds = block_sound,
        node_placement_prediction = "hexcol:"..firsthex.."xx",
        on_place = function(itemstack, placer, pointed_thing)
            if not (creative and creative.is_enabled_for
			and creative.is_enabled_for(placer:get_player_name()))
            then
                itemstack:take_item(1)
            end
            local node = ItemStack("hexcol:"..firsthex.."xx")
            local param2 = tonumber("0x"..p2hex)
            minetest.item_place(node, placer, pointed_thing, param2)
            return itemstack
        end,
    })
end

print("Done.")
