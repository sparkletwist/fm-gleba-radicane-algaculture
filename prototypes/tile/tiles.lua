local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
	{
		type = "tile",
		name = "artificial-swamp",
		order = "b[wetland]-g[artificial-swamp]",
		subgroup = "gleba-water-tiles",
		minable = {mining_time=0.5, result="artificial-swamp"},
		mined_sound = base_sounds.deconstruct_bricks(0.8),
		is_foundation = true,
		collision_mask = tile_collision_masks.shallow_water(),
		lowland_fog = true,
		effect = "wetland-green",
		effect_color = {50,66,66},
		effect_color_secondary = { 49, 80, 14 },
		map_color = {35, 63, 35},
		layer = 7,
		layer_group = "water-overlay",
		searchable = true,

		transitions = data.raw["tile"]["landfill"].transitions,
		transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    	trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

		sprite_usage_surface = "gleba",
		variants = {
			main = {
				{
					picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
					count = 1,
					scale = 0.5,
					size = 1
				}
			},
			transition = tile_graphics.generic_masked_tile_transitions1
		},
		-- transitions = {lava_to_out_of_map_transition},
		-- transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
		walking_sound = tile_sounds.walking.slime,
		landing_steps_sound = tile_sounds.landing.semi_wet,
		driving_sound = tile_sounds.driving.wetland,
		ambient_sounds = {
			tile_sounds.ambient.insects_deep_mud({}),
			tile_sounds.ambient.night_frogs,
		},
		walking_speed_modifier = 0.8,
		vehicle_friction_modifier = 8.0,
		-- trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
		default_cover_tile = "landfill",
		fluid = "water",
		absorptions_per_second = tile_pollution.gleba_water,
	},
	{
		type = "tile",
		name = "overgrowth-radicane-swamp",
		order = "b[wetland]-g[artificial-swamp]",
		subgroup = "gleba-water-tiles",
		minable = {mining_time=0.5, result="overgrowth-radicane-swamp"},
		mined_sound = base_sounds.deconstruct_bricks(0.8),
		is_foundation = true,
		collision_mask = tile_collision_masks.shallow_water(),
		lowland_fog = true,
		effect = "wetland-green",
		effect_color = {50,66,66},
		effect_color_secondary = { 49, 80, 14 },
		map_color = {35, 63, 35},
		layer = 7,
		layer_group = "water-overlay",
		searchable = true,

		transitions = data.raw["tile"]["landfill"].transitions,
		transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    	trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

		sprite_usage_surface = "gleba",
		variants = {
			main = {
				{
					picture = "__space-age__/graphics/terrain/gleba/wetland-green-slime.png",
					count = 1,
					scale = 0.5,
					size = 1
				}
			},
			transition = tile_graphics.generic_masked_tile_transitions1
		},
		-- transitions = {lava_to_out_of_map_transition},
		-- transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
		walking_sound = tile_sounds.walking.slime,
		landing_steps_sound = tile_sounds.landing.semi_wet,
		driving_sound = tile_sounds.driving.wetland,
		ambient_sounds = {
			tile_sounds.ambient.insects_deep_mud({}),
			tile_sounds.ambient.night_frogs,
		},
		walking_speed_modifier = 0.8,
		vehicle_friction_modifier = 8.0,
		-- trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
		default_cover_tile = "landfill",
		fluid = "water",
		absorptions_per_second = tile_pollution.gleba_water,
	}
})