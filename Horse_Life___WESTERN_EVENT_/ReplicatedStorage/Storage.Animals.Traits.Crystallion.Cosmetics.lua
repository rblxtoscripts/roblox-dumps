-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	BackRockGrowths = {
		P = 25,
		Strength = 25
	},
	LegRockGrowths = {
		P = 35,
		Strength = 35
	},
	CrystalFaceWings = {
		P = 40,
		Strength = 40
	},
	CrystalNeckWings = {
		P = 20,
		Strength = 20
	},
	CrystalThighWings = {
		P = 35,
		Strength = 35
	},
	CrystalTrain = {
		P = 25,
		Strength = 25
	},
	CrystalWingFeathering = {
		P = 25,
		Strength = 25
	},
	HindQuartzOutgrowths = {
		P = 40,
		Strength = 40
	},
	LegQuartsOutgrowths = {
		P = 35,
		Strength = 35
	},
	NeckCrystals = {
		P = 30,
		Strength = 30
	},
	QuartzSleeves = {
		P = 30,
		Strength = 30
	},
	CollarGemGrowth = {
		P = 30,
		Strength = 30
	},
	ElegantBodyCrystals = {
		P = 30,
		Strength = 30
	},
	ElegantLegCrystals = {
		P = 30,
		Strength = 30
	},
	ElegantNeckCrystals = {
		P = 30,
		Strength = 30
	},
	HeadGemGrowth = {
		P = 30,
		Strength = 30
	},
	HindGemGrowth = {
		P = 30,
		Strength = 30
	},
	LegGemGrowth = {
		P = 30,
		Strength = 30
	},
	CrystalButterflyLegPlates = {
		P = 30,
		Strength = 30
	},
	CrystalButterflySocks = {
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