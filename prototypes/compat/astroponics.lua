local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if mods["astroponics"] then
	frep.add_ingredient("water-cane-mutation", {type="fluid", name="liquid-fertilizer", amount=250})
	frep.add_result("water-cane-mutation", {type="fluid", name="bioslurry", amount=100, ignored_by_productivity=100})

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
			energy_required = 5,
			enabled = false,
			auto_recycle = false,
			allow_productivity = true,
			ingredients = {
				{type="fluid", name="liquid-fertilizer", amount=50, ignored_by_stats=50},
				{type="fluid", name="water", amount=20, ignored_by_stats=10},
				{type="item", name="radicane-seed", amount=1}
			},
			results = {
				{type="item", name="radicane", amount=5},
				{type="fluid", name="water", amount=10, ignored_by_stats=10, ignored_by_productivity=10},
				{type="fluid", name="bioslurry", amount=20, ignored_by_stats=20, ignored_by_productivity=20}
			}
		},
		{
			type = "technology",
			name = "radicane-astroponics",
			icon = "__gleba-radicane-algaculture__/graphics/technology/radicane-astroponics.png",
			icon_size = 256,
			effects = {
				{type="unlock-recipe", recipe="radicane-astroponics"}
			},
			prerequisites = {"radicane", "astroponics", "advanced-asteroid-processing"},
			unit = {
				count = 1000,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"production-science-pack", 1},
					{"utility-science-pack", 1},
					{"space-science-pack", 1},
					{"agricultural-science-pack", 1}
				},
				time = 60
			}
		}
	})
end
