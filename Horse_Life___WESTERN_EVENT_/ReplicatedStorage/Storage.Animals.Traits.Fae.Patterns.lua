-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	FlyArgaric = {
		DisplayName = "FlyAgaric",
		P = 35,
		Strength = 40
	},
	BirchMarkings = {
		P = 35,
		Strength = 20
	},
	LeafyBody = {
		P = 35,
		Strength = 35
	},
	AppleSlice = {
		P = 35,
		Strength = 30
	},
	BirchPattern = {
		P = 35,
		Strength = 20
	},
	Fern = {
		P = 35,
		Strength = 30
	},
	Windswept = {
		P = 35,
		Strength = 30
	},
	CrackedBark = {
		P = 35,
		Strength = 20
	},
	Pebbling = {
		P = 35,
		Strength = 40
	},
	SideLeaves = {
		P = 35,
		Strength = 40
	},
	RainforestRunes = {
		P = 35,
		Strength = 40
	},
	Raindrops = {
		P = 35,
		Strength = 35
	},
	LaurelLeaves = {
		P = 35,
		Strength = 35
	},
	RollingClouds = {
		P = 30,
		Strength = 30
	},
	BirchLegStripes = {
		P = 35,
		Strength = 20
	},
	FairyShadows = {
		P = 35,
		Strength = 20
	},
	AcornSpots = {
		P = 35,
		Strength = 20
	},
	OakBark = {
		P = 35,
		Strength = 10
	},
	ScrapedRabicano = {
		P = 35,
		Strength = 10
	},
	EnchantedTree = {
		P = 35,
		Strength = 10
	},
	BladedGrass = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Flora",
		CrossbreedStrength = 15
	},
	ForestRoses = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Flora",
		CrossbreedStrength = 15
	},
	LeafScales = {
		P = 0,
		Strength = 5,
		CrossbreedRequirement = "Kelpie",
		CrossbreedStrength = 15
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}