-- https://lua.expert/
local t = {
	Nothing = {
		P = 30,
		Strength = 25
	},
	HMBackStripe = {
		DisplayName = "BackStripe",
		P = 40,
		Strength = 40
	},
	RippedLegs = {
		P = 25,
		Strength = 25
	},
	RipsPattern = {
		DisplayName = "RibsPattern",
		P = 35,
		Strength = 35
	},
	ReaperPattern = {
		P = 25,
		Strength = 25
	},
	FrontBoneRunes = {
		P = 40,
		Strength = 40
	},
	LegBoneRunes = {
		P = 40,
		Strength = 40
	},
	PhoenixMarkings = {
		P = 40,
		Strength = 40
	},
	RibMarkings = {
		P = 40,
		Strength = 40
	},
	SpottedOrbs = {
		P = 40,
		Strength = 40
	},
	EndlessEyes = {
		P = 30,
		Strength = 30
	},
	GhoulishFace = {
		P = 25,
		Strength = 25
	},
	OcularPaint = {
		P = 25,
		Strength = 25
	},
	WarPaint = {
		P = 35,
		Strength = 35
	},
	HMStitches = {
		DisplayName = "Stitches",
		P = 25,
		Strength = 25
	},
	SpiderWebCage = {
		P = 25,
		Strength = 25
	},
	DeepScales = {
		P = 30,
		Strength = 30
	},
	EldritchSpots = {
		P = 30,
		Strength = 30
	},
	TornFlames = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}