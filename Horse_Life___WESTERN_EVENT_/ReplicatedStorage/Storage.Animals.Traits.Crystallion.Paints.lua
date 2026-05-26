-- https://lua.expert/
local t = {
	Nothing = {
		P = 35,
		Strength = 35
	},
	GlimmerPaint = {
		P = 30,
		Strength = 30
	},
	ShinePaint = {
		P = 40,
		Strength = 40
	},
	SparklesPaint = {
		P = 35,
		Strength = 35
	},
	GlossPaint = {
		P = 25,
		Strength = 25
	},
	FullBodyGlitter = {
		P = 25,
		Strength = 25
	},
	BandedSwirls = {
		P = 40,
		Strength = 40
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Paints"
end
return {
	Paints = t
}