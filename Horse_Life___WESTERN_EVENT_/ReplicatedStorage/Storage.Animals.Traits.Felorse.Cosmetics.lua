-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	CourseBackFur = {
		P = 40,
		Strength = 40
	},
	CourseNeckFur = {
		P = 40,
		Strength = 40
	},
	LeopardChestFur = {
		P = 35,
		Strength = 35
	},
	LeopardHeadCosmetic = {
		P = 40,
		Strength = 40
	},
	LeopardNeckFur = {
		P = 30,
		Strength = 30
	},
	LionChinFur = {
		P = 40,
		Strength = 40
	},
	LionLegFluff = {
		P = 40,
		Strength = 40
	},
	LionLegFur = {
		P = 40,
		Strength = 40
	},
	ChaoticBackFur = {
		P = 25,
		Strength = 25
	},
	ChaoticBellyFur = {
		P = 25,
		Strength = 25
	},
	FelineArmFeathers = {
		P = 40,
		Strength = 40
	},
	LynxBellyFur = {
		P = 40,
		Strength = 40
	},
	LynxCheekFur = {
		P = 40,
		Strength = 40
	},
	WildClaws = {
		P = 40,
		Strength = 40
	},
	WildHair = {
		P = 40,
		Strength = 40
	},
	FabelCheekFur = {
		DisplayName = "FableCheekFur",
		P = 40,
		Strength = 40
	},
	FabelChinFur = {
		DisplayName = "FableChinFur",
		P = 40,
		Strength = 40
	},
	FabelSideFur = {
		DisplayName = "FableSideFur",
		P = 40,
		Strength = 40
	},
	FadedAnkelFur = {
		DisplayName = "FadedAnkleFur",
		P = 30,
		Strength = 30
	},
	FadedJawFur = {
		P = 30,
		Strength = 30
	},
	FadedStomachFur = {
		P = 30,
		Strength = 30
	},
	FadedThighFur = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}