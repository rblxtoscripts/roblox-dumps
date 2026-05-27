-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137LIKE REWARDS GOAL 410k!! THANK YOU \240\159\142\137",
	Items = {
		LemonadeWingPotion = 1,
		LemonFlower = 1,
		LemonPlush = 1,
		PinkLemonade = 1,
		NameTag = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10
	},
	ExtraItems = {
		LemonFlower = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		LemonPlush = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		PoisonHorses = {
			Infertile = true,
			Origin = "Developer",
			Species = { "Cactaline", "Cybred", "Bisorse", "Peryton" },
			Preset = { "PinkLemonade" },
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
		ClaimBeforeTimestamp = 1754110740,
		LastUpdate = 68
	}
}