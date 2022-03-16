--hoe function
--local function hoe(pos)
--Infinity Block
minetest.register_node("infinity:infinity_block", {
	description = "Infinity Block",
	light_source = 7,
	tiles = {"infinity_block.png"},
	groups = {cracky=1, snappy=1},
})

--Corruption
minetest.register_node("infinity:corruption", {
	description = "Corruption \n \n Dangerous stuff",
	light_source = 20,
	tiles = {"corruption.png"},
	groups = {oddly_breakable_by_hand=1,cracky=1},
})
minetest.register_node("infinity:cure", {
	description = "There is always a cure \n \n \n \n \n \n Well most of the time anyway",
	light_source = 3,
	tiles = {"cure.png"},
	groups = {oddly_breakable_by_hand=1, cracky=1},
})
minetest.register_node("infinity:fragile_essense", {
	description = "Perhaps the most valuable of all \n \n With great value there comes a price...",
	light_source = 3,
	tiles = {"fragile_essense.png"},
	groups = {oddly_breakable_by_hand=1},
})

minetest.register_abm({
	label = "infinity:corruption",
	nodenames = {"default:dirt_with_grass", "default:stone", "infinity:fragile_essense"},
	neighbors = {"infinity:corruption"},
	interval = 10,
	chance = 1,
	action = function(pos)
		minetest.add_node(pos, {name = "infinity:corruption"})
	end,
})

minetest.register_abm({
	label = "infinity:cure_part_2",
	nodenames = {"infinity:cure"},
	neighbors = {"default:dirt"},
	interval = 1,
	chance = 1,
	action = function(pos)
		minetest.add_node(pos, {name = "default:dirt"})
	end,
})
minetest.register_abm({
	label = "infinity:cure",
	nodenames = {"infinity:corruption"},
	neighbors = {"infinity:cure"},
	interval = 0.1,
	chance = 1,
	action = function(pos)
		minetest.add_node(pos, {name = "infinity:cure"})
	end,
})
minetest.register_craftitem("infinity:matter", {
	description = "Plain matter",
	inventory_image = "matter.png",
})
minetest.register_node("infinity:unearthed_matter", {
	description = "Unearthed matter",
	tiles = {
		"infinity_top.png",
		"Infinity_bottom.png",
		"infinity_side.png",
		"infinity_side.png",
		"infinity_side.png",
		"infinity_side.png",
	},
	groups={cracky=3},
	drop = "infinity:matter",
	on_punch = function(pos)
		minetest.set_node(pos, {name = "default:dirt_with_grass"})
	end,
})
minetest.register_craft({
	output = "infinity:infinity_block",
	recipe = {
		{"infinity:infinity_fragment", "infinity:infinity_fragment", "infinity:infinity_fragment"},
		{"infinity:infinity_fragment", "infinity:infinity_fragment", "infinity:infinity_fragment"},
		{"infinity:infinity_fragment", "infinity:infinity_fragment", "infinity:infinity_fragment"},	
	}
})
--Compacted Aether Sets
minetest.register_craftitem("infinity:compacted_aether", {
	description = "Compacted Aether for use in infinity block crafting.", 
	inventory_image= "aether_essence.png"})
minetest.register_craft({
	output = "infinity:compacted_aether",
	recipe = {
		{"aether_new:essence", "aether_new:essence"},
		{"aether_new:essence", "aether_new:essence"},
	}
})
-- Ultra-Compacted Aether Sets
minetest.register_craftitem("infinity:ultra_compacted_aether", {
	description = "Ultra-compacted aether", 
	inventory_image = "ultra-compacted.png"})
minetest.register_craft({
	output = "infinity:ultra_compacted_aether", 
	recipe = {
		{"infinity:compacted_aether", "infinity:compacted_aether"},
		{"infinity:compacted_aether", "infinity:compacted_aether"},
		{"infinity:compacted_aether", "infinity:compacted_aether"},
		}
})
-- Infinity Fragment
minetest.register_craftitem("infinity:infinity_fragment", {
	description = "A fragment of infinity",
	inventory_image = "infinity-fragment.png",
})
minetest.register_craft({
	output = "infinity:infinity_fragment", 
	recipe = {
		{"infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether"},
		{"infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether"},
		{"infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether", "infinity:ultra_compacted_aether"},
	},
})

-- Infinity Biome
minetest.register_biome({
	name = "infinity_biome",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	y_max = 1000,
	y_min = -3,
	heat_point = 50,
	humidity_point = 50,
})
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"base:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.2,
	biomes = {"infinity_biome"},
	y_max = 200,
	y_min = 1,
	decoration = "plants:grass",
})
-- Tools
minetest.register_tool("infinity:sword", {
	description = "Sword of the cosmos",
	inventory_image = "sword_of_the_cosmos.png",
	stack_max = 1,
	tool_capabilities = {
		full_punch_interval = 1.0,
		damage_groups = {fleshy=1000000},
	},
    groupcaps={
            snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, maxlevel=3},
    },
    groups = {sword=1},
})
minetest.register_tool("infinity:world_breaker", {
	description = ("World Breaker"),
	inventory_image = "world_breaker.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=10,
		groupcaps={
			cracky = {times={[1]=0.10, [2]=0.10, [3]=0.10}, maxlevel=2},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})


minetest.register_chatcommand("tpspawn", {
	description = "Teleports you to spawn",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		player:setpos({x = 0, y = 0, z = 0})
		minetest.chat_send_player(name, "Welcome to spawn.")
	end,
})

minetest.register_privilege("admin", "Player can use custom admin commands.")
--minetest.register_chatcommand("hacks")
minetest.register_tool("infinity:planet_eater", {
	description = ("Planet Eater"),
	inventory_image = "planet_eater.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=10,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.10, [3]=0.10}, maxlevel=10},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})
minetest.register_tool("infinity:hoe_of_the_green_earth", {
    description = "Hoe of the green earth.",
    inventory_image = "hoe_of_the_green_earth.png",
    groups = { tool=1, hoe=1, enchantability=10 },
    tool_capabilities = {
       full_punch_interval = 0.10,
        damage_groups = { fleshy = 1, },
    },
   -- on_punch({
--		
--	})
})
