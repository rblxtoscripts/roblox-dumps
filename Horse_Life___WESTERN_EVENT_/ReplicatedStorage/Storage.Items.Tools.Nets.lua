-- https://lua.expert/
local t = {
	{
		Name = "Larvae",
		P = 80
	},
	{
		Name = "RareLarvae",
		P = 15
	},
	{
		Name = "DivineLarvae",
		P = 3
	}
}
return {
	FairyNet = {
		Uses = 1,
		Rarity = "Rare",
		ToolType = "Lasso",
		Description = "A net, for capturing fairies.",
		TargetSpecies = "Fairy",
		ExcludeSpecies = "Others",
		Image = 126208962025241,
		Distance = 150,
		Cooldown = 0.75,
		Hit = 50,
		Points = 2,
		Loot = t
	},
	MagicFairyNet = {
		Uses = 1,
		Rarity = "Rare",
		ToolType = "Lasso",
		Description = "A magical net, for capturing fairies.",
		TargetSpecies = "Fairy",
		ExcludeSpecies = "Others",
		Points = 4,
		Image = 96249117972909,
		Distance = 200,
		Cooldown = 0.75,
		Hit = 75,
		Loot = t
	}
}