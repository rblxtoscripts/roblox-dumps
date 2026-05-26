-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 440k!! THANK YOU \240\159\142\137",
	Items = {
		JewelWingPotion = 1,
		JewelBeetleNecklace = 1,
		JewelBeetleSurfboard = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		JewelBeetleNecklace = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		JewelBeetleSurfboard = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		PoisonHorses = {
			Infertile = true,
			Origin = "Developer",
			Species = { "Seraph", "Ghoulsteed", "Pony", "Caprine" },
			Preset = { "CottonCandy" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			},
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0
				},
				{
					Amount = 2,
					P = 0
				},
				{
					Amount = 3,
					P = 1
				}
			},
			MutationChances = {
				Nothing = 0,
				Wings = 100
			}
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1764982800,
		LastUpdate = 86
	}
}