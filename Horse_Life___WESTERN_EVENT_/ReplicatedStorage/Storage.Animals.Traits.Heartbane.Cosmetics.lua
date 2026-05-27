-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	LovelyAnkleGrowth = {
		P = 25,
		Strength = 25
	},
	LovelyHindGrowth = {
		P = 25,
		Strength = 25
	},
	LovelyShoulderGrowth = {
		P = 25,
		Strength = 25
	},
	TwistedWoodSpine = {
		P = 15,
		Strength = 15
	},
	WeepingAnkleFur = {
		P = 25,
		Strength = 25
	},
	WildAnkleTuff = {
		DisplayName = "WildAnkleTuft",
		P = 30,
		Strength = 30
	},
	WildEarTuff = {
		DisplayName = "WildEarTuft",
		P = 30,
		Strength = 30
	},
	WildFacialTuff = {
		DisplayName = "WildFacialTuft",
		P = 30,
		Strength = 30
	},
	WildStomachTuff = {
		DisplayName = "WildStomachTuft",
		P = 30,
		Strength = 30
	},
	CurlyBeard = {
		P = 25,
		Strength = 25
	},
	CurlyLongEars = {
		P = 25,
		Strength = 25
	},
	HShortBellyFur = {
		DisplayName = "ShortBellyFur",
		P = 30,
		Strength = 30
	},
	ShortHindFur = {
		P = 30,
		Strength = 30
	},
	ShortNeckFur = {
		P = 30,
		Strength = 30
	},
	FluffyAnkeFur = {
		DisplayName = "FluffyAnkleFur",
		P = 30,
		Strength = 30
	},
	HeartsCage = {
		P = 15,
		Strength = 15
	},
	WillowAnkleLeaves = {
		P = 15,
		Strength = 15
	},
	WillowBellyLeaves = {
		P = 15,
		Strength = 15
	},
	BackFluffRidge = {
		P = 30,
		Strength = 30
	},
	SecretHeartAnkleTufts = {
		P = 30,
		Strength = 30
	},
	SecretHeartEarTufts = {
		P = 15,
		Strength = 15
	},
	EnchantedAnkleFur = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}