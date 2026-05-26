-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	OvergrowthPattern = {
		P = 40,
		Strength = 25
	},
	RoseVinePattern = {
		P = 40,
		Strength = 25
	},
	SpeckledPattern = {
		P = 35,
		Strength = 35
	},
	TwistedHeartPattern = {
		P = 30,
		Strength = 30
	},
	BrokenSpotsPattern = {
		P = 25,
		Strength = 25
	},
	CurloveSwirlsPattern = {
		P = 20,
		Strength = 20
	},
	WillowWindsPattern = {
		P = 20,
		Strength = 20
	},
	BeastStripes = {
		P = 35,
		Strength = 35
	},
	HoofHearts = {
		P = 40,
		Strength = 40
	},
	SecretHeartPattern = {
		P = 30,
		Strength = 30
	},
	EnchantedPattern = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}