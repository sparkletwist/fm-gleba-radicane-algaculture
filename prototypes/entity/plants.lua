local sounds = require("__base__.prototypes.entity.sounds")

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 3 } -- 20% the value as yumako
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

local spoilage_sound_trigger =
{
  {
    type = "play-sound",
    sound = spoilage_sound,
    damage_type_filters = "fire"
  }
}

local radicane_tree_particle_effects =
{
	["water-cane"] = {
		water_cane_top = "water-cane-branch-particle",
		water_cane = "water-cane-branch-particle"
	},
	["radicane"] = {
		water_cane_top = "radicane-branch-particle",
		water_cane = "radicane-branch-particle"
	}
}

-- Copied and edited down from __space-age__.prototypes.entity.plants
local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift, reflection_shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local reflection_shift = reflection_shift or util.by_pixel(52, 80)
  local shift = shift or util.by_pixel(52, -40)
 -- local reflection_shift = {shift[0], shift[1]} --or util.by_pixel(52, 40)

  local water_cane_particle = radicane_tree_particle_effects[name] and radicane_tree_particle_effects[name].water_cane
  local water_cane_top_particle = radicane_tree_particle_effects[name] and radicane_tree_particle_effects[name].water_cane_top

  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local x2 = (i % per_row) * width
    local y2 = math.floor(i / per_row) * height
    local variation = {
      trunk = {
        filename = "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater = nil,

      water_reflection = {
        pictures = {
        filename = "__gleba-radicane-algaculture__/graphics/entity/plant/"..name.."/"..name.."-effect-map.png",
        --flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        --frame_count = 1,
        shift = reflection_shift,
        scale = 0.33 * scale_multiplier
        }
      },

      leaf_generation = {},
      branch_generation = {},

      leaves_when_damaged = 100,
      leaves_when_destroyed = 35,
      leaves_when_mined_manually = 40,
      leaves_when_mined_automatically = 16,
      branches_when_damaged = 20,
      branches_when_destroyed = 16,
      branches_when_mined_manually = 15,
      branches_when_mined_automatically = 8
    }

    if water_cane_top_particle then -- water-cane
      variation.leaf_generation = {
        type = "create-particle",
        particle_name = water_cane_top_particle,
        initial_height = 0.6,
        probability = 0.01,
        offset_deviation = {{-0.15, -0.4}, {0.15, 0.4}},
        initial_height = 1,
        initial_height_deviation = 0.01,
        initial_vertical_speed = 0.015,
        initial_vertical_speed_deviation = 0.055,
        speed_from_center = 0.025,
        speed_from_center_deviation = 0.05,
        frame_speed = 0.8,
        only_when_visible = true
      }
      variation.leaves_when_damaged = 4
      variation.leaves_when_destroyed = 2
      variation.leaves_when_mined_manually = 2
      variation.leaves_when_mined_automatically = 1
    end

    if water_cane_particle then -- water-cane
      variation.branch_generation = {
        type = "create-particle",
        particle_name = water_cane_particle,
        initial_height = 0.6,
        only_when_visible = true
      }
      variation.branches_when_damaged = 2
      variation.branches_when_destroyed = 1
      variation.branches_when_mined_manually = 1
      variation.branches_when_mined_automatically = 1
    end
    table.insert(variations, variation)
  end
  return variations
end

-------------------------------------------------------------------------- Water cane and radicane plants

data:extend({
	{
		type = "plant",
		name = "water-cane-plant",
		icon = "__space-age__/graphics/icons/water-cane.png",
		flags = plant_flags,
		minable = {
			count = 1,
			mining_particle = "wooden-particle",
			mining_time = 0.2,
			results = {{type="item", name="water-cane", amount=5}},
			mining_trigger = {
				{
					type = "direct",
					action_delivery = {
						{
							type = "instant",
							target_effects = spoilage_sound_trigger
						}
					}
				}
			}
		},
		mining_sound = data.raw.tree["water-cane"].mining_sound,
		mined_sound = data.raw.tree["water-cane"].mined_sound,
		growth_ticks = 60 * second,
		harvest_emissions = plant_harvest_emissions,
		emissions_per_second = plant_emissions,
		max_health = 10,
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.3, -1}, {0.3, 0.3}},
		collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
		drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "a[tree]-c[gleba]-c[decorative]-a[water-cane]b",
		impact_category = "tree",
		autoplace = {
			probability_expression = "0",
			tile_restriction = {"wetland-green-slime", "wetland-light-green-slime", "artificial-swamp", "overgrowth-radicane-swamp"}
		},
		variations = data.raw.tree["water-cane"].variations,
		colors = minor_tints(),
		ambient_sounds = data.raw.tree["water-cane"].ambient_sounds
	},
	{
		type = "plant",
		name = "radicane-plant",
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane-plant.png",
		flags = plant_flags,
		minable = {
			count = 1,
			mining_particle = "wooden-particle",
			mining_time = 0.2,
			results = {{type="item", name="radicane", amount=10}},
			mining_trigger = {
				{
					type = "direct",
					action_delivery = {
						{
							type = "instant",
							target_effects = spoilage_sound_trigger
						}
					}
				}
			}
		},
		mining_sound = data.raw.tree["water-cane"].mining_sound,
		mined_sound = data.raw.tree["water-cane"].mined_sound,
		growth_ticks = 60 * second,
		harvest_emissions = plant_harvest_emissions,
		emissions_per_second = plant_emissions,
		max_health = 10,
		collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{-0.3, -1}, {0.3, 0.3}},
		collision_mask = {layers={player=true, ground_tile=true, train=true, is_object=true, is_lower_object=true}},
		drawing_box_vertical_extension = 0.8,
		subgroup = "trees",
		order = "a[tree]-c[gleba]-c[decorative]-a[water-cane]c",
		impact_category = "tree",
		autoplace = {
			probability_expression = "0",
			tile_restriction = {"wetland-green-slime", "wetland-light-green-slime", "artificial-swamp", "overgrowth-radicane-swamp"}
		},
		variations = gleba_tree_variations("radicane", 16, 3, 1, 340, 290, util.by_pixel(30, -28), util.by_pixel(30, -20)),
		colors = minor_tints(),
		ambient_sounds = data.raw.tree["water-cane"].ambient_sounds
	}
})

-- Update water cane to match
data.raw.tree["water-cane"].minable.result = "water-cane"
