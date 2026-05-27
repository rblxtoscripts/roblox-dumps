-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 25
	},
	ShortHoofFur = {
		P = 25,
		Strength = 45,
		Type = "Furs"
	},
	SweptHoofFeathers = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongChinBeard = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	HindTuft = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	WavyAnkleFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LongChestFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ChestFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	UTuftedFur = {
		DisplayName = "TuftedFur",
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	ThighFur = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	UChinBeard = {
		DisplayName = "ChinBeard",
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	WindSweptAnkleFur = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	UNeckFur = {
		DisplayName = "NeckFur",
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	UFadedAnkelFur = {
		DisplayName = "FadedAnkleFur",
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	FadedJaw = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	CorruptedSocks = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 25,
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