if mods["aquilo-seabloom-algaculture"] then
	local algacultural_bay = data.raw["agricultural-tower"]["algacultural-bay"]
	if algacultural_bay then
		table.insert(algacultural_bay.accepted_seeds, "water-cane")
		table.insert(algacultural_bay.accepted_seeds, "radicane-seed")
	end
end
