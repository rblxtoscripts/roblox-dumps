-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	SnakeheadStreaks = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Kelpie",
		CrossbreedStrength = 10
	},
	PrimalSpots = {
		P = 25,
		Strength = 30
	},
	HindStripes = {
		P = 25,
		Strength = 40
	},
	LegStripes = {
		P = 25,
		Strength = 40
	},
	UpperStripes = {
		P = 25,
		Strength = 40
	},
	Flecks = {
		P = 25,
		Strength = 40
	},
	FrontPatch = {
		P = 25,
		Strength = 40
	},
	FullbodyStripes = {
		P = 20,
		Strength = 30
	},
	StreakingStripes = {
		P = 20,
		Strength = 30
	},
	RaggedBackStripes = {
		P = 20,
		Strength = 30
	},
	DonkeyStripe = {
		P = 20,
		Strength = 30
	},
	BodySpots = {
		P = 20,
		Strength = 30
	},
	FrontSplotches = {
		P = 20,
		Strength = 30
	},
	ThighSplotches = {
		P = 20,
		Strength = 30
	},
	BodySpots = {
		P = 20,
		Strength = 30
	},
	ScarceChimera = {
		P = 20,
		Strength = 25
	},
	ThighStripes = {
		P = 20,
		Strength = 25
	},
	FrontStripe = {
		P = 20,
		Strength = 20
	},
	LycaonPattern = {
		P = 20,
		Strength = 20
	},
	Aardwolf = {
		P = 20,
		Strength = 20
	},
	MudSplotchPattern = {
		P = 20,
		Strength = 20
	},
	StripedBackPattern = {
		P = 20,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}