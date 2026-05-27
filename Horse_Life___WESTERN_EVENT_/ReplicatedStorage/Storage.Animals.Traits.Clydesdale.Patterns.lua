-- https://lua.expert/
local t = {
	Nothing = {
		P = 40,
		Strength = 25
	},
	SplotchBody = {
		P = 40,
		Strength = 40
	},
	Marbling = {
		P = 30,
		Strength = 30
	},
	SlimMosaic = {
		P = 35,
		Strength = 35
	},
	CJaggedStripes = {
		DisplayName = "JaggedStripes",
		P = 25,
		Strength = 25
	},
	CBackPatch = {
		DisplayName = "BackPatch",
		P = 30,
		Strength = 30
	},
	FewSpots = {
		P = 35,
		Strength = 35
	},
	MoltenSabino = {
		P = 25,
		Strength = 25
	},
	SoraStripe = {
		P = 30,
		Strength = 30
	},
	MuddyHooves = {
		P = 30,
		Strength = 30
	},
	SootyBayPattern = {
		P = 30,
		Strength = 30
	},
	DunMask = {
		P = 40,
		Strength = 40
	},
	DunBackStripe = {
		P = 35,
		Strength = 35
	},
	DunLegStripes = {
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