-- https://lua.expert/
local t = {
	Nothing = {
		P = 10,
		Strength = 25
	},
	WavyBeard = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	LegFluff = {
		P = 25,
		Strength = 35,
		Type = "Furs"
	},
	AnkleFluff = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	AnkleTufts = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	CheekTufts = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	MohawkFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	ThickBellyFur = {
		P = 25,
		Strength = 40,
		Type = "Furs"
	},
	MysticSocks = {
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