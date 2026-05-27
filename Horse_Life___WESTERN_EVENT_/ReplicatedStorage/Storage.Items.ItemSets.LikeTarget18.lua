-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 420k!! THANK YOU \240\159\142\137",
	Items = {
		VaporwaveWingPotion = 1,
		FaceClouds = 1,
		HangingNeonSign = 1,
		VaporPalm = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		FaceClouds = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		HangingNeonSign = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		VaporPalm = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		PoisonHorses = {
			Infertile = true,
			Origin = "Developer",
			Species = { "Clydesdale", "Flora", "Gargoyle", "Plush" },
			Preset = { "Vaporwave" },
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
		ClaimBeforeTimestamp = 1756529940,
		LastUpdate = 72
	}
}