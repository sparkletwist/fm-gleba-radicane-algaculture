local frep = require("__fdsl__.lib.recipe")

if settings.startup["radicane-add-pentapod-eggs"].value then
	frep.add_ingredient("productivity-module-3", {type="item", name="pentapod-egg", amount=1})
end

local wp = data.raw.recipe["wood-processing"]
if wp and wp.surface_conditions then
	if (not mods["astroponics"]) then -- astroponics already handles this
		if (mods["PlanetsLib"]) then
			PlanetsLib.relax_surface_conditions(wp, {property = "pressure", min = 1000, max = 2000})
		else
			wp.surface_conditions = { { property = "pressure", min = 1000, max = 2000 } }
		end
	end
end
