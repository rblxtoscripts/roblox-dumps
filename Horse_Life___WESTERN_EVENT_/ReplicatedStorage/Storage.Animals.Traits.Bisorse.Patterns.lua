-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	BBackStripe = {
		DisplayName = "BackStripe",
		P = 40,
		Strength = 40
	},
	BFlecks = {
		DisplayName = "Flecks",
		P = 40,
		Strength = 40
	},
	MoiledMask = {
		P = 40,
		Strength = 40
	},
	BBackPatch = {
		DisplayName = "BackPatch",
		P = 40,
		Strength = 40
	},
	FrontDairyCow = {
		P = 35,
		Strength = 35
	},
	TaperedThigh = {
		P = 35,
		Strength = 35
	},
	TaperedFace = {
		P = 35,
		Strength = 35
	},
	TaperedBody = {
		P = 35,
		Strength = 35
	},
	TaperedForelimbs = {
		P = 35,
		Strength = 35
	},
	MessySpots = {
		P = 30,
		Strength = 30
	},
	SpeckledBack = {
		P = 30,
		Strength = 30
	},
	MoiledBody = {
		P = 25,
		Strength = 25
	},
	FrontCoverSpots = {
		P = 25,
		Strength = 25
	},
	HindDairyCow = {
		P = 25,
		Strength = 25
	},
	SandstormFront = {
		P = 20,
		Strength = 20
	},
	JaggedStripes = {
		P = 20,
		Strength = 20
	},
	SandstormBack = {
		P = 30,
		Strength = 30
	},
	SandstormThigh = {
		P = 35,
		Strength = 35
	},
	WildBeastStripesPattern = {
		P = 35,
		Strength = 35
	},
	BanditMask = {
		P = 35,
		Strength = 35
	},
	BanditPatches = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}