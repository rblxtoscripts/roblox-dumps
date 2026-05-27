-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	Ribstones = {
		P = 40,
		Strength = 40
	},
	ScaledFaceMask = {
		P = 40,
		Strength = 40
	},
	Orca = {
		P = 40,
		Strength = 40
	},
	Scaling = {
		P = 40,
		Strength = 40
	},
	ShreddedBack = {
		P = 30,
		Strength = 30
	},
	LaLlorona = {
		P = 30,
		Strength = 30
	},
	GullMarking = {
		P = 30,
		Strength = 30
	},
	SunkenCrest = {
		P = 30,
		Strength = 30
	},
	Sunken = {
		P = 30,
		Strength = 30
	},
	MarshStripes = {
		P = 25,
		Strength = 25
	},
	PearlCover = {
		P = 25,
		Strength = 25
	},
	ScaledBackstripe = {
		P = 25,
		Strength = 25
	},
	Fishbones = {
		P = 25,
		Strength = 25
	},
	FishScales = {
		P = 25,
		Strength = 25
	},
	Ribbed = {
		P = 25,
		Strength = 25
	},
	CapedRoan = {
		P = 25,
		Strength = 25
	},
	Serpentine = {
		P = 25,
		Strength = 25
	},
	LionfishStripes = {
		P = 25,
		Strength = 25
	},
	RipplePattern = {
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