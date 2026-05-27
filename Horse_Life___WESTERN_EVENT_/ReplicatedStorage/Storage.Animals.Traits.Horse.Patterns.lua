-- https://lua.expert/
local t = {
	Nothing = {
		P = 0,
		Strength = 40
	},
	PrimalStripes = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Equus",
		CrossbreedStrength = 15
	},
	LatteSwirl = {
		Theme = "Halloween",
		EventName = "Halloween2025",
		P = 0,
		Strength = 15
	},
	Corrupted = {
		Theme = "Halloween",
		EventName = "Halloween2025",
		P = 0,
		Strength = 15
	},
	LimbSpots = {
		P = 25,
		Strength = 40
	},
	Spots = {
		P = 25,
		Strength = 40
	},
	HeadDiamond = {
		P = 25,
		Strength = 40
	},
	NoseFreckles = {
		P = 25,
		Strength = 40
	},
	RippledCover = {
		P = 25,
		Strength = 35
	},
	BigSpots = {
		P = 25,
		Strength = 40
	},
	StreakedSpots = {
		P = 25,
		Strength = 40
	},
	Freckling = {
		P = 25,
		Strength = 40
	},
	StreakingSpots = {
		P = 25,
		Strength = 40
	},
	HindSpots = {
		P = 25,
		Strength = 40
	},
	BodyStripeStreaks = {
		P = 25,
		Strength = 40
	},
	BackStripe = {
		P = 25,
		Strength = 40
	},
	NeckStripes = {
		P = 25,
		Strength = 40
	},
	FacialFreckles = {
		P = 25,
		Strength = 40
	},
	HeavyDapple = {
		P = 25,
		Strength = 35
	},
	BackPatch = {
		P = 25,
		Strength = 40
	},
	BellyDapple = {
		P = 25,
		Strength = 40
	},
	LeopardSpots = {
		P = 25,
		Strength = 25
	},
	KneeStripe = {
		P = 25,
		Strength = 40
	},
	StripedAnkles = {
		P = 25,
		Strength = 40
	},
	HeavyHindSpots = {
		P = 25,
		Strength = 40
	},
	ZigZagStripeMask = {
		P = 25,
		Strength = 40
	},
	BrokenFrontChimera = {
		P = 25,
		Strength = 30
	},
	FaceStreakingDapple = {
		P = 25,
		Strength = 30
	},
	StretchingDapples = {
		P = 25,
		Strength = 25
	},
	ZigZagStripes = {
		P = 25,
		Strength = 25
	},
	PeacockAppaloosa = {
		P = 25,
		Strength = 25
	},
	CandycanePattern = {
		P = 0,
		Strength = 10
	},
	SnowBlanketPattern = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}