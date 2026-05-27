-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 Thank you for hitting 100k likes! \240\159\142\137",
	Items = {
		RandomEquipment = 1,
		ColorDye = 1,
		IronChainTrail = 1,
		InstantFoalPotion = 1,
		RandomWingPotion = 1,
		LeafyFlowerCrown = 1,
		NameTag = 1
	},
	ExtraItems = {
		LeafyFlowerCrown = {
			Amount = 1,
			Theme = "Random",
			ThemeChance = 1
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 11
	}
}