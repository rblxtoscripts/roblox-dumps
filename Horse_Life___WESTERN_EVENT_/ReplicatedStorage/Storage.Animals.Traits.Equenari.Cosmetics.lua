-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	CheekMandible = {
		P = 35,
		Strength = 35
	},
	FrilledAnkles = {
		P = 25,
		Strength = 25
	},
	FrilledMidsection = {
		P = 30,
		Strength = 30
	},
	FrilledThighs = {
		P = 25,
		Strength = 25
	},
	HeavyBoots = {
		P = 30,
		Strength = 30
	},
	ShoulerFrills = {
		DisplayName = "ShoulderFrills",
		P = 35,
		Strength = 35
	},
	TendrilBodyCosmetic = {
		P = 35,
		Strength = 35
	},
	TendrilLegCosmetic = {
		P = 25,
		Strength = 25
	},
	TendrilNeckCosmetic = {
		P = 35,
		Strength = 35
	},
	TendrilThighCosmetic = {
		P = 25,
		Strength = 25
	},
	BranchingArmSpikes = {
		P = 20,
		Strength = 20
	},
	BranchingChestSpikes = {
		P = 35,
		Strength = 35
	},
	BranchingJawSpikes = {
		P = 35,
		Strength = 35
	},
	BranchingLegSpikes = {
		P = 20,
		Strength = 20
	},
	BranchingSockSpikes = {
		P = 25,
		Strength = 25
	},
	ExoskeletonChestSpikes = {
		P = 30,
		Strength = 30
	},
	ExoskeletonRibs = {
		P = 25,
		Strength = 25
	},
	ExoskeletonUpperLegSpikes = {
		P = 20,
		Strength = 20
	},
	ExoskeletonLowerLegSpikes = {
		P = 30,
		Strength = 30
	},
	RoyalAnkelGrowth = {
		DisplayName = "RoyalAnkleGrowth",
		P = 35,
		Strength = 35
	},
	RoyalNeckGrowth = {
		P = 30,
		Strength = 30
	},
	RoyalShinGrowth = {
		DisplayName = "RoyalChinGrowth",
		P = 35,
		Strength = 35
	},
	PredatoryLegGrowth = {
		P = 30,
		Strength = 30
	},
	ArmouredBodyGrowth = {
		P = 30,
		Strength = 30
	},
	ArmouredLegGrowth = {
		P = 30,
		Strength = 30
	},
	SensoryHairs = {
		P = 35,
		Strength = 35
	},
	EldritchBackGrowth = {
		P = 25,
		Strength = 25
	},
	EldritchSideGrowth = {
		P = 30,
		Strength = 30
	},
	HadelLegGrowth = {
		P = 25,
		Strength = 25
	},
	HoopBodyGrowth = {
		P = 35,
		Strength = 35
	},
	EldritchLegGrowth = {
		P = 30,
		Strength = 30
	},
	SeradedLegGrowth = {
		DisplayName = "SerratedLegGrowth",
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