-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	LowerLashMarks = {
		P = 40,
		Strength = 40
	},
	SparseSpots = {
		P = 40,
		Strength = 40
	},
	StitchedHeart = {
		P = 35,
		Strength = 35
	},
	NeckHeartStitch = {
		P = 35,
		Strength = 35
	},
	ShootingStar = {
		P = 35,
		Strength = 35
	},
	ThighHeart = {
		P = 30,
		Strength = 30
	},
	SpottyCape = {
		P = 30,
		Strength = 30
	},
	SimpleSpots = {
		P = 30,
		Strength = 30
	},
	Lush = {
		P = 30,
		Strength = 30
	},
	SimpleStriping = {
		P = 30,
		Strength = 30
	},
	ThighSkull = {
		P = 25,
		Strength = 25
	},
	StarburstLegs = {
		P = 25,
		Strength = 25
	},
	SplatteredTorso = {
		P = 25,
		Strength = 25
	},
	ScarecrowPatches = {
		P = 25,
		Strength = 25
	},
	Constellation = {
		P = 25,
		Strength = 25
	},
	SplashyCape = {
		P = 25,
		Strength = 25
	},
	Nebula = {
		P = 15,
		Strength = 15
	},
	ReindeerPattern = {
		P = 10,
		Strength = 20
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}