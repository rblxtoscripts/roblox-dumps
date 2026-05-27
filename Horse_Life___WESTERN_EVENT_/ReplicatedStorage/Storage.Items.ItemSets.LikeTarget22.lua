-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 450k!! THANK YOU \240\159\142\137",
	Items = {
		DangoWingPotion = 1,
		DangoHorn = 1,
		DangoBeads = 1,
		DangoCatterpillar = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		DangoHorn = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		DangoBeads = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		DangoCatterpillar = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		DangoHorse = {
			Infertile = true,
			Origin = "Developer",
			Species = { "Carousel", "Friesian", "Horse", "Equus" },
			Preset = { "Dango" },
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
		ClaimBeforeTimestamp = 1771027140,
		LastUpdate = 97
	}
}