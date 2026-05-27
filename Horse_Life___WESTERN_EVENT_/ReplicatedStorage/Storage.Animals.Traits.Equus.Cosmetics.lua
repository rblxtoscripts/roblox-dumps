-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongChinFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	WispyAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongNeckFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ThighFluff = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ShortUnderFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	HindFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ShortChinHair = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ShortLimbFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	EShortHoofFur = {
		DisplayName = "ShortHoofFur",
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	StripedRidgeHair = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	LongHeavyFeathering = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	SideFur = {
		P = 25,
		Strength = 40,
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