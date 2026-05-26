-- https://lua.expert/
local t = {
	Nothing = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	MessyWinterCoatBody = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	MessyWinterCoatHeadTuffs = {
		DisplayName = "MessyWinterCoatHeadTufts",
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	MessyWinterCoatLegs = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	MessyWinterCoatNeck = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	NeatWinterCoatChest = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	NeatWinterCoatHead = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	NeatWinterCoatJaw = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NeatWinterCoatLowerBody = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	NeatWinterCoatLowerLegs = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	NeatWinterCoatNeck = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NeatWinterCoatUpperBody = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NeatWinterCoatUpperLegs = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	MiniBeard = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	FuzzyChest = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	FuzzyJaw = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	FuzzyShoulders = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	FuzzySocks = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	FuzzyThigh = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	},
	ElvenAnkleFur = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	ElvenCheekFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ElvenChestFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ElvenJawFur = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	ElvenUpperLegFur = {
		P = 20,
		Strength = 30,
		Type = "Furs"
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}