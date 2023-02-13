print("Registering hexcol nodes.")

-- sound support
local block_sound = {}
if minetest.get_modpath("default") then
	block_sound = default.node_sound_stone_defaults()
elseif minetest.get_modpath("mcl_sounds") then
	block_sound = mcl_sounds.node_sound_stone_defaults()
end

local group = {cracky = 1}
if not minetest.settings:get_bool("hexcol_inv", true) then
    group.not_in_creative_inventory = 1
end

for i = 0,4095,1 
do 
    local hex = string.format("%03x", i)
    minetest.register_node("hexcol:"..hex, {
        description = "#"..hex,
        tiles = {"white.png^[multiply:#"..hex},
        sounds = block_sound,
        groups = group,
        paramtype = "light",
        sunlight_propagates = true,
    })
end

print("Done.")
