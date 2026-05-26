-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\226\157\164\239\184\143 Reimbursement for purchasing issues",
	Items = {
		InstantFoalPotion = 2,
		RandomWingPotion = 1,
		NameTag = 2,
		MutationPotion = 1,
		MutationDeletePotion = 1,
		RandomEquipment = 2,
		MasterLasso = 2,
		BasicFeed = 3
	},
	Claimable = {
		ClaimBeforeTimestamp = 1722557046,
		LastUpdate = 17
	}
}