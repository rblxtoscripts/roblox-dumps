-- https://lua.expert/
local tbl = {
	Strength = {
		Description = "More Damage to harvestables reducing harvest times",
		MaxLevel = 10
	},
	Fertility = {
		MaxLevel = 10,
		Description = "Reduces the Birth Time for Foals and shortens cooldowns"
	},
	Stamina = {
		MaxLevel = 10
	},
	Agility = {
		MaxLevel = 10,
		Description = "Increases Max Stamina and Stamina Regen"
	},
	Jump = {
		MaxLevel = 10,
		Description = "Boosts the Height and Distance that you can jump"
	},
	Bond = {
		MaxLevel = 10,
		Description = "Increases paint, pattern, horn, and cosmetic breeding chance"
	}
}
for k, v in pairs(tbl) do
	v.Name = k
end
return tbl