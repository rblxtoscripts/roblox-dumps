-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	SandSpeckle = {
		P = 40,
		Strength = 40
	},
	CactusStripes = {
		P = 25,
		Strength = 25
	},
	BurrSocks = {
		P = 35,
		Strength = 35
	},
	MirageStripes = {
		P = 30,
		Strength = 30
	},
	Prickly = {
		P = 35,
		Strength = 35
	},
	Thornlace = {
		P = 25,
		Strength = 25
	},
	SandStripes = {
		P = 25,
		Strength = 25
	},
	FletchPattern = {
		P = 25,
		Strength = 25
	},
	SandyDriftPattern = {
		DisplayName = "SandyDrift",
		P = 25,
		Strength = 25
	},
	SharpBurstPattern = {
		DisplayName = "SharpBurst",
		P = 25,
		Strength = 25
	},
	HoyaKorriPattern = {
		DisplayName = "HoyaKerriiPattern",
		EventName = "Valentines2026",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}