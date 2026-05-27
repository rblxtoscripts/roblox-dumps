-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPresets = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").StarterPresets
return {
	RestoreAddedItems = true,
	Text = "LEGO\194\174 Gift",
	CanDecline = true,
	Items = {
		LegoWingPotion = 2,
		HeartClip = 1,
		Propeller = 1,
		Antler = 1,
		FlowerCrown = 1,
		Rosette1 = 1
	},
	ExtraItems = {
		LEGOHorse = {
			Infertile = true,
			Species = { "Horlse" },
			Preset = { "LegoBlackAzure", "LegoBlackViolet", "LegoBlackPink", "LegoBlackNougat", "LegoNougatBlack", "LegoPinkWhite", "LegoAzureWhite" }
		}
	},
	Claimable = {
		ClaimBeforeTimestamp = 1774645200,
		LastUpdate = 102
	}
}