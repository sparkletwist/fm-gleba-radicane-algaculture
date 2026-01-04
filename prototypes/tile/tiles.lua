local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local lava_to_out_of_map_transition = space_age_tiles_util.lava_to_out_of_map_transition

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
		effect = "wetland-blue-swamp",
		effect_color = {50,66,66},
		effect_color_secondary = { 49, 80, 14 },
		map_color = {35, 35, 63},
		layer = 7,
		layer_group = "water-overlay",
		searchable = true,

		-- transitions = data.raw["tile"]["landfill"].transitions,
		-- transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    	-- trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

		sprite_usage_surface = "gleba",
		variants = {
			main = {
				{
					picture = "__gleba-radicane-algaculture__/graphics/terrain/artificial-swamp.png",
					count = 1,
					scale = 0.5,
					size = 1
				}
			},
			transition = tile_graphics.generic_masked_tile_transitions1
		},
		transitions = {lava_to_out_of_map_transition},
		transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
		trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),

		walking_sound = tile_sounds.walking.slime,
		landing_steps_sound = tile_sounds.landing.semi_wet,
		driving_sound = tile_sounds.driving.wetland,
		ambient_sounds = {
			tile_sounds.ambient.insects_deep_mud({}),
			tile_sounds.ambient.night_frogs,
		},
		walking_speed_modifier = 0.8,
		vehicle_friction_modifier = 8.0,
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
		effect = "wetland-blue-swamp",
		effect_color = {50,66,66},
		effect_color_secondary = { 49, 80, 14 },
		map_color = {35, 35, 63},
		layer = 7,
		layer_group = "water-overlay",
		searchable = true,

		-- transitions = data.raw["tile"]["landfill"].transitions,
		-- transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    	-- trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

		sprite_usage_surface = "gleba",
		variants = {
			main = {
				{
					picture = "__gleba-radicane-algaculture__/graphics/terrain/overgrowth-radicane-swamp.png",
					count = 1,
					scale = 0.5,
					size = 1
				}
			},
			transition = tile_graphics.generic_masked_tile_transitions1
		},
		transitions = {lava_to_out_of_map_transition},
		transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
		trigger_effect = tile_trigger_effects.shallow_water_trigger_effect(),
		
		walking_sound = tile_sounds.walking.slime,
		landing_steps_sound = tile_sounds.landing.semi_wet,
		driving_sound = tile_sounds.driving.wetland,
		ambient_sounds = {
			tile_sounds.ambient.insects_deep_mud({}),
			tile_sounds.ambient.night_frogs,
		},
		walking_speed_modifier = 0.8,
		vehicle_friction_modifier = 8.0,
		default_cover_tile = "landfill",
		fluid = "water",
		absorptions_per_second = tile_pollution.gleba_water,
	},
	{
		type = "tile-effect",
		name = "wetland-blue-swamp",
		shader = "water",
		water = {
			shader_variation = "wetland-water",
			lightmap_alpha = 0,
			textures = {
				{
					filename = "__space-age__/graphics/terrain/gleba/watercaustics.png",
					width = 512,
					height = 512
				},
				{
					filename = "__gleba-radicane-algaculture__/graphics/terrain/wetland-blue-swamp-shader.png",
					width = 512 * 4,
					height = 512 * 2
				}
			},
			texture_variations_columns = 1,
			texture_variations_rows = 1,
			secondary_texture_variations_columns = 4,
			secondary_texture_variations_rows = 2,


			animation_speed = 1.5,
			animation_scale = { 0.8, 0.8 },
			tick_scale = 6,

			specular_lightness = { 11, 26, 5 },
			foam_color = { 21, 4, 4 },
			foam_color_multiplier = 1,

			dark_threshold = { 0.1, 0.1 },
			reflection_threshold = { 1, 1 },
			specular_threshold = { 0.19, 0.25 },

			near_zoom = 1 / 16,
			far_zoom = 1 / 16,
		}
	}
})

table.insert(water_tile_type_names, "artificial-swamp")
table.insert(water_tile_type_names, "overgrowth-radicane-swamp")
