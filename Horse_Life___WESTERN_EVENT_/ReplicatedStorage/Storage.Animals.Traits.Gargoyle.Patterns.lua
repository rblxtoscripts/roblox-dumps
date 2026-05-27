-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	ChestCracking = {
		P = 40,
		Strength = 40
	},
	SideStones = {
		P = 35,
		Strength = 35
	},
	BodySwirls = {
		P = 35,
		Strength = 35
	},
	OreVeins = {
		P = 25,
		Strength = 25
	},
	SidePebbles = {
		P = 35,
		Strength = 35
	},
	RidgedPebbles = {
		P = 25,
		Strength = 35
	},
	HeavyUndereyeMask = {
		P = 25,
		Strength = 35
	},
	FullbodyCracking = {
		P = 25,
		Strength = 35
	},
	FaceCracks = {
		P = 25,
		Strength = 35
	},
	Fractures = {
		P = 25,
		Strength = 35
	},
	RunicStriping = {
		P = 25,
		Strength = 35
	},
	SkeletonPattern = {
		P = 25,
		Strength = 35
	},
	Stormpatch = {
		P = 35,
		Strength = 35
	},
	ShadowStripe = {
		P = 35,
		Strength = 35
	},
	BottomCover = {
		P = 30,
		Strength = 30
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return {
	Patterns = t
}