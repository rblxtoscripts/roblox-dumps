-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongBackFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	SparseFurTufts = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	LongBeardFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongBellyFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongHoofFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	InfectousFrostMask = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	SnowflakeHeadFins = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LengthyNeckFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongThighFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	IcicleLegPlates = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	IcicleShoulderPlates = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	IcicleSocks = {
		P = 15,
		Strength = 20,
		Type = "Furs"
	},
	SweptThighFur = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	LegFeathering = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	ChestFluff = {
		P = 35,
		Strength = 35,
		Type = "Furs"
	},
	CheekFluff = {
		P = 40,
		Strength = 40,
		Type = "Furs"
	},
	UnderbellyIcicles = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	IcicleFeet = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	SnowflakeArmorCheek = {
		P = 25,
		Strength = 25
	},
	SnowflakeAmrorAnkle = {
		DisplayName = "SnowflakeArmorAnkle",
		P = 30,
		Strength = 30
	},
	OldBackCurls = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	OldBeard = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	OldBrows = {
		P = 25,
		Strength = 25
	},
	OldLegCurls = {
		P = 30,
		Strength = 30
	},
	HeavyFurBack = {
		P = 30,
		Strength = 30,
		Type = "Furs"
	},
	HeavyFurNeck = {
		P = 25,
		Strength = 25
	},
	HeavyFurSocks = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}