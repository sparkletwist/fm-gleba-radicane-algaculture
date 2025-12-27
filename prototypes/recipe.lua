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
			{type="item", name="wood", amount=1},
			{type="item", name="nutrients", amount=2}
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
		energy_required = 6,
		ingredients = {
			{type="item", name="uranium-235", amount=1, ignored_by_stats=1},
			{type="item", name="water-cane", amount=1},
			{type="item", name="tree-seed", amount=1}
		},
		results = {
			{type="item", name="radicane-seed", amount=1, probability=0.913},
			{type="item", name="uranium-238", amount=1, ignored_by_stats=1, ignored_by_productivity=1},
			{type="item", name="spoilage", amount=1, probability=0.087}
		},
		main_product = "radicane-seed"
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
		category = "organic",
		subgroup = "nauvis-agriculture",
		order = "a[seeds]-c[radicane]-b[processing]",
		enabled = false,
		allow_productivity = true,
		energy_required = 1,
		ingredients = {{type="item", name="radicane", amount=1}},
		results = {
			{type="item", name="wood", amount=3},
			{type="item", name="nutrients", amount=5}
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
		energy_required = 4,
		ingredients = {
			{type="item", name="radicane", amount=1},
			{type="item", name="nutrients", amount=10},
			{type="item", name="carbon", amount=2}
		},
		results = {
			{type="item", name="water-cane", amount=1},
			{type="item", name="uranium-ore", amount=4}
		}
	},
	{
		type = "recipe",
		name = "pentapod-irradiation",
		icon = "__gleba-radicane-algaculture__/graphics/icons/pentapod-irradiation.png",
		category = "organic",
		subgroup = "agriculture-products",
		order = "c[eggs]-b[pentapod-eggs]-b[irradiation]",
		enabled = false,
		allow_productivity = true,
		allow_quality = true,
		energy_required = 3,
		ingredients = {
			{type="item", name="pentapod-egg", amount=1, ignored_by_stats=1},
			{type="item", name="radicane", amount=10},
			{type="fluid", name="water", amount=30}
		},
		results = {
			{type="item", name="pentapod-egg", amount=4, percent_spoiled=0.5, ignored_by_stats=1, ignored_by_productivity=1},
			{type="item", name="uranium-235", amount=1}
		},
		crafting_machine_tint = {
			primary = {r = 45, g = 192, b = 86, a = 1.000},
			secondary = {r = 75, g = 156, b = 122, a = 1.000},
		}
	}
})
