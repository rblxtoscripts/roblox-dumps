-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 Thank you for hitting 145k likes! \240\159\142\137",
	Items = {
		RandomEquipment = 1,
		ColorDye = 1,
		SunriseSparkleTrail = 1,
		MutationDeletePotion = 1,
		WingUpgradePotion = 1,
		LavenderCrown = 1,
		TraitBoostPotion = 1
	},
	ExtraItems = {
		LavenderCrown = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 13
	}
}