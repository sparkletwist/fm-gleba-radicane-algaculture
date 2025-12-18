local frep = require("__fdsl__.lib.recipe")

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
			subgroup = "astroponics-processes",
			order = "b[agriculture]-b[radicane]"
		}
	})
end
