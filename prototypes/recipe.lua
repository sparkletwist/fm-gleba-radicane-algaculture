local buffed_wood = false
if mods["early-agriculture"] then
	buffed_wood = settings.startup["early-agriculture-buff-tree-plant"].value
elseif mods["astroponics"] then
	buffed_wood = settings.startup["astroponics-more-wood"].value
end

local radicane_centrifuge_tints = {
	primary = { r = 0.4, g = 0.75, b = 0.22, a = 1.0 },
	secondary = { r = 0.4, g = 0.75, b = 0.22, a = 1.0 },
	tertiary = { r = 0.6, g = 0.7, b = 0.3, a = 1.0 },
	quaternary = { r = 0.5, g = 0.66, b = 0.45, a = 1.0 },
}

data:extend({
	{
		type = "recipe",
		name = "water-cane-processing",
		icon = "__gleba-radicane-algaculture__/graphics/icons/water-cane-processing.png",
		category = "organic-or-assembling",
		subgroup = "agriculture-processes",
		order = "a[seeds]-A[water-cane-procesing]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {{type="item", name="water-cane", amount=1}},
		results = {
			{type="item", name="wood", amount=buffed_wood and 2 or 1},
			{type="item", name="nutrients", amount=1}
		},
		crafting_machine_tint = {
			primary = {r=0.415, g=0.215, b=0.106, a=1},
			secondary = {r=0.315, g=0.715, b=0.306, a=1},
		}
	},
	{
		type = "recipe",
		name = "radicane-seed",
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane-seed.png",
		category = "centrifuging",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-a[mutation]",
		enabled = false,
		allow_productivity = true,
		energy_required = 3,
		ingredients = {
			{type="item", name="uranium-ore", amount=1},
			{type="item", name="water-cane", amount=1},
			{type="item", name="tree-seed", amount=1}
		},
		results = {
			{type="item", name="radicane-seed", amount=1},
			{type="item", name="spoilage", amount_min=2, amount_max=4}
		},
		main_product = "radicane-seed",
		crafting_machine_tint =  radicane_centrifuge_tints
	},
	
	{
		type = "recipe",
		name = "artificial-swamp",
		category = "crafting-with-fluid",
		surface_conditions = {
			{
				property = "pressure",
				min = 2000,
				max = 2000
			}
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 2,
		ingredients = {
			{type="item", name="landfill", amount=5},
			{type="item", name="water-cane", amount=2},
			{type="item", name="nutrients", amount=50},
			{type="fluid", name="water", amount=500}
		},
		results = {{type="item", name="artificial-swamp", amount=10}}
	},
	{
		type = "recipe",
		name = "overgrowth-radicane-swamp",
		category = "crafting-with-fluid",
		surface_conditions = {
			{
				property = "pressure",
				min = 1000,
				max = 1000
			}
		},
		enabled = false,
		allow_productivity = true,
		energy_required = 10,
		ingredients = {
			{type="item", name="artificial-swamp", amount=2},
			{type="item", name="pentapod-egg", amount=5},
			{type="item", name="uranium-ore", amount=10},
			{type="item", name="spoilage", amount=50},
			{type="fluid", name="petroleum-gas", amount=100}
		},
		results = {{type="item", name="overgrowth-radicane-swamp", amount=1}}
	},
	{
		type = "recipe",
		name = "radicane-processing",
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane-processing.png",
		category = "organic-or-assembling",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-b[processing]",
		enabled = false,
		allow_productivity = true,
		energy_required = 0.6, -- 4 space gardens -> 1 radicane processing biochamber
		ingredients = {{type="item", name="radicane", amount=1}},
		results = {
			{type="item", name="wood", amount=buffed_wood and 4 or 2},
			{type="item", name="nutrients", amount=3}
		},
		crafting_machine_tint = {
			primary = {r=0.215, g=0.815, b=0.306, a=1},
			secondary = {r=0.515, g=0.515, b=0.206, a=1},
		}
	},
	{
		type = "recipe",
		name = "radicane-decontamination",
		icon = "__gleba-radicane-algaculture__/graphics/icons/radicane-decontamination.png",
		category = "centrifuging",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-c[decontamination]",
		enabled = false,
		allow_productivity = true,
		energy_required = 3,
		ingredients = {
			{type="item", name="radicane", amount=1},
			{type="item", name="nutrients", amount=9}
		},
		results = {
			{type="item", name="water-cane", amount=1},
			{type="item", name="uranium-ore", amount = settings.startup["radicane-uranium-yield"].value}
		},
		
		crafting_machine_tint =  radicane_centrifuge_tints
	},
})

if mods["astroponics"] then
	data:extend({
		{
			type = "recipe",
			name = "radicane-astroponics",
			localised_name = {"recipe-name.radicane-astroponics"},
			icons = {
				{icon="__gleba-radicane-algaculture__/graphics/icons/radicane.png"},
				{icon="__astroponics__/graphics/icons/fluid/liquid-fertilizer.png", shift={-8,-8}, scale=0.3}
			},
			category = "astroponics",
			subgroup = "astroponic-processes",
			order = "b[agriculture]-b[radicane]",
			energy_required = 6,  -- 4 space gardens -> 1 biochamber
			enabled = false,
			auto_recycle = false,
			allow_productivity = true,
			ingredients = {
				{type="fluid", name="liquid-fertilizer", amount=50, ignored_by_stats=50},
				{type="item", name="radicane-seed", amount=1}
			},
			results = {
				{type="item", name="radicane", amount=5},
				{type="fluid", name="bioslurry", amount=25, ignored_by_stats=25, ignored_by_productivity=25}
			}
		}
	})	
end
