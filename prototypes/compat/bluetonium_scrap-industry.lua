if (not mods["Bluetonium"]) then return end
if (not mods["scrap-industry"]) then return end

ScrapIndustry.recipes["radicane-processing"] = {failrate=0.0}
ScrapIndustry.recipes["radicane-seed"] = {ignore=true}
ScrapIndustry.items["radicane"] = {scrap="radioactive-waste", scale=2*ScrapIndustry.FLAVOR, failrate=0.0}

if mods["Arcanyx"] then
	ScrapIndustry.items["voidicane"] = {scrap="disgusting-slime", scale=ScrapIndustry.FLAVOR, failrate=0.0}
	ScrapIndustry.recipes["voidicane-processing"] = {failrate=0.0}
	ScrapIndustry.recipes["voidicane-seed"] = {ignore=true}
end