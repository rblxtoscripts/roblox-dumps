-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 225k!! THANK YOU \240\159\142\137",
	Items = {
		SunglowTrail = 1,
		SunLordHalo = 1,
		SunRays = 1,
		LiftedWingPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		RandomEquipment = {
			Amount = 1,
			Theme = "Sun",
			ThemeChance = 1
		},
		SunLordHalo = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		SunPony = {
			Species = "Pony",
			Infertile = true,
			Origin = "Developer",
			Preset = { "Sun" },
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
				GlowHair = 100,
				GlowPaint = 100
			}
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 21
	}
}