-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\142\137 Thank you for hitting 75k likes! \240\159\142\137",
	Items = {
		TraitBoostPotion = 2,
		RandomFlair = 1,
		RandomWingPotion = 1
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 9
	}
}