local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
	{
		type = "item",
		name = "water-cane",
		icon = "__gleba-radicane-algaculture__/graphics/icons/water-cane.png",
		subgroup = "agriculture-processes",
		order = "b[agriculture]-A[water-cane]",
		plant_result = "water-cane-plant",
		place_result = "water-cane-plant",
		inventory_move_sounds = item_sounds.wood_inventory_move,
		pick_sound = item_sounds.wood_inventory_pickup,
		drop_sound = item_sounds.wood_inventory_move,
		fuel_category = "chemical",
		fuel_value = "2MJ",
		stack_size = 50,
		default_import_location = "gleba",
		weight = 1 * kg,
		spoil_ticks = 60*minute,
		spoil_result = "spoilage"
	},
	{
		type = "item",
		name = "radicane-seed",
		localised_name = {"item-name.radicane-seed"},
		localised_description = {"item.description.radicane-seed"},
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane-seed.png",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-a[seed]",
		plant_result = "radicane-plant",
		place_result = "radicane-plant",
		inventory_move_sounds = item_sounds.wood_inventory_move,
		pick_sound = item_sounds.wood_inventory_pickup,
		drop_sound = item_sounds.wood_inventory_move,
		fuel_category = "chemical",
		fuel_value = "1.21MJ",
		stack_size = 10,
		weight = 10 * kg
	},
	{
		type = "item",
		name = "radicane",
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane.png",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-b[item]",
		inventory_move_sounds = item_sounds.wood_inventory_move,
		pick_sound = item_sounds.wood_inventory_pickup,
		drop_sound = item_sounds.wood_inventory_move,
		stack_size = 50,
		weight = 1 * kg,
		spoil_ticks = 679500, -- 50% more radiation than fish!
		spoil_result = "spoilage"
	},
	{
		type = "item",
		name = "artificial-swamp",
		icon = "__gleba-radicane-algaculture__/graphics/icons/artificial-swamp.png",
		subgroup = "terrain",
		order = "c[landfill]-b[artificial-swamp]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		place_as_tile = {
			result = "artificial-swamp",
			condition_size = 1,
			condition = {layers={ground_tile=true}}
		}
	},
	{
		type = "item",
		name = "overgrowth-radicane-swamp",
		icon = "__gleba-radicane-algaculture__/graphics/icons/overgrowth-radicane-swamp.png",
		subgroup = "terrain",
		order = "c[landfill]-b[overgrowth-radicane-swamp]",
		inventory_move_sound = item_sounds.landfill_inventory_move,
		pick_sound = item_sounds.landfill_inventory_pickup,
		drop_sound = item_sounds.landfill_inventory_move,
		stack_size = 100,
		place_as_tile = {
			result = "overgrowth-radicane-swamp",
			condition_size = 1,
			condition = {layers={ground_tile=true}}
		}
	}
})
