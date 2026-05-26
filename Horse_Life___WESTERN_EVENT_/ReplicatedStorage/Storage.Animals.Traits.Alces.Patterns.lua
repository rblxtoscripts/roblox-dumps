-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	CaribouSocks = {
		P = 40,
		Strength = 30
	},
	IceSheets = {
		P = 40,
		Strength = 40
	},
	ACaribouPattern = {
		DisplayName = "Caribou",
		P = 40,
		Strength = 40
	},
	FaceSwirls = {
		P = 40,
		Strength = 40
	},
	Crevasse = {
		P = 35,
		Strength = 35
	},
	RearIceSpears = {
		P = 40,
		Strength = 25
	},
	SkiftPattern = {
		P = 40,
		Strength = 25
	},
	SpottyBack = {
		P = 40,
		Strength = 25
	},
	LargePiebald = {
		P = 40,
		Strength = 25
	},
	RunicMarksPattern = {
		P = 40,
		Strength = 25
	},
	CrystallineCape = {
		P = 25,
		Strength = 20
	},
	FrostVeinPattern = {
		P = 25,
		Strength = 20
	},
	FrostFissuresPattern = {
		P = 25,
		Strength = 20
	},
	GlacialDrift = {
		P = 25,
		Strength = 20
	},
	PiercingBlizzard = {
		P = 25,
		Strength = 20
	},
	AuroraBorealisPattern = {
		P = 25,
		Strength = 20
	},
	SnowArmorPattern = {
		P = 25,
		Strength = 20
	},
	IceWindPattern = {
		P = 25,
		Strength = 20
	},
	SnowflakeArmorPattern = {
		P = 25,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}