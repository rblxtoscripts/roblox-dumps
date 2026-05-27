-- https://lua.expert/
local t = {
	Nothing = {
		P = 5,
		Strength = 5
	},
	BellRibbon = {
		P = 10,
		Strength = 35
	},
	HChestBow = {
		DisplayName = "ChestBow",
		P = 7,
		Strength = 7
	},
	PoinsettiaCover = {
		P = 10,
		Strength = 35
	},
	GumDrops = {
		P = 7,
		Strength = 7
	},
	LegTufts = {
		P = 10,
		Strength = 10
	},
	SwirlyChestFur = {
		P = 10,
		Strength = 10
	},
	ChinFur = {
		P = 10,
		Strength = 10
	},
	Peppermint = {
		P = 10,
		Strength = 10
	},
	BackFur = {
		P = 7,
		Strength = 7
	},
	SideBells = {
		P = 10,
		Strength = 10
	},
	KrampusFacialFur = {
		P = 5,
		Strength = 5
	},
	KrampusLowerLegFur = {
		P = 5,
		Strength = 5
	},
	KrampusSideFur = {
		P = 5,
		Strength = 5
	},
	KrampusUpperLegFur = {
		P = 5,
		Strength = 5
	},
	BorealisCheekFur = {
		P = 10,
		Strength = 10
	},
	BorealisHoofFur = {
		P = 7,
		Strength = 7
	},
	SnowyLashes = {
		P = 10,
		Strength = 10
	},
	ThighWinterFur = {
		P = 5,
		Strength = 5
	},
	NeckWinterFur = {
		P = 5,
		Strength = 5
	},
	LegWinterFur = {
		P = 5,
		Strength = 5
	},
	CheekWinterFur = {
		P = 5,
		Strength = 5
	},
	FestiveDrapings = {
		P = 7,
		Strength = 7
	},
	FluffyFeathering = {
		P = 7,
		Strength = 7
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}