-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "LEGO\194\174 Quest Update",
	Items = {},
	ExtraItems = {
		LEGOHorse = {
			Infertile = true,
			Species = { "Horlse" },
			Preset = { "LegoBlackAzure", "LegoBlackViolet", "LegoBlackPink", "LegoBlackNougat", "LegoNougatBlack", "LegoPinkWhite", "LegoAzureWhite" }
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1773428400,
		LastUpdate = 100
	}
}