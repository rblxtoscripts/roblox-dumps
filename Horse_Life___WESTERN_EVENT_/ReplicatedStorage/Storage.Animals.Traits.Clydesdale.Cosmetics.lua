-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 35
	},
	Underfur = {
		P = 40,
		Strength = 40
	},
	FlaredAnkleFur = {
		P = 25,
		Strength = 25
	},
	CThighFur = {
		DisplayName = "ThighFur",
		P = 40,
		Strength = 40
	},
	CLongBellyFur = {
		DisplayName = "LongBellyFur",
		P = 40,
		Strength = 40
	},
	StandardFeathering = {
		P = 50,
		Strength = 50
	},
	PrettyLashes = {
		P = 35,
		Strength = 35
	},
	WhimsyAnkleFur = {
		P = 35,
		Strength = 35
	},
	CobSocks = {
		P = 25,
		Strength = 25
	},
	CWavyHoofFur = {
		DisplayName = "WavyHoofFur",
		P = 35,
		Strength = 35
	},
	NeatlyTrimmedFeathers = {
		P = 25,
		Strength = 25
	},
	Goatee = {
		P = 35,
		Strength = 35
	},
	CPointedBeard = {
		DisplayName = "PointedBeard",
		P = 35,
		Strength = 35
	},
	RoughBeard = {
		P = 25,
		Strength = 25
	},
	StripedFeathering = {
		P = 35,
		Strength = 35
	},
	VictorianBeard = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}