-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	LimbFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	BellyFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	NeckFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ChinFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	HoofFloof = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	BodyFluff = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	TuftyCheeks = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	HeavyTuftFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	WildFluffyAnkles = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	WildFluffyBeard = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	WildFLuffyStomach = {
		P = 25,
		Strength = 40,
		Type = "Furs",
		DisplayName = "WildFluffyStomach"
	},
	TuffedBellyFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	TuffedNeckFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	PShaggySocks = {
		DisplayName = "ShaggySocks",
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	MoonbeamAnkleFur = {
		P = 15,
		Strength = 15,
		Type = "Furs"
	},
	MoonbeamCheekTufts = {
		P = 25,
		Strength = 25,
		Type = "Furs"
	},
	MoonbeamNeckFur = {
		P = 25,
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