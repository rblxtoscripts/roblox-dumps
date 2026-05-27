-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	Honeysplash = {
		P = 25,
		Strength = 25
	},
	SakuraPetals = {
		P = 25,
		Strength = 25
	},
	PollenSpeckle = {
		P = 25,
		Strength = 25
	},
	PollenHindPatch = {
		P = 15,
		Strength = 15
	},
	PowderedSnout = {
		P = 25,
		Strength = 25
	},
	FloweringPaint = {
		P = 25,
		Strength = 25
	},
	HoneycombPaint = {
		P = 25,
		Strength = 25
	},
	HornetLegStripes = {
		P = 25,
		Strength = 25
	},
	HornetPaint = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}