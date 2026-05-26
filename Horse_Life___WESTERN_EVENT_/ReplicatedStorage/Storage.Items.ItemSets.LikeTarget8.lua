-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 EXCLUSIVE RARE GIFT \240\159\142\137",
	Items = {
		RandomEquipment = {
			Amount = 1,
			Theme = "Floral",
			ThemeChance = 1
		}
	},
	ExtraItems = {
		MulticolorFlora = {
			Species = "Flora",
			Infertile = true,
			Origin = "Developer",
			Preset = { "FloraMulti" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1731794082,
		LastUpdate = 32
	}
}