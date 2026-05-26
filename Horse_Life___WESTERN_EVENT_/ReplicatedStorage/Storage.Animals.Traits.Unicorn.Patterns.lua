-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 40
	},
	MagicScales = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Kelpie",
		CrossbreedStrength = 15
	},
	MarbleStripes = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Equus",
		CrossbreedStrength = 10
	},
	OkapiBack = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Equus",
		CrossbreedStrength = 10
	},
	StarDapple = {
		P = 25,
		Strength = 40
	},
	DeerSpots = {
		P = 25,
		Strength = 40
	},
	SnowflakeDapple = {
		P = 25,
		Strength = 40
	},
	Illuminated = {
		P = 25,
		Strength = 35
	},
	HindSmoke = {
		P = 25,
		Strength = 40
	},
	SideSwirls = {
		P = 25,
		Strength = 40
	},
	StarChest = {
		P = 25,
		Strength = 40
	},
	StarFaceFreckles = {
		P = 25,
		Strength = 40
	},
	HindStarBurst = {
		P = 25,
		Strength = 40
	},
	FrontChimera = {
		P = 25,
		Strength = 35
	},
	FrontalRosette = {
		P = 25,
		Strength = 25
	},
	SolarPattern = {
		P = 25,
		Strength = 25
	},
	CorruptedFace = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 25
	},
	CorruptedLegs = {
		EventName = "Halloween2025",
		P = 0,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}