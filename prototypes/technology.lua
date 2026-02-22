data:extend({
	{
		type = "technology",
		name = "water-cane",
		icon = "__gleba-radicane-algaculture__/graphics/technology/water-cane.png",
		icon_size = 256,
		prerequisites = {"agriculture"},
		effects = {
			{type="unlock-recipe", recipe="water-cane-processing"}
		},
		research_trigger = {
			type = "mine-entity",
			entity = "water-cane"
		}
	},
	{
		type = "technology",
		name = "water-cane-mutation",
		icon = "__gleba-radicane-algaculture__/graphics/technology/water-cane-mutation.png",
		icon_size = 256,
		effects = {
			{type="unlock-recipe", recipe="radicane-seed"},
			{type="unlock-recipe", recipe="overgrowth-radicane-swamp"}
		},
		prerequisites = {"water-cane", "tree-seeding", "uranium-processing"},
		unit = {
			count = 60,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"space-science-pack", 1},
				{"agricultural-science-pack", 1}
			},
			time = 60
		}
	},
	{
		type = "technology",
		name = "radicane",
		icon = "__gleba-radicane-algaculture__/graphics/technology/radicane.png",
		icon_size = 256,
		effects = {
			{type="unlock-recipe", recipe="radicane-processing"},
			{type="unlock-recipe", recipe="radicane-decontamination"},
			-- {type="unlock-recipe", recipe="pentapod-irradiation"}
		},
		prerequisites = {"water-cane-mutation"},
		research_trigger = {
			type = "mine-entity",
			entity = "radicane-plant"
		}
	}
})

if mods["astroponics"] then
	data:extend({
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
