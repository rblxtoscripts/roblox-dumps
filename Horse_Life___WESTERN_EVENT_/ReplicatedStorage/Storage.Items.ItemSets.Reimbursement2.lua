-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "\226\157\164\239\184\143 Reimbursement part 2!",
	Items = {
		PurpleButterflies = 1,
		PurpleSparkleTrail = 1,
		ColorDye = 1
	},
	Claimable = {
		ClaimBeforeTimestamp = 1750207024,
		LastUpdate = 18
	}
}