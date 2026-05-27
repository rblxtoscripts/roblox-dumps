-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 EXCLUSIVE RARE GIFT \240\159\142\137",
	Items = {
		InstantFoalPotion = 1,
		RestingWingPotion = 1,
		LiftedWingPotion = 1
	},
	ExtraItems = {
		LeafyFlowerCrown = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		},
		DemonKelpie = {
			Species = "Kelpie",
			Infertile = true,
			Origin = "Developer",
			Preset = { "Demon" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1722117600,
		LastUpdate = 16
	}
}