if mods["Arcanyx"] then
	local fds_recipe = require("__fdsl__.lib.recipe")
	local voidicane_centrifuge_tints = {
		primary = { r = 0.78, g = 0.25, b = 0.8, a = 1.000},
		secondary = { r = 0.8, g = 0.22, b = 0.8, a = 1.000},
		tertiary = { r = 0.68, g = 0.22, b = 0.8, a = 1.000},
		quaternary = { r = 0.78, g = 0.22, b = 0.72, a = 1.000},
	}
	local voidstone_yield = math.floor(settings.startup["radicane-uranium-yield"].value * 1.5)
	
	local swamp = data.raw.recipe["overgrowth-radicane-swamp"]
    if (mods["PlanetsLib"]) then
        PlanetsLib.relax_surface_conditions(swamp, {property = "pressure", min = 1000, max = 1200})
    else
        swamp.surface_conditions = { { property = "pressure", min = 1000, max = 1200 } }
    end
	
	local cane = data.raw.item["radicane"]
	local seed = data.raw.item["radicane-seed"]
	
	data:extend({
		{
			type = "item",
			name = "voidicane",
			icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane.png",
			pictures = {
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-1.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-2.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-3.png", size=64, scale=0.5}
			},
			subgroup = cane.subgroup,
			order = "a[seeds]-c[voidicane]-b[item]",
			inventory_move_sounds = cane.inventory_move_sounds,
			pick_sound = cane.pick_sound,
			drop_sound = cane.drop_sound,
			stack_size = cane.stack_size,
			weight = cane.weight, 
			spoil_ticks = cane.spoil_ticks,
			spoil_result = cane.spoil_result
		},
		{
			type = "item",
			name = "voidicane-seed",
			localised_name = {"item-name.voidicane-seed"},
			localised_description = {"item.description.voidicane-seed"},
			icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane-seed.png",
			pictures = {
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-seed-1.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-seed-2.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-seed-3.png", size=64, scale=0.5},
				{filename="__gleba-radicane-algaculture__/graphics/icons/voidicane-seed-4.png", size=64, scale=0.5}
			},
			subgroup = seed.subgroup,
			order = "a[seeds]-c[voidicane]-a[seed]",
			plant_result = "voidicane-plant",
			place_result = "voidicane-plant",
			inventory_move_sounds = seed.inventory_move_sounds,
			pick_sound = seed.pick_sound,
			drop_sound = seed.drop_sound,
			fuel_category = "voidcraft",
			fuel_value = seed.fuel_value,
			stack_size = seed.stack_size,
			weight = seed.weight
		}
	})
	
	local vcs = util.table.deepcopy(data.raw.recipe["radicane-seed"])
	vcs.name = "voidicane-seed"
	vcs.icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane-seed.png"
	vcs.order = "a[seeds]-c[voidicane]-a[mutation]"
	vcs.main_product = "voidicane-seed"
	vcs.order = "a[seeds]-c[voidicane]-a[mutation]"
	vcs.crafting_machine_tint = voidicane_centrifuge_tints
	
	fds_recipe.replace_ingredient(vcs, "uranium-ore", "voidstone", true)
	fds_recipe.replace_result(vcs, "radicane-seed", "voidicane-seed", true)
	
	local vcp = util.table.deepcopy(data.raw.recipe["radicane-processing"])
	vcp.name = "voidicane-processing"
	vcp.icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane-processing.png"
	vcp.order = "a[seeds]-c[voidicane]-b[processing]"
	vcp.crafting_machine_tint = {
		primary = {r=0.64, g=0.215, b=0.7, a=1},
		secondary = {r=0.515, g=0.2, b=0.515, a=1},
	}
	fds_recipe.replace_ingredient(vcp, "radicane", "voidicane", true)
	
	local vcd = util.table.deepcopy(data.raw.recipe["radicane-decontamination"])
	vcd.name = "voidicane-decontamination"
	vcd.icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane-decontamination.png"
	vcd.order = "a[seeds]-c[voidicane]-c[decontamination]"
	vcd.crafting_machine_tint = voidicane_centrifuge_tints
	fds_recipe.replace_ingredient(vcd, "radicane", "voidicane", true)
	fds_recipe.replace_result(vcd, "uranium-ore", {type="item", name="voidstone", amount=voidstone_yield}, true)
	
	local vc_tech = {
		type = "technology",
		name = "voidicane",
		icon = "__gleba-radicane-algaculture__/graphics/technology/voidicane.png",
		icon_size = 256,
		effects = {
			{type="unlock-recipe", recipe="voidicane-seed"},
			{type="unlock-recipe", recipe="voidicane-processing"},
			{type="unlock-recipe", recipe="voidicane-decontamination"},
		},
		prerequisites = {"water-cane-mutation", "s6x-celestial-science-pack", "s6x-polychromatic-science-pack" },
		
		unit = IRIDESCENT.vc_full_combined_science_unit(50)
	}
	
	data:extend({vcs, vcp, vcd, vc_tech})
	
	if (mods["astroponics"]) then
		local vca = util.table.deepcopy(data.raw.recipe["radicane-astroponics"])
		vca.name = "voidicane-astroponics"
		vca.localised_name = {"recipe-name.voidicane-astroponics"}
		vca.icons[1].icon = "__gleba-radicane-algaculture__/graphics/icons/voidicane.png"
		vca.order = "b[agriculture]-b[voidicane]"
		
		fds_recipe.replace_ingredient(vca, "radicane-seed", "voidicane-seed", true)
		fds_recipe.replace_result(vca, "radicane", "voidicane", true)
		
		local vca_tech = {
			type = "technology",
			name = "voidicane-astroponics",
			icon = "__gleba-radicane-algaculture__/graphics/technology/voidicane-astroponics.png",
			icon_size = 256,
			effects = {
				{type="unlock-recipe", recipe="voidicane-astroponics"}
			},
			prerequisites = {"voidicane", "radicane-astroponics"},
			unit = IRIDESCENT.vc_full_combined_science_unit(500),
		}
		
		data:extend({vca, vca_tech})
	end
end

if (mods["Arcanyx"] or mods["VoidBlock"]) then
	table.insert(data.raw.item["overgrowth-radicane-swamp"].place_as_tile.tile_condition, "s6x-voidocean")
end