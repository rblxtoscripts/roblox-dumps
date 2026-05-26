-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	KoiFishPattern = {
		P = 35,
		Strength = 35
	},
	EelPattern = {
		P = 40,
		Strength = 40
	},
	ArowanaScales = {
		P = 30,
		Strength = 30
	},
	TigerSharkStripes = {
		P = 25,
		Strength = 25
	},
	FairyMermaidPattern = {
		P = 30,
		Strength = 30
	},
	OrcaCape = {
		P = 30,
		Strength = 30
	},
	OceanDragon = {
		P = 40,
		Strength = 40
	},
	BettaPattern = {
		P = 40,
		Strength = 40
	},
	HeartScalePattern = {
		EventName = "Valentines2026",
		P = 0,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}