-- https://lua.expert/
local t = {
	Nothing = {
		P = 50,
		Strength = 40
	},
	FelinePattern = {
		P = 30,
		Strength = 30
	},
	HunterPattern = {
		P = 25,
		Strength = 25
	},
	LeopardPattern = {
		P = 35,
		Strength = 35
	},
	TwoTonedBodyStripes = {
		P = 40,
		Strength = 40
	},
	ChaoticPattern = {
		P = 25,
		Strength = 25
	},
	SharpFlankStripes = {
		P = 25,
		Strength = 25
	},
	SharpMask = {
		P = 25,
		Strength = 25
	},
	StripedBack = {
		P = 25,
		Strength = 25
	},
	StripedFace = {
		P = 25,
		Strength = 25
	},
	StripedLegs = {
		P = 25,
		Strength = 25
	},
	WildBodyMarkings = {
		P = 25,
		Strength = 25
	},
	WildFaceMarkings = {
		P = 25,
		Strength = 25
	},
	WildLegMarkings = {
		P = 25,
		Strength = 25
	},
	BengalRosettesBodice = {
		P = 25,
		Strength = 25
	},
	BengalRosettesFacial = {
		P = 25,
		Strength = 25
	},
	BengalRosettesLegs = {
		P = 25,
		Strength = 25
	},
	FadedPattern = {
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