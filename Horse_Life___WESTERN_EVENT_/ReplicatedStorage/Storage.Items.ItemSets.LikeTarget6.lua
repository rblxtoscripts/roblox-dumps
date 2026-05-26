-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 275k!! THANK YOU \240\159\142\137",
	Items = {
		MoonglowTrail = 1,
		LunarLordHalo = 1,
		MoonRays = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		RandomEquipment = {
			Amount = 1,
			Theme = "Moon",
			ThemeChance = 1
		},
		LunarLordHalo = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		MoonGhoulsteed = {
			Species = "Ghoulsteed",
			Infertile = true,
			Origin = "Developer",
			Preset = { "MoonL", "MoonD" },
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
			MutationsToGuarantee = {
				GlowPattern = 100,
				GlowHair = 100
			}
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 27
	}
}