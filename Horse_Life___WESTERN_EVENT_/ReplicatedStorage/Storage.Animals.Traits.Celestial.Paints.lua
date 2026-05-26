-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	FloatingStars = {
		P = 35,
		Strength = 35
	},
	StarCore = {
		P = 35,
		Strength = 35
	},
	CelestialOrbsPaint = {
		P = 35,
		Strength = 35
	},
	CelestialSparseStarsPaint = {
		P = 35,
		Strength = 35
	},
	CelestialStarPaint = {
		P = 35,
		Strength = 35
	},
	SunStarPaint = {
		P = 35,
		Strength = 35
	},
	FaceStarStripes = {
		P = 40,
		Strength = 40
	},
	AlignedStars = {
		P = 35,
		Strength = 35
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}