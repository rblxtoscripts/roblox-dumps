-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\240\159\145\182FREE MINI POTION, HAPPY EASTER!\240\159\144\164",
	Items = {
		MiniPotion = 1,
		InstantFoalPotion = 1,
		GoodFeed = 10,
		SpringLasso = 3
	},
	ExtraItems = {},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 53
	}
}