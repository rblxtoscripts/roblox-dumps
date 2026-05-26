-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 400k!! THANK YOU \240\159\142\137",
	Items = {
		RainyWingPotion = 1,
		JungleLeaf = 1,
		DartFrog = 1,
		PoisonDart = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		JungleLeaf = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		DartFrog = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		PoisonDart = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		PoisonHorses = {
			Infertile = true,
			Origin = "Developer",
			Species = { "Kirin", "Hippocampus", "Horse", "Caprine" },
			Preset = { "DartFrog" },
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
		ClaimBeforeTimestamp = 1750636800,
		LastUpdate = 62
	}
}